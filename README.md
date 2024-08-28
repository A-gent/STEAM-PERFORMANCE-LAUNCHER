# STEAM-PERFORMANCE-LAUNCHER
This is a launcher that helps you launch Steam in modes that consume less system resources / network resources.

You can set the "LaunchMethod" to commandline option in the config.cfg file to force the launcher to default to the given batch files for maximum performance increase, or if that option does not work for you (won't launch) then you can set "LaunchMethod" to BrowserProtocol to launch Steam using the Mini mode instead which gives less of a boost but still gives a boost.


If there are issues launching with both ways, set "LaunchMethod" to BrowserProtocol and then turn the "WhiteLionMacFix" option to 1. If issues persist, increase the "SteamDelay" option, which is the delay in miliseconds between when Steam will attempt to launch the minimal mode. If Steam does not open in mini mode even with "WhiteLionMacFix" set to 1, then increase "SteamDelay" which is by default at 4 seconds (4000 miliseconds); so for example increasing it to 25 seconds would be 25000.


Additionally, you can also turn the "EnableBreakpad" option to 1 as well for troubleshooting.
