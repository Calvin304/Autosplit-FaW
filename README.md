# Autosplit-FaW

## setup:

1. download flashplayer_31_sa_debug.exe aka "Flash Player projector content debugger" from https://www.adobe.com/support/flashplayer/debug_downloads.html for your system archetecture
	windows x64 download: https://fpdownload.macromedia.com/pub/flashplayer/updaters/32/flashplayer_32_sa_debug.exe
2. place inclueded mm.cfg in %USERPROFILE%\mm.cfg
3. edit livesplit layout -> add -> control -> scriptable auto splitter, double click on scriptable auto splitter and set the script path to the included Autosplit-FaW.asl
4. run the-forest-temple.swf in flashplayer_32_sa_debug.exe

## debug:
0. make sure the name of the flash player exe matches at least one of the states in Autosplit-FaW.asl
1. check %APPDATA%\Macromedia\Flash Player\Logs\flashlog.txt after starting the game, 
	if it doesnt contain "1.- file:///C|/path/to/swf/the%2Dforest%2Dtemple.swf -so- false" then check/redo steps 1-2
2. download https://docs.microsoft.com/en-us/sysinternals/downloads/debugview and watch for livesplit errors, you may need to contact Calvin304#2397 on discord for support
