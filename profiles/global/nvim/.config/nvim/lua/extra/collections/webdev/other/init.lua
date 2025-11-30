local Other = {}

Other.css = require("extra.collections.webdev.other.css")
Other.html = require("extra.collections.webdev.other.html")
Other.svelte = require("extra.collections.webdev.other.svelte")
Other.tailwindcss = require("extra.collections.webdev.other.tailwindcss")

function Other.setup()
	Other.html:setup()
	Other.css:setup()
	Other.svelte:setup()
	Other.tailwindcss.setup()
end

return Other
