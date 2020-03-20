state("flashplayer_31_sa_debug") {}
state("flashplayer_32_sa_debug") {}

init {
    string appDataFolder = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData);
    string logPath = Path.Combine(appDataFolder, "Macromedia\\Flash Player\\Logs\\flashlog.txt");
    
    try { // Wipe the log file to clear out messages from last time
        FileStream fs = new FileStream(logPath, FileMode.Open, FileAccess.Write, FileShare.ReadWrite);
        fs.SetLength(0);
        fs.Close();
    } catch {} // May fail if file doesn't exist.
    vars.reader = new StreamReader(new FileStream(logPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite)); 
}

update {
    vars.line = vars.reader.ReadLine();
    if (vars.line == null) return false; // If no line was read, don't run any other blocks.
}

start {
    return vars.line == "Main_Menu";
}

split {
    return vars.line == "Level_End";
}

reset {
    return vars.line.StartsWith("1.- file:");
}