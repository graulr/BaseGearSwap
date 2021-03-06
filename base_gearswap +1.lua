include("organizer-lib")
-------------------------------------------------------------------------------------------
--                           GGGG  RRR     A    U   U L    RRR                           --
--              Crafted by:  G __  R  R   A A   U   U L    R  R                          --
--                           G  G  R r   AAAAA  U   U L    R r                           --
--                           GGGG  R  R A     A UUUUU LLLL R  R                          --
-------------------------------------------------------------------------------------------
-------> Visit https://github.com/graulr/BaseGearSwap/ for setup help and examples <-------
-------------------------------------------------------------------------------------------
--                                                                                       --
--                 To declare a set for a specific ability or spell:                     --
--            sets.midcast.Cure = {}   <- Does not have a space in title                 --
--      sets.midcast["Cure II"] = {}   <- Space in title so ["Spell Name"] must be used  --
--                                                                                       --
--                  Capitalization matters: ["cure II"] won't work!                      --
-------------------------------------------------------------------------------------------


function macro_setup()
    --===================================================================================--
    --                                                                                   --
    --                                        Macros                                     --
    --                                                                                   --
    --===================================================================================--
    -- Set the macro book & page according to your subjob
    -- Example:
    --     set_macro({
    --         DNC={1, 1},
    --         SAM={2, 1},
    --     })
    -- Would set to book 1 page 1 when your subjob is DNC
    -- Would set to book 2 page 1 when subjob is SAM
    --
    -- Modify me!
    --  SUB={Book, Page},
    set_macro({
        DNC={1, 1},
        SAM={2, 1},
    })
end


