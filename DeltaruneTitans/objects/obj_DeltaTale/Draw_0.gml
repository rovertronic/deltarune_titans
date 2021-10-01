draw_set_halign(fa_center);
draw_set_valign(fa_center);
draw_set_color(c_white);
draw_set_font(font3);
if global.NoHitRun == false
    {
    draw_text(640,360,string_hash_to_newline("Fangame By: Rovert#Undertale By: Toby Fox#Jevil Voice: UnknownMeta#Music: RoomTone##www.youtube.com/c/Rovert_YT#www.fiverr.com/unknownmeta#"));
    }
    else
    {
    draw_text(640,360,string_hash_to_newline("You beat him without getting hit?!#Looks like Jevil can't do anything.##Credit to Merg for proving this was possible.#https://www.youtube.com/user/MyEveryRottenGiggles"));
    }
draw_self();

