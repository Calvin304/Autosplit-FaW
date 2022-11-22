
state("flashplayer_32_sa", "Fireboy and Watergirl 1 - The Forest Temple") {
    //game at [[[[["flashplayer_32_sa.exe"+0x00D18438] + 0xFC] + 0x1F0] + 0x38] + 0x9C]
    //double cur_node : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xF0;

    //the following are actually pointers but we only care about when they get overwriten
    uint m_intromenu : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x88;
    uint m_transition : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x7C;
     
    //the following are actually bool with 31 bits of padding 
    uint ended : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xC0, 0x70; 
    uint deadFire : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xC0, 0xF4, 0x14;
    uint deadWater : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xC0, 0xF4, 0x10;
}

state("flashplayer_32_sa", "Fireboy and Watergirl 2 - The Light Temple") {
    //game at [[[[["flashplayer_32_sa.exe"+0x00D18438] + 0xFC] + 0x1F0] + 0x38] + 0x9C]
    //double cur_node : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x120;

    //the following are actually pointers but we only care about when they get overwriten
    uint m_intromenu : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xA0;
    uint m_transition : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0xA8;
     
    //the following are actually bool with 31 bits of padding 
    uint ended : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x88, 0x60; 
    uint deadFire : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x88, 0xD4, 0x10;
    uint deadWater : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x88, 0xDD4, 0x14;
}

state("flashplayer_32_sa", "Fireboy and Watergirl 3 - The Ice Temple") {
    //game at [[[[["flashplayer_32_sa.exe"+0x00D18438] + 0xFC] + 0x1F0] + 0x38] + 0x9C]
    //double cur_node : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, /* unknown */;

    //the following are actually pointers but we only care about when they get overwriten
    uint m_intromenu : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x90;
    uint m_transition : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x98;
     
    //the following are actually bool with 31 bits of padding 
    uint ended : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x78, 0x60; 
    uint deadFire : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x78, 0xE8, 0x10;
    uint deadWater : "flashplayer_32_sa.exe", 0x00D18438, 0xFC, 0x1F0, 0x38, 0x9C, 0x78, 0xE8, 0x14;
}

//state("flashplayer_32_sa", "Fireboy and Watergirl 4 - The Crystal Temple") {}

init {
    version = timer.Run.GameName;
    vars.intro_latest = false;
}

update {
    /* if (current.cur_node != old.cur_node) {
        print("node:" + current.cur_node);
    } */
    if (current.m_intromenu != old.m_intromenu) {
        vars.intro_latest = true;
    }

    
    //print(vars.intro_latest.ToString());
}

start {
    if (vars.intro_latest && current.m_transition != old.m_transition) {
        vars.intro_latest = false;
        return true;
    }
}

split {
    return current.ended == 1 && old.ended == 0 && current.deadFire == 0 && current.deadWater == 0;
}

reset {
    return current.m_intromenu != old.m_intromenu;
}