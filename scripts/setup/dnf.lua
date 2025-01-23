local prompt = require("scripts.setup.lib.prompt")

local dnf = {}

dnf.packages = {
	"kitty",
	"fish",
	"neovim",
	"stow",
	"btop",
	"fastfetch",
	"npm",
	"pnpm",
	"nodejs",
	"python3",
	"pip",
	"luarocks",
	"rust",
}
function dnf.packages:install()
	local packages = ""
	for _, value in ipairs(self) do
		packages = packages .. " " .. value
	end

	prompt(function()
		return os.execute("sudo dnf in -y" .. packages)
	end, {
		question = "Do you want to install the following packages?(this requires sudo previlages!)",
		success_msg = "packages have been installed successfully!",
		fail_msg = "failed to install packages...",
		after = packages,
	})
end

dnf.coprs = {
	-- "atim/lazygit",
}
function dnf.coprs:install()
	prompt(function()
		local result
		for _, copr in ipairs(self) do
			result = os.execute("sudo dnf copr enable --quiet -y " .. copr)
		end
		return result
	end, {
		question = "Do you want to add some coprs?(this requires sudo previlages!)",
		success_msg = "successfully added all coprs!",
		fail_msg = "couldn't add all coprs...",
	})
end

dnf.rpms = {
	vivaldi = "https://downloads.vivaldi.com/stable/vivaldi-stable-7.0.3495.29-1.x86_64.rpm",
	blockbench = "https://github.com/JannisX11/blockbench/releases/download/v4.12.2/Blockbench_4.12.2.rpm",
	vesktop = "https://github.com/Vencord/Vesktop/releases/download/v1.5.4/vesktop-1.5.4.x86_64.rpm",
	heroic = "https://github.com/Heroic-Games-Launcher/HeroicGamesLauncher/releases/download/v2.15.2/heroic-2.15.2.x86_64.rpm",
}
-- TODO: find a way to automate getting the latest versions(maybe I should use jq)
function dnf.rpms:install()
	for key, value in pairs(self) do
		if type(key) == "string" then
		end
	end
end

function dnf:install_additional_stuff()
	-- [rpmfusion](https://rpmfusion.org/RPM%20Fusion)
	prompt(function()
		return os.execute(
			"sudo dnf install "
				.. "-y "
				.. "https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm "
				.. "https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm "
		)
	end, {
		question = "Do you want to add rpmfusion repository to dnf?",
		success_msg = "rpmfusion has been installed successfully!",
		fail_msg = "failed to install rpmfusion...",
	})

	-- [terra repos](https://terra.fyralabs.com)
	prompt(function()
		return os.execute(
			"sudo dnf install "
				.. "--nogpgcheck --repofrompath -y "
				.. "'terra,https://repos.fyralabs.com/terra$releasever' terra-release "
		)
	end, {
		question = "Do you want to add terra repository to dnf?",
		success_msg = "terra has been installed successfully!",
		fail_msg = "failed to install terra...",
	})

	prompt(function()
		-- fedora-cisco-openh264
		os.execute("sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1")

		-- AppStream metadata
		os.execute("sudo dnf update @core")

		-- full ffmpeg
		os.execute("sudo dnf swap ffmpeg-free ffmpeg --allowerasing")

		-- additional media codecs
		os.execute(
			'sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin'
		)

		-- intel
		os.execute("sudo dnf install intel-media-driver")

		-- amd
		os.execute("sudo dnf swap mesa-va-drivers.i686 mesa-va-drivers-freeworld.i686")
		os.execute("sudo dnf swap mesa-vdpau-drivers.i686 mesa-vdpau-drivers-freeworld.i686")

		-- nvidia
		os.execute("sudo dnf install libva-nvidia-driver")

		return true
	end, { question = "Install additional packages?", success_msg = "", fail_msg = "" })
end

return dnf
