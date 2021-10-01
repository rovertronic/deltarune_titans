alarm_set(4,30);
global.Destoul += 1;

if global.SavedSouls == 6
    {
    global.End = 0;
    room_goto(rm_End2);
    }
if global.Destoul == 7 and global.SavedSouls > 0
    {
    global.End = 1;
    room_goto(rm_End2);
    }

