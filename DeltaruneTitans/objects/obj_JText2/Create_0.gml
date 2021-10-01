surface_resize(application_surface, 1280, 720);

message = 0;
read = 0;
active = 0;
stop = 5;

talk[0] = "Determination, Determination.#What hast this power be?";
talk[1] = "It is one I have never seen!";
talk[2] = "But lo, SEVEN souls I hold.";
talk[3] = "Let us not wait,#let our little game begin.";
talk[4] = "Well, you know the rules!#It's just a numbers game.";
talk[5] = "You run out of HP, you lose, lose!";

if (global.star_table[0][3] == 2)
    {
    talk[0] = "Wheelchair, Wheelchair.#What hast this chair be?";
    talk[1] = "It is one I see!";
    talk[2] = "missingno";
    talk[3] = "Let us wait,#I could break my leg.";
    talk[4] = "Well, you know the rules!#Please go easy.";
    talk[5] = "I hate this wheelchair!";
    }