function get_sets()
    --===================================================================================--
    --                                                                                   --
    --                                       Base Sets                                   --
    --                                                                                   --
    --===================================================================================--
    -- Base sets that flow through all other sets
    --
    -- A General set of gear you will idle in (before and after battle)
    sets.Idle = {}
    IDLE_SET = sets.Idle

    -- A set of gear to engage the monster in
    -- If weapons differ from sets.Idle TP will be lost after each fight
    -- Press the windows key + 6 in game to view
    sets.Engaged = set_combine(IDLE_SET, {})
    ENGAGED_SET = sets.Engaged


    --===================================================================================--
    --                                                                                   --
    --                                    Override Sets                                  --
    --                                                                                   --
    --===================================================================================--
    -- Sets that override when toggled (except for resting)
    -- toggle a 2nd time to disable

    -- A set that focuses purely on potency of damage/healing
    -- Press f9 in game to toggle
    sets.Potency = {}

    -- A set that focuses purely on magic bursting
    -- Press f10 in game to toggle
    sets.Magic_Burst = {}

    -- A set that focuses purely on defense
    -- Press f11 in game to toggle
    sets.Defensive = {}

    -- General override sets for whatever you want
    -- Ex: alternate weapons, treasure hunter sets, skillup sets, etc...
    -- Press windows key + 1 in game to toggle
    sets.ALTERNATE = {}

    -- Press the windows key + 2 in game to toggle
    sets.ALTERNATE_2 = {}

    -- Press the windows key + 3 in game to toggle
    sets.ALTERNATE_3 = {}

    -- Press the windows key + 4 in game to toggle
    sets.ALTERNATE_4 = {}

    -- Press the windows key + 5 in game to toggle
    sets.ALTERNATE_5 = {}


    --===================================================================================--
    --                                                                                   --
    --                                        Precast                                    --
    --                  automatically called *before* the action is initiated            --
    --                                                                                   --
    --===================================================================================--
    sets.precast = {} -- Ignore and don't remove

    -- Fast cast gear
    sets.precast.FastCast = {}

    -- Cure spell *cast time reduction* gear only
    -- Use sets.midcast.Cure for everything else
    sets.precast.Cure = set_combine(sets.precast.FastCast, {})

    -- Enhancing magic *cast time reduction* gear only
    -- Use sets.midcast["Enhancing Magic"] for everything else
    sets.precast["Enhancing Magic"] = set_combine(sets.precast.FastCast, {})


    --===================================================================================--
    --                                                                                   --
    --                                        Midcast                                    --
    --                      automatically called *during* the action                     --
    --                                                                                   --
    --===================================================================================--
    sets.midcast = {} -- Ignore & don't remove


    ---------------------------------------------------------------------------------------
    --                                     Job Abilities                                 --
    ---------------------------------------------------------------------------------------
    --- A General set of ability gear (will swap for all abilities)
    sets.midcast.Ability = set_combine(ENGAGED_SET, {})
    ABILITY = sets.midcast.Ability

    -- Specific abilities:
    sets.midcast.Provoke = set_combine(ABILITY, {})

    -- Corsair Quickdraw (will swap for all versions of Quickdraw)
    sets.midcast.Quickdraw = {}


    ---------------------------------------------------------------------------------------
    --                                    Ranged Attack                                  --
    ---------------------------------------------------------------------------------------
    sets.midcast["Ranged Attack"] = set_combine(ENGAGED_SET, {})
    RANGED_ATTACK = sets.midcast["Ranged Attack"]


    ---------------------------------------------------------------------------------------
    --                                    Weapon Skills                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of weapon skill gear (will swap for all weapon skills)
    sets.midcast["Weapon Skill"] = set_combine(ENGAGED_SET, {})
    WEAPON_SKILL = sets.midcast["Weapon Skill"]

    -- Specific weapon skills:
    sets.midcast["Fast Blade"] = set_combine(WEAPON_SKILL, {})


    ---------------------------------------------------------------------------------------
    --                                    General Magic                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of magic midcast gear (will swap for all magic)
    -- Spell casters should put generic haste gear here
    sets.midcast.Magic = set_combine(ENGAGED_SET, {})
    MAGIC_SET = sets.midcast.Magic


    ---------------------------------------------------------------------------------------
    --                                   Elemental Magic                                 --
    ---------------------------------------------------------------------------------------
    -- A General set of elemental magic gear (will swap for all elemental magic)
    sets.midcast["Elemental Magic"] = set_combine(MAGIC_SET, {})
    ELEMENTAL_MAGIC = sets.midcast["Elemental Magic"]

    -- Specific elemental magic:
    -- Note: These sets will swap for I, II, III, IV, V, ga, ra, & corresponding
    --       ancient magic
    sets.midcast.Stone = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Water = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Aero = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Fire = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Blizzard = set_combine(ELEMENTAL_MAGIC, {})
    sets.midcast.Thunder = set_combine(ELEMENTAL_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Healing Magic                                  --
    ---------------------------------------------------------------------------------------
    -- A General set of healing magic gear (will swap for all healing magic)
    sets.midcast["Healing Magic"] = set_combine(MAGIC_SET, {})
    HEALING_MAGIC = sets.midcast["Healing Magic"]

    -- Specific healing magic:
    -- Note: This will swap for the I, II, III, IV, V, ga, & ra versions of Cure
    sets.midcast.Cure = set_combine(HEALING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                   Enhancing Magic                                 --
    ---------------------------------------------------------------------------------------
    -- A General set of enhancing magic gear (will swap for all enhancing magic)
    sets.midcast["Enhancing Magic"] = set_combine(MAGIC_SET, {})
    ENHANCING_MAGIC = sets.midcast["Enhancing Magic"]

    -- Specific enhancing magic:
    sets.midcast.Stoneskin = set_combine(ENHANCING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                   Enfeebling Magic                                --
    ---------------------------------------------------------------------------------------
    -- A General set of enfeebling magic gear (will swap for all enfeebling magic)
    sets.midcast["Enfeebling Magic"] = set_combine(MAGIC_SET, {})
    ENFEEBLING_MAGIC = sets.midcast["Enfeebling Magic"]

    -- Specific enfeebling magic:
    sets.midcast.Dia = set_combine(ENFEEBLING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                     Blue Magic                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of blue magic gear (will swap for all blue magic)
    sets.midcast["Blue Magic"] = set_combine(MAGIC_SET, {})
    BLUE_MAGIC = sets.midcast["Blue Magic"]

    -- Specific blue magic:
    sets.midcast["Magic Fruit"] = set_combine(BLUE_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                     Dark Magic                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of dark magic gear (will swap for all dark magic)
    sets.midcast["Dark Magic"] = set_combine(MAGIC_SET, {})
    DARK_MAGIC = sets.midcast["Dark Magic"]

    -- Specific dark magic:
    sets.midcast.Drain = set_combine(DARK_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Divine Magic                                   --
    ---------------------------------------------------------------------------------------
    -- A General set of divine magic gear (will swap for all divine magic)
    sets.midcast["Divine Magic"] = set_combine(MAGIC_SET, {})
    DIVINE_MAGIC = sets.midcast["Divine Magic"]

    -- Specific divine magic spells:
    -- Note: This will swap for the I, II, III, IV, V, ga, & ra versions of Banish
    sets.midcast.Banish = set_combine(DIVINE_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                    Summoning Magic                                --
    ---------------------------------------------------------------------------------------
    -- A General set of summoning magic gear (will swap for all summons)
    sets.midcast["Summoning Magic"] = set_combine(MAGIC_SET, {})
    SUMMONING_MAGIC = sets.midcast["Summoning Magic"]

    -- Specific summoning magic spells:
    sets.midcast.Carbuncle = set_combine(SUMMONING_MAGIC, {})


    ---------------------------------------------------------------------------------------
    --                                       Geomancy                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of geomancy gear (will swap for all geomancy)
    sets.midcast.Geomancy = set_combine(MAGIC_SET, {})


    ---------------------------------------------------------------------------------------
    --                                       Ninjitsu                                    --
    ---------------------------------------------------------------------------------------
    -- A General set of ninjitsu gear (will swap for all ninjitsu)
    sets.midcast.Ninjitsu = set_combine(MAGIC_SET, {})


    ---------------------------------------------------------------------------------------
    --                                        Songs                                      --
    ---------------------------------------------------------------------------------------
    -- A general set of song gear (will swap for all songs)
    sets.midcast.Singing = set_combine(ENGAGED_SET, {})
    SINGING = sets.midcast.Singing

    -- Specific song types:
    -- Note: All of these sets will swap for the  II, III, IV, V versions of the song
    sets.midcast.Paeon = set_combine(SINGING, {})
    sets.midcast.Requiem = set_combine(SINGING, {})
    sets.midcast.Lullaby = set_combine(SINGING, {})
    sets.midcast.Ballad = set_combine(SINGING, {})
    sets.midcast.Minne = set_combine(SINGING, {})
    sets.midcast.Minuet = set_combine(SINGING, {})
    sets.midcast.Madrigal = set_combine(SINGING, {})
    sets.midcast.Prelude = set_combine(SINGING, {})
    sets.midcast.Mambo = set_combine(SINGING, {})
    sets.midcast.March = set_combine(SINGING, {})
    sets.midcast.Etude = set_combine(SINGING, {})
    sets.midcast.Carol = set_combine(SINGING, {})
    sets.midcast.Threnody = set_combine(SINGING, {})
    sets.midcast.Finale = set_combine(SINGING, {})
    sets.midcast.Mazurka = set_combine(SINGING, {})
    sets.midcast.Elegy = set_combine(SINGING, {})
    sets.midcast.Virelai = set_combine(SINGING, {})


    --===================================================================================--
    --                                                                                   --
    --                                      Aftercast                                    --
    --                  automatically called *after* the action occurs                   --
    --                                                                                   --
    --===================================================================================--
    sets.aftercast = {} -- Ignore and don't remove


    ---------------------------------------------------------------------------------------
    --                                       Resting                                     --
    ---------------------------------------------------------------------------------------
    -- MP+ / HP+ resting gear
    sets.aftercast.Resting = set_combine(IDLE_SET, {})


    --===================================================================================--
    --                                                                                   --
    --                                  Status Effect Sets                               --
    --                                                                                   --
    --===================================================================================--
    -- Sets that will be swapped in when the status effect lands on the player
    -- & swapped out when the status is removed

    -- Will also swap for flash & accuracy down
    sets.Blind = {}

    sets.Doom = {}

    sets.Silence = {}

    sets.Slow = {}

    sets.Sleep = {}

    sets.Paralyze = {}

    sets.Poison = {}

    sets.Attack_Down = {}

    sets.STR_Down = {}

    sets.DEX_Down = {}

    sets.VIT_Down = {}

    sets.AGI_Down = {}

    sets.INT_Down = {}

    sets.MND_Down = {}

    sets.CHR_Down = {}


    --===================================================================================--
    --                                                                                   --
    --                                     Cosmetic Sets                                 --
    --                                                                                   --
    --===================================================================================--
    -- Sets you might not be using for content but are fun to walk
    -- around in. Equipped via: //gs c equip AF

    -- Press the windows_key + 8 in game
    sets.AF = {}

    -- Press the windows_key + 9 in game
    sets.AF2 = {}

    -- Press the windows_key + 0 in game
    sets.AF3 = {}


    --===================================================================================--
    --                                                                                   --
    --                                      Craft Sets                                   --
    --                                                                                   --
    --===================================================================================--
    -- Sets for crafting

    -- Press the windows_key + numpad 1 in game
    sets.Alchemy = {}

    -- Press the windows_key + numpad 2 in game
    sets.Bonecraft = {}

    -- Press the windows_key + numpad 3 in game
    sets.Clothcraft = {}

    -- Press the windows_key + numpad 4 in game
    sets.Cooking = {}

    -- Press the windows_key + numpad 5 in game
    sets.Fishing = {}

    -- Press the windows_key + numpad 6 in game
    sets.Goldsmithing = {}

    -- Press the windows_key + numpad 7 in game
    sets.Leathercraft = {}

    -- Press the windows_key + numpad 8 in game
    sets.Woodworking = {}

    -- Press the windows_key + numpad 9 in game
    sets.Smithing = {}

    -- Press the windows_key + numpad 0 in game
    sets.Synergy = {}


     ------------------------------------ End of gearsets ----------------------------------
    -- Sets macros and other states on load
    initialize_setup()
end

--=======================================================================================--
--                                                                                       --
--                                     Optional Config                                   --
--                                                                                       --
--=======================================================================================--
-- Setting to true keeps the last user triggered gear change equipped until either
-- 1.  User triggers another event causing a swap
-- 2.  Battle ends
-- Useful for casters who want to see spell animations
-- Can also be toggled in game via: //gs c toggle keep_gear
keep_gear_until_next_event = false


--=======================================================================================--
--=======================================================================================--
--========================== Alter code below at your own risk! =========================--
--=======================================================================================--
--=======================================================================================--
-- ....'',,,,,,,,,,,,,,,;;;;;:lokOdolodk00OOKXXXXXXXXKkxkk0Okkkxxdxkkocccc:::::;;:::;,,,'''
-- ....''',,,,,,,,,,,,,,;;:::cok0kolldxk00000XXXXNNNXXK0kk00kxxddddxkkdccccc:::::::;;,,,,''
-- .....''',,;,,,,,,;;;;;::::lxOxollldxkkkxxkkOKXNNNNXNXK000Oxxdddddxk0xllcccc::cc:;;,,,,''
-- .....''',,;;;,;;;;;;::::coxxdlllodxkkxxkkk0KKKKXNNNNNNXXK0kxxxxkkxx0Kxllccccccc:;;,,,'''
-- ....'''',,;;;;;;;;;::::cdxdoloddxxxxxkkOO00OOkO0KXXXNNNNXKOOkkkkOOOO0Kklllcllc::;;,,,'''
-- ...''''',,,;::;;;;:::codxxddxdddxkkOkxkkk00kxxkk0KKKXKKXXK0OOOOOOOOOOKKklllllc:;;;,,,'''
-- .....'''',,;:::::::::oOK00kxkxdxkkOkkxkOkOOkxxxk00OKKOO0KKK0000KKK0K00KKkooolc:;;;,,''''
-- ...'''''',,;;:cc:::cco0XXKKKOxddkOOOkkOOkkOkkxxkOOOKKOOOKKXXXXXXXXXK00KKKkdoc::;;;,,''''
-- ....''''',,,;:cccccldx0XXK00KOdxOOOOkOOkkOOxxxxxkk0XXK00KXXXXNNXXXXXKKK0KKxlc::;;,,,'''.
-- ......'''',,;;cllccokO0XKOkk00O0KK0kkkOkO00xdddxxOKXXX00KXXXXXXXXXXXXKKXX0dcc::;,,,'''..
-- ......''',,,;;:clllokxkKXKKKXXKOO00kkOKKKXKxooddxk0KKKK0XNXXXNNXXXXXXKXNKxlcc:;;;,,'''..
-- ......''',,,;;:clooolloOXXXXXX0OkkOOkkO00K0xdddxkOO0KKKKXNNNNNNNNNNNNXNNOolcc:;;;,,''...
-- .....'''',,,;;cl_/       \_NNXN_/  _____/___________   __ __|  |_______NN0dcc::;,,,'''..
-- .....'''',,,,:c_|   The   |_XK_/   \  __\_  __ \__  \ |  |  \  |\_  __ \N0dcc::;,,,'''..
-- .....'''',,,:cl_|   Old   |_XC_\    \_\  \  | \// __ \|  |  /  |_|  | \/ddolc:;,,'......
---.....'''',,,:l;d_\_Guard_/_XkK0_\______  /__|  (____  /____/|____/__|NNNNOolcc::;;,,''..
-- .....'',,;;::ccllodxOOxxkK0xooooxxOOOOOOOO0OkOKNK0KK0000KXK0KX0KNNNNNNNXkddolc:;,,'.....
-- ....''',;;::clooddxkOKXKOO00kkOOOkxkxddxOKNWWMMMWNNNXKNWWWWWWWWWWWWWNNNXOxxolc:;,''.....
-- .''''',,;;:ccloddxxkOKNX0O00OOOOkddkkxxxk0NWWWMMWWNXKKNNWWWWWWWMMMWWWNNX0kxdlc:;,''.....
-- '''''',,;;:cllodxkkO0KNNK0OOOOOOxodkxdddxk0XNNNXOddkOO0KWMMMWMMMMMMWWXXX0kxdlc;,,'''....
-- ''''',,,;;:cclodxkO00XNNX0OO0Oxxdk0ko:;,'',:coOx;x.,;;;,0MMMWMMMMMMMWXNNKkxol:;;,,'''...
-- ''',,,,,;;:cclodxO00KXXXKK00KOdxOKKx;.........;c;..;...;0MMMMMMMMMMWWNWN0kdoc:;;,,,''''.
-- ''',,,,,;;::clodxO0KXNNNNXK00kdkKX0c...........:;..,;;;,xKWMMMMWWWWWWWWN0xolc::;;;,,,,,;
-- ,,,,,,,;;;::clodxk0KXNNNNNNKOxdO0Oo'............'.,;oxOkKWMWWWWWWWWMWWWN0xolcc:::;;;;;;;
-- ,,,,,,;;;;::cclodkOKXNNNXKKKkxkOxd:..............,,.Okx0NWWWWWNWNNWWWNNXOxollcc::::;;;;;
-- ,,,,,,;;;;;::ccodxk0XNWNNXXX0OOOOd,..............,;dxxkKWMMMWWWWNNNNNNNKkdollcc:::;;;;;;
-- ,,,,,,,,;;;;::ccldxOKXWMWNXKXKO0KOc'...........'.,oooxKWMMMMWWWWWNXNNN0kdollcc:::;;;;;;;
-- ,,,,,,,,,,;;;::ccloxOKNWMWNXKXKO00dc:'.......'::,cdod0WMMMMWWWWWWNNNXOxdolcc:::;;;;;;;;;
-- ;,,,,,,,,;;;;;:::cldk0XWMMWWXKK0OOxl;'.......',cldxxkKWMMMWWWWWWWWWXOkdolcc::;;;;;::::::
-- ;;;;;;;;;;;;;;::clloxkKNNXK0kl;:lool:,'.....',;clol;,cx0KKXNWWWWWWX0kxdolccc:::::c:::ccc
-- :::::::::::::::ccloodxOkolxd:'...';:,'''..'''',;:,....;oxldXMWMMWNKOkdollcccccccccclllll
-- lccccccccccccccclloodxkkl,,'......';;.........';,.......,,xWMMMMWX0kxdoolllllllllooooooo
-- ooloooooooooooooooddxkOOl'..    ...................    ...oNMMMMWX0Okxxddddddddxxxxxxxkk
-- OOOOOOOOOOOOOOOOOOO000XO;....   ....................   ...'kWMMMMWNXKK0000000000000KK000
-- KK00KKKKKKKKKKKKKKKKKKKl..... ';......... .........::......,0MMMWNNXXKKKKKKKKKKKKKKKKKKK
-- KKKKKKKKKKKKKKKKKKKKKKd'......xx'.......  .. ......dXl... ..:KWWNXKKKKKKKKKKKKKKKKKKKKKK
-- KKKKXXXXKKKKKKXXXKKKKk;...  .oNk'.......   . ......oWXl. ....:0XKKKKKKKKKKKKKKKKK00KKK0K
-- XKXXXXKKKKKKKKKKXKKKO:.... .cXWXk:....    .   ....oXWWXl. ....:OKKKKKKKKKKKKKKKKKKKKKKKK
-- XXXXXKKKXXXXXXXXXXXKc...   ,ONNWWd.    .....   ...oWWNMX:  ....;kKKKKKXKKXXXKKXXXXXXXXXX
-- XXXXXXXXXXXXXXXNNNXl..... .lXXKXKl............... .xNWWNd. .....;kKKKKKKKXXXKXXXXXXXKKKK
-- NNNNNNNNNNNNNXNNXKo'..... .kXXXKo'.................'kWNXO, ......;oOXXXXXXXXXXXXXXXXXXXX
-- NNNNNNNNNNNNNNNXx;........:0XXKl'.....,;'..,;,'.....,xXXO;.........oXNNNXNNNNNNNNNNNNNNN
-- NNNNNNNNNNNNNNNXl.........,ONKl......,;;'..,;;'......'dX0:.....''..lKNNNXXXNNNNNNNNNWWWW
-- NNNNNNNNNNNNXXNXl.''..''..cKNo.......''.....'''.......'dXk,.'...'..lKXXXXXNNNNNNNNNWWWWW
-- NNNNNNNNNNNNNNNXl.....'..;ON0;........       ..........,ONk,......,kNNNNNNNNNNNNNNNNNNNN
-- NNNNNNNNWWWWNNNNO;......c0NNx.......            ........lNWx'.....;0WWWWWWWWNNNNNNNNNNNN
-- NNNNNWWWWWWWWWWWO,.....,0WWNl.....               .......'kWx..'....xWWWWWWWWWWNNNNNNWNNN
-- WWWWWWWWWWWWWWMWx...,;.,0WWK; ...        ..       .......cXk.';...'kWWWWWWWWWWWWWWWWWWWW
-- WWWWWWWWWWWMWWWWKc.....;KWWO' ..         ':.        .... 'OXl...'cONWWWWWWMWWMMWWWWWWWMM
-- WWMMMMMMMMMMMMMWWNkc,':OWWMKo,.          .c;         ....,OMN0O0XWWMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMWWWWWWWWWWWNXNWMMMWW0'           ,:..        ...;KMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMWd.           .;:.           .dWMMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMM0,             ,l'            ,0MMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMNl..            ,o;.           .dWMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMWx.:;            .c:.            ;KMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMK,,0d.           .:l,            .kMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMNl.xWO'    ..     .;xc        ..  .dMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMk'lNMWx. ........ .;kk.    ...... .kMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMWOdKMMMWx,.'''''...:xKX: ..........:XMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWO:'',,''',dKNWk'...'''''';kWMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWk:',,,,''.',oXWk;''',,,,'lNMMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNo...........cXMXo''',,,,,;oKMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK:.........'dWWx'...''''...kMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO,.......;dKMWk,.........,0MMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWO,......oXNMMNd.........:XMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWx.....'lOXMMMNd'.......oWMMMMMMMMMMMMMMMMMMMMMMMMMMM
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO,...',;ckWMMMWd'.....'kWWWWWWWMMMMMMMMMMMMMMMMMWWWW
-- MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMk;..';,;ckWMMMMO;'....'xWMMMMMMMMMMMMMMMMMMMMMWWWWWW
--=======================================================================================--
--=======================================================================================--
--========================== Alter code below at your own risk! =========================--
--=======================================================================================--
--=======================================================================================--


--=======================================================================================--
--                                                                                       --
--                       Functions automatically called by gearswap                      --
--                                                                                       --
--=======================================================================================--

function precast(spell)
    if spell.action_type == "Magic" then
        spell_gear = get_gear_for_spell(spell)

        -- Cure & MND
        if spell.name:sub(1,3) == "Cur" and spell.name ~= "Cursna" then
            equip_with_overrides(set_combine(spell_gear, sets.precast.Cure))

        -- Enhancing
        elseif spell.skill == "Enhancing Magic" then
            equip_with_overrides(set_combine(spell_gear, sets.precast["Enhancing Magic"]))

        -- General fast cast
        elseif not sets.precast.FastCast == {} then
            equip_with_overrides(set_combine(spell_gear, sets.precast.FastCast))
        end
    end
end

function midcast(spell)
    midaction(false)
    equip(get_gear_for_spell(spell))
end

function aftercast(spell)
    if toggle_overrides.keep_gear == true then
        equip_with_overrides(spell)
    elseif player.status == "Engaged" then
        equip_with_overrides(sets.Engaged)
    elseif player.status == "Resting" then
        equip(sets.aftercast.Resting)
    else
        equip_with_overrides(sets.Idle)
    end
end

function status_change(new, old)
    if new == "Resting" then
        equip(sets.aftercast.Resting)
    elseif new == "Engaged" then
        equip_with_overrides(sets.Engaged)
    elseif new == "Idle" then
        equip_with_overrides(sets.Idle)
    end
end

function buff_change(buff, gain, details)
    current_set = {}
    buff = string.lower(buff)

    if has_key(status_effect_map, buff) then
        buff_map = status_effect_map[buff]
        -- Status was gained
        if gain == true then
            if buff_map["is_effect_on"] == false then
                buff_map["is_effect_on"] = true
                if not (buff_map["set"] == {}) then
                    equip_status_with_overrides(buff_map["set"])
                end
            end
        -- Status was lost
        elseif buff_map["is_effect_on"] == true then
            buff_map["is_effect_on"] = false
            if not (buff_map["set"] == {}) then
                equip_status_with_overrides()
            end
        end
    end
end

function sub_job_change(new, old)
    macro_setup()
    equip_with_overrides(sets.Idle)
end

function self_command(command)
    lower_command = string.lower(command)

    -- Help commands
    if (lower_command == "help") then
        display_message("Command options:")
        display_message("//gs c toggle alternate 1")
        display_message("//gs c toggle alternate 2")
        display_message("//gs c toggle alternate 3")
        display_message("//gs c toggle alternate 4")
        display_message("//gs c toggle alternate 5")
        display_message("//gs c toggle keep_gear")
        display_message("//gs c equip spell_name")
        display_message("--------------------------------")
        display_message("Type //gs c help <option> to learn more about that option")
    elseif (lower_command == "help toggle alternate 1") then
        display_message("Toggles sets.ALTERNATE to override all other swaps")
    elseif (lower_command == "help toggle alternate 2") then
        display_message("Toggles sets.ALTERNATE_2 to override all other swaps")
    elseif (lower_command == "help toggle alternate 3") then
        display_message("Toggles sets.ALTERNATE_3 to override all other swaps")
    elseif (lower_command == "help toggle alternate 4") then
        display_message("Toggles sets.ALTERNATE_4 to override all other swaps")
    elseif (lower_command == "help toggle alternate 5") then
        display_message("Toggles sets.ALTERNATE_5 to override all other swaps")
    elseif (lower_command == "help toggle keep_gear") then
        display_message("Toggling keep_gear will skip Engaged and Idle transitions during battle")
    elseif (lower_command:sub(1,10) == "help equip") then
        display_message("Equips any set that matches the spell_name supplied (capitalization matters)")
        display_message("--------------------------------")
        display_message("Examples:")
        display_message("//gs c equip Fast Blade")
        display_message("//gs c equip Ranged")
        display_message("//gs c equip Resting")
        display_message("//gs c equip Cure")
        display_message("//gs c equip Elemental Magic")

    -- Toggle commands
    elseif (lower_command == "toggle keep_gear") then
        update_toggle_override("keep_gear")
    elseif (lower_command == "toggle potency") then
        update_toggle_override("potency")
    elseif (lower_command == "toggle defensive") then
        update_toggle_override("defensive")
    elseif (lower_command == "toggle magic burst") then
        update_toggle_override("magic_burst")
    elseif (lower_command:sub(1,16) == "toggle alternate") then
        alternate_value = lower_command:sub(18, 19)
        if (alternate_value == "1") then
            toggle_alternate_override(1)
        elseif (alternate_value == "2") then
            toggle_alternate_override(2)
        elseif (alternate_value == "3") then
            toggle_alternate_override(3)
        elseif (alternate_value == "4") then
            toggle_alternate_override(4)
        elseif (alternate_value == "5") then
            toggle_alternate_override(5)
        end

    -- Equip commands
    elseif (lower_command:sub(1,6) == "equip ") then
        -- Use the original command as get_gear_for_spell requires capitalization
        display_message("Equipping " .. command:sub(7))
        equip(get_gear_for_spell(nil, command:sub(7)))
    end
end


--=======================================================================================--
--                                                                                       --
--                                  Helper methods                                       --
--                                                                                       --
--=======================================================================================--

-- Initialize state variables, bind any keys, & setup macros
function initialize_setup()
    toggle_overrides = get_default_toggle_override_map()
    send_command("bind f9 gs c toggle potency")
    send_command("bind f10 gs c toggle magic burst")
    send_command("bind f11 gs c toggle defensive")
    send_command("bind f12 gs c toggle alternate 1")
    -- @ represents the windows key
    send_command("bind @1 gs c toggle alternate 1")
    send_command("bind @2 gs c toggle alternate 2")
    send_command("bind @3 gs c toggle alternate 3")
    send_command("bind @4 gs c toggle alternate 4")
    send_command("bind @5 gs c toggle alternate 5")
    send_command("bind @7 gs c equip Engaged")
    send_command("bind @8 gs c equip AF")
    send_command("bind @9 gs c equip AF2")
    send_command("bind @0 gs c equip AF3")
    send_command("bind @numpad1 gs c equip Alchemy")
    send_command("bind @numpad2 gs c equip Bonecraft")
    send_command("bind @numpad3 gs c equip Clothcraft")
    send_command("bind @numpad4 gs c equip Cooking")
    send_command("bind @numpad5 gs c equip Fishing")
    send_command("bind @numpad6 gs c equip Goldsmithing")
    send_command("bind @numpad7 gs c equip Leathercraft")
    send_command("bind @numpad8 gs c equip Smithing")
    send_command("bind @numpad9 gs c equip Synergy")
    send_command("bind @numpad0 gs c equip Woodworking")

    alternate_override = 0
    toggle_overrides.keep_gear = keep_gear_until_next_event
    stored_macro_map = nil
    status_effect_map = get_default_status_effect_map()
    macro_setup()

    -- Equip idle on zone change (handles death)
    windower.register_event('zone change', function()
        equip_with_overrides(sets.Idle)
    end)
end

-- Unbind all keys
function file_unload()
    send_command("unbind f9")
    send_command("unbind f10")
    send_command("unbind f11")  
    send_command("unbind f12")
    -- @ represents the windows key
    send_command("unbind @1")
    send_command("unbind @2")
    send_command("unbind @3")
    send_command("unbind @4")
    send_command("unbind @5")
    send_command("unbind @7")
    send_command("unbind @8")
    send_command("unbind @9")
    send_command("unbind @0")
    send_command("unbind @numpad1")
    send_command("unbind @numpad2")
    send_command("unbind @numpad3")
    send_command("unbind @numpad4")
    send_command("unbind @numpad5")
    send_command("unbind @numpad6")
    send_command("unbind @numpad7")
    send_command("unbind @numpad8")
    send_command("unbind @numpad9")
    send_command("unbind @numpad0")
end

-- Get a new default toggle map with all values initalized to false
function get_default_toggle_override_map()
    return {
        potency=false,
        defensive=false,
        magic_burst=false,
        keep_gear=false
    }
end

-- Get a new status effect map with all is_effect_on initialized to false
function get_default_status_effect_map()
    return {
        blind=get_initial_status_effect_map_val(sets.Blind),
        flash=get_initial_status_effect_map_val(sets.Blind),
        accuracy_down=get_initial_status_effect_map_val(sets.Blind),
        doom=get_initial_status_effect_map_val(sets.Doom),
        slience=get_initial_status_effect_map_val(sets.Silence),
        slow=get_initial_status_effect_map_val(sets.Slow),
        sleep=get_initial_status_effect_map_val(sets.Sleep),
        paralyze=get_initial_status_effect_map_val(sets.Paralyze),
        poison=get_initial_status_effect_map_val(sets.Poison),
        attack_down=get_initial_status_effect_map_val(sets.Attack_Down),
        str_down=get_initial_status_effect_map_val(sets.STR_Down),
        dex_down=get_initial_status_effect_map_val(sets.DEX_Down),
        vit_down=get_initial_status_effect_map_val(sets.VIT_Down),
        agi_down=get_initial_status_effect_map_val(sets.AGI_Down),
        int_down=get_initial_status_effect_map_val(sets.INT_Down),
        mnd_down=get_initial_status_effect_map_val(sets.MND_Down),
        chr_down=get_initial_status_effect_map_val(sets.CHR_Down),
    }
end

function get_initial_status_effect_map_val(set)
    return {is_effect_on=false, set=set}
end

-- Update toggle_override on a fresh map and display a message
function update_toggle_override(key)
    current_value = toggle_overrides[key]
    toggle_overrides = get_default_toggle_override_map()
    toggle_overrides[key] = not current_value
    display_toggle_message(toggle_overrides[key], key)
    equip_status_with_overrides()
end

-- Update the alternate_override value
function set_alternate(number)
    if number == 0 then
        display_message("Using primary gearset")
    else
        display_message("Enabling alternate override " ..number)
    end
    alternate_override = number
    equip_status_with_overrides()
end

-- Toggle the alternate override between 0 and provided number
function toggle_alternate_override(number)
    if (alternate_override == number) then
        set_alternate(0)
    else
        set_alternate(number)
    end
end

-- Get the appropriate gearset for the spell
function get_gear_for_spell(spell, spell_name)
    if (spell ~= nil) then
        spell_name = spell.name
        spell_type = spell.type
        spell_skill = spell.skill
        spell_action_type = spell.action_type
    end

    current_set = {}

    -- Resting
    if spell_name == "Resting" or spell_name == "Rest" then
        current_set = sets.aftercast.Resting

    -- Name match
    elseif sets.midcast[spell_name] then
        current_set = sets.midcast[spell_name]
    elseif sets[spell_name] then
        current_set = sets[spell_name]

    -- Ranged Attack
    elseif spell_name == "Ranged" then
        current_set = sets.midcast["Ranged Attack"]

    -- Corsair Quickdraw must be detected by type
    elseif spell_type == "CorsairShot" then
        current_set = sets.midcast.Quickdraw

    -- Abilities
    elseif spell_skill == "Ability" then
        current_set = sets.midcast.Ability

    -- Weapon Skills
    elseif spell_type == "WeaponSkill" then
        current_set = sets.midcast["Weapon Skill"]

    -- Songs
    elseif spell_skill == "Singing" then
        if string.find(spell_name, "Paeon") then
            current_set = sets.midcast.Paeon
        elseif string.find(spell_name, "Requiem") then
            current_set = sets.midcast.Requiem
        elseif string.find(spell_name, "Lullaby") then
            current_set = sets.midcast.Lullaby
        elseif string.find(spell_name, "Ballad") then
            current_set = sets.midcast.Ballad
        elseif string.find(spell_name, "Minne") then
            current_set = sets.midcast.Minne
        elseif string.find(spell_name, "Minuet") then
            current_set = sets.midcast.Minuet
        elseif string.find(spell_name, "Madrigal") then
            current_set = sets.midcast.Madrigal
        elseif string.find(spell_name, "Prelude") then
            current_set = sets.midcast.Prelude
        elseif string.find(spell_name, "Mambo") then
            current_set = sets.midcast.Mambo
        elseif string.find(spell_name, "Etude") then
            current_set = sets.midcast.Etude
        elseif string.find(spell_name, "March") then
            current_set = sets.midcast.March
        elseif string.find(spell_name, "Carol") then
            current_set = sets.midcast.Carol
        elseif string.find(spell_name, "Threnody") then
            current_set = sets.midcast.Threnody
        elseif string.find(spell_name, "Finale") then
            current_set = sets.midcast.Finale
        elseif string.find(spell_name, "Mazurka") then
            current_set = sets.midcast.Mazurka
        elseif string.find(spell_name, "Elegy") then
            current_set = sets.midcast.Elegy
        elseif string.find(spell_name, "Virelai") then
            current_set = sets.midcast.Virelai
        else -- General singing
            current_set = sets.midcast.Singing
        end

    elseif spell_action_type == "Magic" then
        if spell_skill == "Healing Magic" then
            if string.find(spell_name, "Cure") then
                current_set = sets.midcast.Cure
            else -- General healing
                current_set = sets.midcast["Healing Magic"]
            end

        -- Enhancing Magic
        elseif spell_skill == "Enhancing Magic" then
            current_set = sets.midcast["Enhancing Magic"]

        -- Blue Magic
        elseif spell_skill == "Blue Magic" then
            current_set = sets.midcast["Blue Magic"]

        -- Dark Magic
        elseif spell_skill == "Dark Magic" then
            current_set = sets.midcast["Dark Magic"]

        -- Divine Magic
        elseif spell_skill == "Divine Magic" then
            if string.find(spell_name, "Banish") then
                current_set = sets.midcast.Banish
            else -- General divine
                current_set = sets.midcast["Divine Magic"]
            end

        -- Enfeebling Magic
        elseif spell_skill == "Enfeebling Magic" then
            current_set = sets.midcast["Enfeebling Magic"]

        -- Summoning Magic
        elseif spell_skill == "Summoning Magic" then
            current_set = sets.midcast["Summoning Magic"]

        -- Geomancy
        elseif spell_skill == "Geomancy" then
            current_set = sets.midcast.Geomancy

        -- Ninjitsu
        elseif spell_skill == "Ninjitsu" then
            current_set = sets.midcast.Ninjitsu

        -- Elemental Magic
        elseif spell_skill == "Elemental Magic" then

            -- Specific spells
            if string.find(spell_name, "Ston") or string.find(spell_name, "Quake") then
                current_set = sets.midcast.Stone
            elseif string.find(spell_name, "Wat") or string.find(spell_name, "Flood") then
                current_set = sets.midcast.Water
            elseif string.find(spell_name, "Aer") or string.find(spell_name, "Tornado") then
                current_set = sets.midcast.Aero
            elseif string.find(spell_name, "Fir") or string.find(spell_name, "Flare") then
                current_set = sets.midcast.Fire
            elseif string.find(spell_name, "Blizz") or string.find(spell_name, "Freeze") then
                current_set = sets.midcast.Blizzard
            elseif string.find(spell_name, "Thund") or string.find(spell_name, "Burst") then
                current_set = sets.midcast.Thunder
            else -- General elemental
                current_set = sets.midcast["Elemental Magic"]
            end
        else -- General magic
            current_set = sets.midcast.Magic
        end
    end

    return combine_overrides(current_set)
end

-- Conditionally override the supplied gearset with override sets
function combine_overrides(gearset)
    -- Handle any keybinding overrides
    if toggle_overrides.potency == true then
        gearset = set_combine(gearset, sets.Potency)
    elseif toggle_overrides.defensive == true then
        gearset = set_combine(gearset, sets.Defensive)
    elseif toggle_overrides.magic_burst == true then
        gearset = set_combine(gearset, sets.Magic_Burst)
    end

    -- Handle any alternate overrides
    if alternate_override == 1 then
        gearset = set_combine(gearset, sets.ALTERNATE)
    elseif alternate_override == 2 then
        gearset = set_combine(gearset, sets.ALTERNATE_2)
    elseif alternate_override == 3 then
        gearset = set_combine(gearset, sets.ALTERNATE_3)
    elseif alternate_override == 4 then
        gearset = set_combine(gearset, sets.ALTERNATE_4)
    elseif alternate_override == 5 then
        gearset = set_combine(gearset, sets.ALTERNATE_5)
    end

    -- Handle any status overrides
    for _, buff_map in pairs(status_effect_map) do
        if buff_map["is_effect_on"] == true then
            gearset = set_combine(gearset, buff_map["set"])
        end
    end

    return gearset
end

-- Equip while factoring overrides
function equip_with_overrides(gearset)
    equip(combine_overrides(gearset))
end

-- Equip gear for the current status factoring in overrides
function equip_status_with_overrides(gearset)
    if (gearset == nil) then
        gearset = {}
    end

    if player.status == "Idle" then
        equip_with_overrides(set_combine(sets.Idle, gearset))
    elseif player.status == "Engaged" then
        equip_with_overrides(set_combine(sets.Engaged, gearset))
    elseif player.status == "Resting" then
        equip(sets.aftercast.Resting)
    end
end

function display_message(message)
    add_to_chat(8, message)
end

function display_toggle_message(condition, description)
    if condition then
        display_message("Enabling " .. description .. " override")
    else
        display_message("Disabling " .. description .. " override")
    end
end

function set_macro(macro_map)
    if stored_macro_map == nil then
        stored_macro_map = macro_map
    end

    for key, value in pairs(stored_macro_map) do

        -- Match the key to the current subjob
        if tostring(key) == player.sub_job then
            book_num = tostring(value[1])
            page_num = tostring(value[2])
            send_command("input /macro book " .. book_num .. ";wait .1;input /macro set " .. page_num)
            display_message("Setting current macros to book " .. book_num .. ", page " .. page_num)
        end
    end
end

function has_key(tab, key)
    for table_key, map in pairs(tab) do
        if table_key == key then
            return true
        end
    end
    return false
end
