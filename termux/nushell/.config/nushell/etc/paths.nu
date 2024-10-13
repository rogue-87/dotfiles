# To add entries to PATH (on Windows you might use Path), you can use the following pattern:
# $env.PATH = ($env.PATH | split row (char esep) | prepend '/some/path')
# An alternate way to add entries to $env.PATH is to use the custom command `path add`
# which is built into the nushell stdlib:
# use std "path add"
# $env.PATH = ($env.PATH | split row (char esep))
# path add /some/path
# path add ($env.CARGO_HOME | path join "bin")
# path add ($env.HOME | path join ".local" "bin")
# $env.PATH = ($env.PATH | uniq)

use std "path add"
$env.PNPM_HOME = ( $env.HOME | path join ".local/share/pnpm")

path add ~/.npm/packages/bin/
path add ~/.wakatime/
path add ~/.cargo/bin/
path add ~/.spicetify/
path add $env.PNPM_HOME
