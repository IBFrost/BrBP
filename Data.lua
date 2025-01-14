--[[
ClassMask id
1  - 1    - Warrior
2  - 2    - Paladin
3  - 4    - Hunter
4  - 8    - Rogue
5  - 16   - Priest
6  - 32   - Death Knight
7  - 64   - Shaman
8  - 128  - Mage
9  - 256  - Warlock
10 - 512  - Monk
11 - 1024 - Druid
12 - 2048 - Demon Hunter
--]]



--[[
Wrath loot tables depend on this setting
Changing it demands a new required addon version

Classic:
    1.0: Initial
    1.5: AQ40 server attunement quest items added to raid loot

TBC:
    2.0: Prepatch
    2.1: Initial
    2.2: S1 arena gear available from tokens
    2.3: S2 arena gear available from tokens
    2.5: S3 arena gear available from tokens

Wrath:
    3.0: Prepatch: Naxx 60 removed, Amani War Bear removed from ZA
    3.1: Naxxramas / EoE / OS
    3.2: Ulduar, new VoA boss. Naxx/EoE/OS 10m drop 25m items instead, except the mount in OS.
    3.3: ToC / Ony, new VoA boss. Ulduar25 drops changed.
    3.4: ICC, new VoA boss
    3.5: RS

Cata:
    4.0: ZG and ZA removed
    4.1: Bastion of Twilight, Blackwing Descent, Throne of Four Winds, Baradin Hold (only Argaloth)
    4.2: Firelands, Occu'thar added to Baradin Hold
    4.?: Alizabal added to Baradin Hold
--]]

local SEASON_NUMBER = ((C_Seasons or {}).GetActiveSeason or nop)() or 0;
local SEASONS = {
    MASTERY   = 1,
    DISCOVERY = 2,
};
local EXPANSION_PHASE
if LootReserve:GetCurrentExpansion() == 0 then
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        EXPANSION_PHASE = 1.0; -- Season of Discovery
    else
        EXPANSION_PHASE = 1.5; -- Classic Era
    end
else
    EXPANSION_PHASE = 4.1; -- Classic
end

local hidden = { Hidden = true };

local factionAlliance = { Faction = "Alliance" };
local factionHorde    = { Faction = "Horde" };


local function Squish(t)
    local result = { };
    for k in pairs(t) do
        table.insert(result, k);
    end
    table.sort(result);
    for i, k in ipairs(result) do
        result[i] = t[k];
    end
    return result;
end

local function ConcatenateIf(t1, bool, t2)
    if bool then
        for _, v in ipairs(t2) do
            table.insert(t1, v);
        end
    end
    return t1;
end

local function ShortCircuit(expression, trueVal, falseVal)
    if expression then
        return trueVal
    else
        return falseVal
    end
end


LootReserve.Data =
{
    Categories =
    {
        [-100] = {
            Children =
            Squish{
                { Name = "My Reserves", Reserves = "my" },
                { Name = "All Reserves", Reserves = "all" },
                { Name = "|TInterface\\AddOns\\LootReserve\\Assets\\Textures\\FavoriteWhite:16:16:0:-1:32:32:7:25:2:20|t Favorites", Favorites = true },
                { Name = "|TInterface\\Common\\UI-SearchBox-Icon:16:16:2:-2|t Search Results", SearchResults = true },
            },
        },
        [-50] = {
            Name = "Custom",
            Custom = true,
            Children =
            Squish{
                { Name = "Edited Items", Edited = true },
                { Name = "Custom Items", Custom = true },
            },
        },
        
        
        -- Season of Discovery
        
        [910] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Blackfathom Deeps",
            ButtonName = "[10] Blackfathom Deeps",
            NameShort = "BFD",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Baron Aquanis",
                    Loot =
                    {
                        211852, 209828, 209421, 204804, 209676, 0,
                        209423, 209825, 209422, 209677, 0,
                        209590, 204807, 0,
                    },
                },
                {
                    Name = "Ghamoo-Ra",
                    Loot =
                    {
                        209432, 209675, 209524, 209678, 209418, 209824, 0,
                        209523, 0,
                        209436, 209424, 209830, 0,
                    },
                },
                {
                    Name = "Lady Sarevess",
                    Loot =
                    {
                        211842, 209679, 211789, 209527, 209566, 211843, 0,
                        209680, 209565, 209823, 0,
                        209822, 209525, 209564, 209563, 0,
                    },
                },
                {
                    Name = "Gelihast",
                    Loot =
                    {
                        209683, 209671, 209669, 209670, 211507, 211509, 211508, 209569, 209572, 211510, 211512, 211511, 209568, 211505, 211504, 211506, 0,
                        209820, 209681, 209821, 0,
                        209570, 209571, 209573, 209559, 209567, 0,
                        211491, 0,
                    },
                },
                {
                    Name = "Lorgus Jett",
                    Loot =
                    {
                        209683, 209671, 209669, 209578, 211507, 211509, 211508, 211510, 211512, 211511, 209682, 211504, 211505, 209581, 211506, 0,
                        209576, 209575, 209574, 0,
                        209818, 209577, 209579, 209560, 0,
                    },
                },
                {
                    Name = "Twilight Lord Kelris",
                    Loot =
                    {
                        209667, 209672, 211455, 211507, 211510, 211512, 211511, 211505, 211504, 211506, 211457, 0,
                        209668, 209686, 209673, 209817, 209816, 0,
                        211458, 209694, 209561, 209674, 209688, 0,
                        211492, 0,
                    },
                },
                {
                    Name = "Aku'mai",
                    Loot =
                    {
                        209684, 209669, 209685, 211508, 209687, 211510, 211511, 209692, 209689, 209690, 211505, 0,
                        211456, 209691, 209580, 209688, 209534, 209562, 0,
                        209693, 211452, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        209683, 209671, 209669, 0,
                        211507, 211509, 211508, 0,
                        211510, 211512, 211511, 0,
                        211505, 211504, 211506, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        211450, 211451, 211449, 0,
                    },
                },
            },
        }),
        [920] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Gnomeregan",
            ButtonName = "[10] Gnomeregan",
            NameShort = "Gnomer",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Grubbis",
                    Loot =
                    {
                        213321, 213323, 213322, 213324, 213304, 213326, 213327, 213288, 213294, 0,
                        215437, 215435, 215436, 0,
                        213542, 213351, 0,
                        216490, 0,
                        213427, 0,
                    },
                },
                {
                    Name = "Viscous Fallout",
                    Loot =
                    {
                        213290, 213285, 213301, 213299, 213413, 213302, 0,
                        213307, 0,
                        213291, 213352, 213353, 213355, 0,
                        213289, 0,
                        213427, 0,
                    },
                },
                {
                    Name = "Electrocutioner 6000",
                    Loot =
                    {
                        217008, 217009, 217007, 0,
                        215377, 215379, 215378, 213300, 213298, 213414, 213319, 213279, 213418, 0,
                        213309, 213287, 0,
                        213560, 213286, 213354, 213293, 213559, 0,
                        216494, 0,
                        213427, 0,
                    },
                },
                {
                    Name = "Crowd Pummeler 9-60",
                    Loot =
                    {
                        213415, 213340, 213278, 213317, 213305, 0,
                        213412, 213295, 213442, 213408, 210741, 213292, 213419, 0,
                        215449, 0,
                        213427, 0,
                    },
                },
                {
                    Name = "The Mechanical Menagerie",
                    Loot =
                    {
                        217008, 217009, 217007, 0,
                        215377, 215379, 215378, 213318, 213303, 213280, 213320, 213325, 213417, 215380, 0,
                        213306, 213308, 0,
                        213297, 213410, 213296, 213411, 0,
                        213427, 0,
                    },
                },
                {
                    Name = "Mekgineer Thermaplugg",
                    Loot =
                    {
                        217350, 217351, 0,
                        217008, 217009, 217007, 0,
                        215377, 215379, 215378, 213281, 0,
                        213283, 213282, 213284, 215461, 213347, 213348, 213350, 213349, 213417, 0,
                        213409, 213416, 213356, 0,
                        216608, 13325, 0,
                        213427, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        213311, 213329, 213336, 0,
                        213310, 213328, 213337, 0,
                        213313, 213332, 213341, 0,
                        213312, 213331, 213342, 0,
                        213314, 213333, 213339, 0,
                        213315, 213334, 213338, 0,
                        213316, 213330, 213335, 0,
                        216485, 216486, 216484, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        213345, 213346, 213344, 213343, 0,
                    },
                },
            },
        }),
        [925] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Temple of Atal'Hakkar",
            ButtonName = "[20] Temple of Atal'Hakkar",
            NameShort = "ST",
            Color = LootReserve.Constants.Colors.Size20,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Atal'alarion",
                    Loot =
                    {
                        220637, 220636, 0,
                        220537, 220527, 220529, 220511, 220554, 220539, 220561, 0,
                        220615, 0,
                        220580, 220602, 220567, 220568, 0,
                        220635, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Festering Rotslime",
                    Loot =
                    {
                        220637, 220636, 0,
                        220565, 220546, 220518, 220550, 220545, 220538, 220552, 220542, 220540, 220541, 0,
                        220569, 220571, 0,
                        221484, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Atal'ai Defenders",
                    Loot =
                    {
                        220637, 220636, 0,
                        220548, 220522, 220558, 220532, 220516, 220528, 220533, 220560, 220555, 0,
                        220611, 0,
                        220591, 220674, 220572, 0,
                        220638, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Dreamscythe and Weaver",
                    Loot =
                    {
                        220637, 220636, 0,
                        220549, 220536, 220521, 220544, 220519, 220551, 0,
                        220609, 0,
                        220587, 220584, 220581, 220594, 220566, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Jammal'an and Ogom",
                    Loot =
                    {
                        220637, 220636, 0,
                        220535, 220556, 220547, 220515, 0,
                        220623, 220624, 220625, 220605, 0,
                        220601, 220586, 220575, 220583, 220576, 220578, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Morphaz and Hazzas",
                    Loot =
                    {
                        220637, 220636, 0,
                        220563, 220543, 220514, 220559, 220553, 220512, 0,
                        220606, 220607, 0,
                        220598, 220597, 220599, 220589, 220596, 220965, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Shade of Eranikus",
                    Loot =
                    {
                        220637, 220636, 0,
                        220523, 220564, 0,
                        220622, 0,
                        220604, 220603, 220595, 220579, 220574, 220585, 220582, 220573, 220600, 0,
                        221312, 0,
                    },
                },
                {
                    Name = "Avatar of Hakkar",
                    Loot =
                    {
                        220637, 220636, 0,
                        221346, 221363, 0,
                        220534, 220557, 220562, 220530, 0,
                        220608, 220634, 220632, 220633, 0,
                        220590, 220588, 220577, 220686, 0,
                        220620, 0,
                        221312, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        220783, 220781, 220784, 0, -- Nightmare Prophet's Garb
                        220680, 220679, 220681, 0, -- Malevolent Prophet's Vestments
                        220683, 220684, 220685, 0, -- Benevolent Prophet's Vestments
                        220672, 220673, 220675, 0, -- Lost Worshipper's Armor
                        220669, 220671, 220670, 0, -- Exiled Prophet's Raiment
                        220779, 220778, 220780, 0, -- Coagulate Bloodguard's Leathers
                        220676, 220678, 220677, 0, -- Blood Corrupted Leathers
                        220666, 220667, 220668, 0, -- Dread Hunter's Chain
                        220657, 220658, 220659, 0, -- Ostracized Berserk's Battlemail
                        220665, 220663, 220664, 0, -- Corrupted Spiritweaver's Mail
                        220660, 220661, 220662, 0, -- Shunned Devotee's Chainmail
                        220650, 220651, 220652, 0, -- Obsessed Prophet's Plate
                        220653, 220654, 220656, 0, -- Wailing Berserker's Plate Armor
                        220642, 220643, 220648, 0, -- Banished Martyr's Full Plate
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        220628, 220626, 220627, 220629, 220630, 0,
                    },
                },
            },
        }),
        
        [930] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Storm Cliffs",
            ButtonName = "[20] Storm Cliffs",
            NameShort = "Azuregos",
            Color = LootReserve.Constants.Colors.Size20Tiny,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Azuregos",
                    Loot =
                    {
                        228384, 228345, 228385, 228340, 0,
                        228389, 228383, 0,
                        228381, 228382, 228349, 228347, 0,
                        18704, 0,
                        11938, 0,
                    },
                },
            },
        }),
        [935] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "The Tainted Scar",
            ButtonName = "[20] The Tainted Scar",
            NameShort = "Kazzak",
            Color = LootReserve.Constants.Colors.Size20Tiny,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Lord Kazzak",
                    Loot =
                    {
                        228352, 228357, 228355, 228351, 228353, 0,
                        228359, 228354, 228360, 0,
                        228356, 228397, 0,
                        18665, 0,
                        11938, 0,
                    },
                },
            },
        }),
        [936] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "The Crystal Vale",
            ButtonName = "[20] The Crystal Vale",
            NameShort = "Thunderaan",
            Color = LootReserve.Constants.Colors.Size20Tiny,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Prince Thunderaan",
                    Loot =
                    {
                        231708, 231716, 231725, 0,
                        231782, 0,
                        231784, 231785, 231779, 231781, 231783, 0,
                        231387, 231753, 231777, 231817, 231815, 231823, 0,
                        232018, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 2 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        231078, 231097, 0,
                        231100, 231108, 0,
                        231171, 231161, 0,
                        231252, 231236, 231260, 231244, 0,
                        231045, 231053, 0,
                        231056, 231065, 0,
                        231216, 231200, 231224, 231208, 0,
                        231191, 231175, 231183, 0,
                        231032, 231024, 0,
                    },
                },
                {
                    Name = "Core Forged",
                    IndentType = 2,
                    Loot =
                    {
                        232232, 232240, 0,
                        232128, 232136, 0,
                        232168, 232176, 0,
                        232080, 232088, 232096, 232104, 0,
                        232184, 232192, 0,
                        232120, 232112, 0,
                        232200, 232208, 232216, 232224, 0,
                        232152, 232144, 232160, 0,
                        232248, 232256, 0,
                    },
                },
            },
        }),
        
        [938] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Onyxia",
            ButtonName = "[20] Onyxia",
            NameShort = "Ony",
            Color = LootReserve.Constants.Colors.Size20Tiny,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Onyxia",
                    Loot =
                    {
                        18423, 18422, 0,
                        18705, 0,
                        17078, 228759, 228188, 228298, 228163, 18813, 0,
                        228955, 228166, 17068, 17075, 228162, 228165, 0,
                        228992, 0,
                        11938, 0,
                        15410, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tokens",
                    Loot =
                    {
                        227532, 227537, 227535, 227531, 227533, 227530, 227534, 227536, 0,
                        227764, 227762, 227766, 227760, 227759, 227761, 227763, 227765, 0,
                        227755, 227752, 227758, 227750, 227756, 227751, 227754, 227757, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        226549, 226550, 226548, 226553, 226552, 226551, 226547, 226554, 0,
                        216922, 216925, 216924, 216920, 216921, 216919, 216923, 216918, 0,
                        -- Mage
                        226562, 226560, 226559, 226558, 226556, 226555, 226561, 226557, 0,
                        226564, 226566, 226563, 226567, 226569, 226570, 226565, 226568, 0,
                        -- Priest
                        226584, 226581, 226582, 226579, 226585, 226580, 226583, 226586, 0,
                        226573, 226576, 226575, 226578, 226572, 226577, 226574, 226571, 0,
                        -- Druid
                        226658, 226653, 226656, 226655, 226654, 226657, 226651, 226652, 0,
                        226647, 226644, 221785, 226649, 226648, 226650, 226646, 226645, 0,
                        226659, 226665, 226661, 226662, 226664, 226660, 226666, 226663, 0,
                        226670, 226674, 226675, 226668, 226669, 226667, 226671, 226673, 0,
                        -- Rogue
                        226446, 226444, 226447, 226442, 226441, 226440, 226445, 226443, 0,
                        226480, 226478, 226473, 226476, 226475, 226474, 226479, 226477, 0,
                        -- Hunter
                        226533, 226527, 226534, 226530, 226528, 226529, 226532, 226531, 0,
                        226536, 226543, 226535, 226541, 226540, 226542, 226537, 226538, 0,
                        -- Shaman
                        226622, 226624, 226619, 226626, 226621, 226625, 226623, 226620, 0,
                        226612, 226611, 226617, 226618, 226615, 226616, 226614, 226613, 0,
                        226638, 226640, 226635, 226642, 226637, 226641, 226639, 226636, 0,
                        226630, 226632, 226627, 226634, 226629, 226633, 226631, 226628, 0,
                        -- Paladin
                        226590, 226588, 226610, 226589, 226591, 226592, 226594, 226593, 0,
                        226599, 221783, 226602, 226596, 226600, 226597, 226598, 226601, 0,
                        226607, 226605, 226595, 226603, 226608, 226604, 226606, 226609, 0,
                        -- Warrior
                        226495, 226492, 226494, 226499, 226497, 226498, 226493, 226496, 0,
                        226488, 226491, 226489, 226484, 226486, 226485, 226490, 226487, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        228685, 228687, 228686, 0,
                    },
                },
            },
        }),
        [940] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Molten Core",
            ButtonName = "[20] Molten Core",
            NameShort = "MC",
            Color = LootReserve.Constants.Colors.Size20,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Lucifron",
                    Loot =
                    {
                        227533, 227759, 227756, 0,
                        228239, 228244, 228245, 228246, 228285, 228127, 228240, 0,
                        228247, 228243, 228242, 0,
                        228262, 228263, 0,
                        16665, 0,
                    },
                },
                {
                    Name = "Magmadar",
                    Loot =
                    {
                        227534, 227763, 227754, 0,
                        228256, 228257, 228101, 228253, 228258, 228254, 228260, 228240, 0,
                        228255, 228261, 228249, 0,
                        228259, 228350, 228146, 228229, 228248, 228252, 0,
                    },
                },
                {
                    Name = "Gehennas",
                    Loot =
                    {
                        227536, 227765, 227757, 0,
                        228239, 228244, 228245, 228246, 228285, 228127, 228240, 0,
                        228243, 228242, 0,
                        228262, 228263, 0,
                    },
                },
                {
                    Name = "Garr",
                    Loot =
                    {
                        227532, 227764, 227755, 0,
                        228256, 228257, 228253, 228258, 228254, 228260, 228240, 0,
                        228255, 228261, 0,
                        228259, 228142, 228264, 228267, 228160, 228265, 228229, 228139, 228266, 0,
                        18564, 0,
                    },
                },
                {
                    Name = "Baron Geddon",
                    Loot =
                    {
                        227530, 227761, 227751, 0,
                        228256, 228257, 228253, 228258, 228254, 228260, 228240, 0,
                        228255, 228261, 228268, 0,
                        228259, 228142, 228160, 228229, 228139, 0,
                        18563, 0,
                    },
                },
                {
                    Name = "Shazzrah",
                    Loot =
                    {
                        227531, 227760, 227750, 0,
                        228239, 228244, 228245, 228246, 228285, 228127, 228240, 0,
                        228243, 228242, 0,
                        228262, 228263, 0,
                    },
                },
                {
                    Name = "Golemagg the Incinerator",
                    Loot =
                    {
                        227537, 227535, 227533, 227531, 227536, 0,
                        227762, 227766, 227759, 227760, 227765, 0,
                        227752, 227758, 227756, 227750, 227757, 0,
                        228256, 228257, 228253, 228258, 228254, 228260, 228240, 0,
                        228255, 228137, 228261, 228147, 0,
                        228259, 228269, 228271, 228270, 228229, 0,
                        17203, 0,
                    },
                },
                {
                    Name = "Sulfuron Harbinger",
                    Loot =
                    {
                        227537, 227535, 227533, 227531, 227530, 0,
                        227762, 227766, 227759, 227760, 227761, 0,
                        227752, 227758, 227756, 227750, 227751, 0,
                        228239, 228244, 228245, 228246, 228285, 228127, 228240, 0,
                        228242, 228243, 0,
                        228262, 228263, 228128, 228272, 228273, 0,
                    },
                },
                {
                    Name = "Majordomo Executus",
                    Loot =
                    {
                        18646, 18703, 228129, 0,
                        228282, 228281, 228283, 228279, 228284, 228275, 0,
                        228274, 228280, 228102, 0,
                        228277, 228278, 0,
                    },
                },
                {
                    Name = "Ragnaros",
                    Loot =
                    {
                        227728, 0,
                        228291, 228295, 0,
                        228289, 228287, 228100, 228290, 228292, 228286, 228297, 228293, 0,
                        228294, 228296, 228145, 228299, 228288, 0,
                        19017, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    ConcatenateIf({
                        17011, 17010, 11382, 17012, 0,
                    }, EXPANSION_PHASE >= 1.5, {20951, 0,}),
                },
                { Separator = true },
                {
                    Name = "Tokens",
                    IndentType = 1,
                    Loot =
                    {
                        227532, 227537, 227535, 227531, 227533, 227530, 227534, 227536, 0,
                        227764, 227762, 227766, 227760, 227759, 227761, 227763, 227765, 0,
                        227755, 227752, 227758, 227750, 227756, 227751, 227754, 227757, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Molten Heat",
                    IndentType = 1,
                    Loot =
                    {
                        229376, 228517, 228922, 0,
                        228462, 229382, 0,
                        228506, 229372, 228511, 228701, 228508, 229374, 0,
                        229379, 229378, 229377, 0,
                        229380, 229381, 229373, 228463, 228459, 228461, 228460, 0,
                        228519, 0,
                        228702, 0,
                        
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        18265, 21371, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        18252, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        18264, 0,
                    },
                },
                {
                    Name = "Engineering",
                    IndentType = 1,
                    Loot =
                    {
                        228304, 0,
                        18291, 18290, 0,
                    },
                },
                {
                    Name = "Alchemy",
                    IndentType = 1,
                    Loot =
                    {
                        18257, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        18259, 18260, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        226549, 226550, 226548, 226553, 226552, 226551, 226547, 226554, 0,
                        216922, 216925, 216924, 216920, 216921, 216919, 216923, 216918, 0,
                        -- Mage
                        226562, 226560, 226559, 226558, 226556, 226555, 226561, 226557, 0,
                        226564, 226566, 226563, 226567, 226569, 226570, 226565, 226568, 0,
                        -- Priest
                        226584, 226581, 226582, 226579, 226585, 226580, 226583, 226586, 0,
                        226573, 226576, 226575, 226578, 226572, 226577, 226574, 226571, 0,
                        -- Druid
                        226658, 226653, 226656, 226655, 226654, 226657, 226651, 226652, 0,
                        226647, 226644, 221785, 226649, 226648, 226650, 226646, 226645, 0,
                        226659, 226665, 226661, 226662, 226664, 226660, 226666, 226663, 0,
                        226670, 226674, 226675, 226668, 226669, 226667, 226671, 226673, 0,
                        -- Rogue
                        226446, 226444, 226447, 226442, 226441, 226440, 226445, 226443, 0,
                        226480, 226478, 226473, 226476, 226475, 226474, 226479, 226477, 0,
                        -- Hunter
                        226533, 226527, 226534, 226530, 226528, 226529, 226532, 226531, 0,
                        226536, 226543, 226535, 226541, 226540, 226542, 226537, 226538, 0,
                        -- Shaman
                        226622, 226624, 226619, 226626, 226621, 226625, 226623, 226620, 0,
                        226612, 226611, 226617, 226618, 226615, 226616, 226614, 226613, 0,
                        226638, 226640, 226635, 226642, 226637, 226641, 226639, 226636, 0,
                        226630, 226632, 226627, 226634, 226629, 226633, 226631, 226628, 0,
                        -- Paladin
                        226590, 226588, 226610, 226589, 226591, 226592, 226594, 226593, 0,
                        226599, 221783, 226602, 226596, 226600, 226597, 226598, 226601, 0,
                        226607, 226605, 226595, 226603, 226608, 226604, 226606, 226609, 0,
                        -- Warrior
                        226495, 226492, 226494, 226499, 226497, 226498, 226493, 226496, 0,
                        226488, 226491, 226489, 226484, 226486, 226485, 226490, 226487, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        227683, 0,
                        228335, 228336, 0,
                        18714, 228334, 228332, 0,
                        228143, 0,
                    },
                },
            },
        }),
        
        [942] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Blackwing Lair",
            ButtonName = "[20] Blackwing Lair",
            NameShort = "BWL",
            Color = LootReserve.Constants.Colors.Size20,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Razorgore the Untamed",
                    Loot =
                    {
                        231712, 231720, 231729, 0,
                        231722, 229352, 0,
                        230238, 230237, 0,
                        230240, 230239, 0,
                        230242, 230241, 0,
                    },
                },
                {
                    Name = "Vaelastrasz the Corrupt",
                    Loot =
                    {
                        231710, 231718, 231727, 0,
                        230904, 231378, 0,
                        230243, 230244, 0,
                        230849, 230843, 230848, 230246, 0,
                        230846, 230245, 0,
                        230248, 230247, 230845, 232357, 0,
                    },
                },
                {
                    Name = "Broodlord Lashlayer",
                    Loot =
                    ConcatenateIf({
                        231713, 231721, 231730, 0,
                        231882, 231995, 231452, 0,
                        230250, 230249, 0,
                        230252, 230251, 0,
                        230253, 230254, 0,
                    }, EXPANSION_PHASE >= 1.5, {20383, 0,}),
                },
                {
                    Name = "Firemaw",
                    Loot =
                    {
                        231710, 231718, 231727, 0,
                        230273, 230272, 0,
                        230275, 230274, 230279, 230255, 230278, 230256, 0,
                        230257, 230269, 230282, 230736, 230842, 230277, 0,
                        230270, 230847, 230276, 230844, 230271, 0,
                    },
                },
                {
                    Name = "Ebonroc",
                    Loot =
                    {
                        231711, 231719, 231728, 0,
                        230280, 0,
                        230723, 230725, 0,
                        230281, 0,
                        230271, 230726, 0,
                    },
                },
                {
                    Name = "Flamegor",
                    Loot =
                    {
                        230255, 230735, 230256, 0,
                        230257, 230733, 230269, 230282, 230734, 230842, 230736, 0,
                        230270, 230737, 230847, 230844, 230738, 0,
                    },
                },
                {
                    Name = "Chromaggus",
                    Loot =
                    {
                        231709, 231717, 231726, 0,
                        229906, 231814, 0,
                        230743, 230739, 230746, 230742, 230740, 230800, 230745, 230741, 0,
                        230744, 0,
                        230794, 230747, 230801, 230802, 0,
                    },
                },
                {
                    Name = "Nefarian",
                    Loot =
                    ConcatenateIf({
                        231714, 231723, 231731, 0,
                        19003, 19002, 0,
                        230812, 230805, 230806, 0,
                        230810, 230804, 230811, 231803, 230808, 0,
                        230813, 230838, 230818, 230837, 0,
                        11938, 0,
                    }, EXPANSION_PHASE >= 1.5, {21138, 0,}),
                },
                { Separator = true },
                {
                    Name = "All Bosses",
                    Loot =
                    {
                        231707, 231708, 0,
                        231715, 231716, 0,
                        231724, 231725, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        18562, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tokens",
                    IndentType = 1,
                    Loot =
                    {
                        231711, 231709, 231714, 231707, 231712, 231708, 231710, 231713, 0,
                        231719, 231717, 231723, 231715, 231720, 231716, 231718, 231721, 0,
                        231728, 231726, 231731, 231724, 231729, 231725, 231727, 231730, 0,
                        231722, 230904, 229906, 231814, 229352, 231882, 231995, 231452, 231378, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Shadowflame",
                    IndentType = 1,
                    Loot =
                    {
                        232557, 232563, 232556, 0,
                        232552, 0,
                        232565, 232564, 232558, 232555, 232561, 232567, 0,
                        232559, 232551, 232550, 232566, 232562, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 2 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        231074, 231077, 231076, 231079, 231073, 231078, 231075, 231072, 0,
                        231092, 231096, 231095, 231098, 231091, 231097, 231093, 231090, 0,
                        -- Mage
                        231103, 231106, 231105, 231107, 231102, 231100, 231104, 231101, 0,
                        231111, 231114, 231113, 231115, 231110, 231108, 231112, 231109, 0,
                        -- Priest
                        231167, 231170, 231169, 231172, 231166, 231171, 231168, 231165, 0,
                        231157, 231160, 231159, 231162, 231156, 231161, 231158, 231155, 0,
                        -- Druid
                        231249, 231251, 231246, 231253, 231248, 231252, 231250, 231247, 0,
                        231233, 231235, 231230, 231237, 231232, 231236, 231234, 231231, 0,
                        231257, 231259, 231254, 231261, 231256, 231260, 231258, 231255, 0,
                        231241, 231243, 231238, 231245, 231240, 231244, 231242, 231239, 0,
                        -- Rogue
                        231043, 231039, 231040, 231046, 231042, 231045, 231044, 231041, 0,
                        231051, 231047, 231048, 231054, 231050, 231053, 231052, 231049, 0,
                        -- Hunter
                        231059, 231057, 231062, 231055, 231060, 231056, 231058, 231061, 0,
                        231068, 231066, 231071, 231063, 231069, 231065, 231067, 231070, 0,
                        -- Shaman
                        231219, 231217, 231221, 231215, 231214, 231216, 231218, 231220, 0,
                        231203, 231201, 231205, 231199, 231198, 231200, 231202, 231204, 0,
                        231227, 231225, 231229, 231223, 231222, 231224, 231226, 231228, 0,
                        231211, 231209, 231213, 231207, 231206, 231208, 231210, 231212, 0,
                        -- Paladin
                        231194, 231192, 231197, 231190, 231195, 231191, 231193, 231196, 0,
                        231178, 231176, 231181, 231174, 231179, 231175, 231177, 231180, 0,
                        231186, 231184, 231187, 231182, 231188, 231183, 231185, 231189, 0,
                        -- Warrior
                        231035, 231033, 231038, 231031, 231036, 231032, 231034, 231037, 0,
                        231027, 231025, 231030, 231023, 231028, 231024, 231026, 231029, 0,
                    },
                },
                {
                    Name = "Core Forged",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        232235, 232233, 232238, 232231, 232236, 232232, 232234, 232237, 0,
                        232243, 232241, 232246, 232239, 232244, 232240, 232242, 232245, 0,
                        -- Mage
                        232131, 232129, 232134, 232127, 232132, 232128, 232130, 232133, 0,
                        232139, 232137, 232142, 232135, 232140, 232136, 232138, 232141, 0,
                        -- Priest
                        232171, 232169, 232174, 232167, 232172, 232168, 232170, 232173, 0,
                        232179, 232177, 232182, 232175, 232180, 232176, 232178, 232181, 0,
                        -- Druid
                        232083, 232081, 232086, 232079, 232084, 232080, 232082, 232085, 0,
                        232091, 232089, 232094, 232087, 232092, 232088, 232090, 232093, 0,
                        232099, 232097, 232102, 232095, 232100, 232096, 232098, 232101, 0,
                        232107, 232105, 232110, 232103, 232108, 232104, 232106, 232109, 0,
                        -- Rogue
                        232187, 232185, 232190, 232183, 232188, 232184, 232186, 232189, 0,
                        232195, 232193, 232198, 232191, 232196, 232192, 232194, 232197, 0,
                        -- Hunter
                        232123, 232121, 232126, 232119, 232124, 232120, 232122, 232125, 0,
                        232115, 232113, 232118, 232111, 232116, 232112, 232114, 232117, 0,
                        -- Shaman
                        232203, 232201, 232206, 232199, 232204, 232200, 232202, 232205, 0,
                        232211, 232209, 232214, 232207, 232212, 232208, 232210, 232213, 0,
                        232219, 232217, 232222, 232215, 232220, 232216, 232218, 232221, 0,
                        232227, 232225, 232230, 232223, 232228, 232224, 232226, 232229, 0,
                        -- Paladin
                        232155, 232153, 232158, 232151, 232156, 232152, 232154, 232157, 0,
                        232147, 232145, 232150, 232143, 232148, 232144, 232146, 232149, 0,
                        232163, 232161, 232166, 232159, 232164, 232160, 232162, 232165, 0,
                        -- Warrior
                        232251, 232249, 232254, 232247, 232252, 232248, 232250, 232253, 0,
                        232259, 232257, 232262, 232255, 232260, 232256, 232258, 232261, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        230840, 230839, 230841, 0,
                        229910, 0,
                        229971, 229972, 229909, 0,
                        231509, 0,
                        224281, 224282, 0,
                        224122, 0,
                        231754, 231755, 0,
                        231890, 224279, 0,
                        229806, 229749, 0,
                        224280, 0,
                    },
                },
            },
        }),
        [944] = ShortCircuit(SEASON_NUMBER == SEASONS.DISCOVERY, {
            Name = "Zul'Gurub",
            ButtonName = "[10] Zul'Gurub",
            NameShort = "ZG",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "High Priestess Jeklik",
                    Loot =
                    {
                        230856, 230862, 230912, 230857, 230916, 230859, 230914, 230861, 0,
                        230854, 230913, 230915, 230855, 0,
                        230863, 230911, 232299, 0,
                    },
                },
                {
                    Name = "High Priest Venoxis",
                    Loot =
                    {
                        230856, 230862, 230866, 230857, 230864, 230859, 230861, 0,
                        230854, 230867, 232311, 230855, 0,
                        230865, 230863, 230868, 0,
                    },
                },
                {
                    Name = "High Priestess Mar'li",
                    Loot =
                    {
                        230917, 230856, 230862, 230857, 230919, 230859, 230861, 0,
                        230854, 230920, 230855, 230921, 230922, 0,
                        230863, 230918, 0,
                    },
                },
                {
                    Name = "Bloodlord Mandokir",
                    Loot =
                    {
                        231512, 0,
                        230997, 230994, 230995, 230996, 0,
                        231001, 231000, 230998, 230999, 0,
                        230993, 230992, 230991, 230989, 0,
                        19872, 0,
                    },
                },
                { Name = "Edge of Madness", Header = true },
                {
                    Name = "Gri'lek",
                    IndentType = 1,
                    Loot =
                    {
                        231513, 0,
                        231274, 231273, 0,
                    },
                },
                {
                    Name = "Hazza'rah",
                    IndentType = 1,
                    Loot =
                    {
                        231516, 0,
                        231276, 231275, 0,
                    },
                },
                {
                    Name = "Renataki",
                    IndentType = 1,
                    Loot =
                    {
                        231514, 0,
                        232309, 231277, 0,
                    },
                },
                {
                    Name = "Wushoolay",
                    IndentType = 1,
                    Loot =
                    {
                        231515, 0,
                        231279, 231278, 0,
                    },
                },
                {
                    Name = "High Priest Thekal",
                    Loot =
                    {
                        230923, 230856, 230927, 230862, 230857, 230928, 230859, 230926, 230861, 0,
                        230854, 230929, 230855, 0,
                        230863, 230930, 230925, 0,
                        19902, 0,
                    },
                },
                {
                    Name = "High Priestess Arlokk",
                    Loot =
                    {
                        230856, 230862, 230857, 230859, 230861, 230942, 0,
                        230854, 230855, 230943, 0,
                        230941, 230939, 230863, 230934, 0,
                        230944, 0,
                    },
                },
                {
                    Name = "Jin'do the Hexxer",
                    Loot =
                    {
                        231512, 0,
                        231013, 231011, 231006, 231009, 231008, 231007, 231010, 0,
                        231003, 231012, 0,
                        231005, 231004, 231002, 0,
                    },
                },
                {
                    Name = "Hakkar",
                    Loot =
                    {
                        19802, 0,
                        231305, 231303, 231299, 0,
                        231300, 231306, 231307, 0,
                        231308, 231296, 231301, 231309, 231293, 231315, 231302, 231289, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Gahz'ranka",
                    Loot =
                    {
                        231014, 0,
                        231271, 0,
                        231016, 231272, 0,
                        22739, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        20259, 20261, 20263, 0,
                        230858, 230860, 0,
                        20258, 19921, 19908, 0,
                        19707, 19708, 19709, 19710, 19711, 19712, 19713, 19714, 19715, 0,
                        19698, 19699, 19700, 19701, 19702, 19703, 19704, 19705, 19706, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tokens",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Bloodied",
                    IndentType = 1,
                    Loot =
                    {
                        231874, 232310, 231862, 231858, 231860, 231857, 0,
                        231871, 231865, 231859, 231850, 231863, 231866, 0,
                        231855, 231847, 231856, 231867, 0,
                        231876, 0,
                        231853, 231869, 0,
                        231875, 231851, 0,
                        231873, 231854, 231848, 231861, 231870, 231849, 231864, 231846, 0,
                        231872, 231868, 231852, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        231349, 231348, 231347, 0,
                        231325, 231327, 231326, 0,
                        231333, 231335, 231334, 0,
                        231338, 231337, 231339, 0,
                        231317, 231319, 231318, 0,
                        231321, 231323, 231322, 0,
                        231341, 231343, 231342, 0,
                        231329, 231331, 231330, 0,
                        231353, 231351, 231352, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        19950, 19949, 19948, 0,
                        231376, 231377, 0,
                        231383, 0,
                        231367, 231366, 0,
                        231355, 231354, 231357, 231358, 0,
                        231370, 231368, 0,
                        231359, 231384, 0,
                        231372, 231373, 231371, 231375, 0,
                        231364, 231363, 231362, 231361, 0,
                        231379, 231381, 0,
                    },
                },
            },
        }),
        
        
        
        -- Classic
        
        [1020] = ShortCircuit(SEASON_NUMBER ~= SEASONS.DISCOVERY, {
            Sort = 1005,
            Name = "Onyxia",
            ButtonName = "[40] Onyxia",
            NameShort = ShortCircuit(EXPANSION_PHASE >= 3.3, "Ony 40", "Ony"),
            Color = LootReserve.Constants.Colors.Size40Tiny,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Onyxia",
                    Loot =
                    {
                        16914, 16929, 16921, 16908, 16900, 16939, 16947, 16955, 16963, 0,
                        18705, 0,
                        18423, 18422, 0,
                        17078, 17064, 18813, 18205, 0,
                        17067, 17068, 17075, 0,
                        17966, 11938, 0,
                        15410, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        18404, 18403, 18406, 0,
                    },
                },
            },
        }),
        [1010] = ShortCircuit(SEASON_NUMBER ~= SEASONS.DISCOVERY, {
            Name = "Molten Core",
            ButtonName = "[40] Molten Core",
            NameShort = "MC",
            Color = LootReserve.Constants.Colors.Size40,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Lucifron",
                    Loot =
                    {
                        16800, 16805, 16829, 16837, 16859, 16863, 0,
                        19145, 18872, 18875, 19146, 18870, 18861, 0,
                        17109, 19147, 18879, 0,
                        18878, 17077, 0,
                        16665, 0,
                    },
                },
                {
                    Name = "Magmadar",
                    Loot =
                    {
                        16796, 16810, 16814, 16822, 16835, 16847, 16843, 16855, 16867, 0,
                        19136, 18823, 19144, 18829, 18824, 19143, 18861, 0,
                        18820, 18821, 17065, 0,
                        19142, 18203, 18822, 17073, 17069, 0,
                    },
                },
                {
                    Name = "Gehennas",
                    Loot =
                    {
                        16812, 16826, 16849, 16839, 16860, 16862, 0,
                        19145, 18872, 18875, 19146, 18870, 18861, 0,
                        19147, 18879, 0,
                        18878, 17077, 0,
                    },
                },
                {
                    Name = "Garr",
                    Loot =
                    {
                        18564, 0,
                        16795, 16808, 16813, 16821, 16834, 16846, 16842, 16854, 16866, 0,
                        19136, 18823, 19144, 18829, 18824, 19143, 18861, 0,
                        18820, 18821, 0,
                        19142, 17105, 17071, 18832, 18822, 17066, 0,
                    },
                },
                {
                    Name = "Baron Geddon",
                    Loot =
                    {
                        18563, 0,
                        16797, 16807, 16836, 16844, 16856, 0,
                        19136, 18823, 19144, 18829, 18824, 19143, 18861, 0,
                        18820, 18821, 17110, 0,
                        19142, 18822, 0,
                    },
                },
                {
                    Name = "Shazzrah",
                    Loot =
                    {
                        16801, 16803, 16811, 16824, 16831, 16852, 0,
                        19145, 18872, 18875, 19146, 18870, 18861, 0,
                        19147, 18879, 0,
                        18878, 17077, 0,
                    },
                },
                {
                    Name = "Golemagg the Incinerator",
                    Loot =
                    {
                        16798, 16809, 16815, 16820, 16833, 16845, 16841, 16853, 16865, 0,
                        19136, 18823, 19144, 18829, 18824, 19143, 18861, 0,
                        18820, 18821, 0,
                        19142, 17103, 18842, 17072, 18822, 0,
                        17203, 0,
                    },
                },
                {
                    Name = "Sulfuron Harbinger",
                    Loot =
                    {
                        16816, 16823, 16848, 16868, 0,
                        19145, 18872, 18875, 19146, 18870, 18861, 0,
                        18879, 19147, 0,
                        18878, 17077, 17074, 17223, 0,
                    },
                },
                {
                    Name = "Majordomo Executus",
                    Loot =
                    {
                        18646, 18703, 0,
                        18809, 18808, 18810, 19139, 18812, 18806, 0,
                        18811, 19140, 0,
                        18805, 18803, 0,
                    },
                },
                {
                    Name = "Ragnaros",
                    Loot =
                    ConcatenateIf({
                        17204, 0,
                        16915, 16930, 16922, 16909, 16901, 16938, 16946, 16954, 16962, 0,
                        18817, 19137, 0,
                        18814, 19138, 17102, 17107, 17063, 17082, 18815, 0,
                        17106, 18816, 17104, 17076, 0,
                        19017, 0,
                    }, EXPANSION_PHASE >= 1.5, {21110, 0,}),
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    ConcatenateIf({
                        16802, 16806, 16817, 16827, 16828, 16851, 16838, 16858, 16864, 0,
                        16799, 16804, 16819, 16825, 16830, 16850, 16840, 16857, 16861, 0,
                        17011, 17010, 11382, 17012, 0,
                    }, EXPANSION_PHASE >= 1.5, {20951, 0,}),
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        18265, 21371, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        18252, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        18264, 0,
                    },
                },
                {
                    Name = "Engineering",
                    IndentType = 1,
                    Loot =
                    {
                        18292, 18291, 18290, 0,
                    },
                },
                {
                    Name = "Alchemy",
                    IndentType = 1,
                    Loot =
                    {
                        18257, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        18259, 18260, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        16808, 16807, 16809, 16804, 16805, 16806, 16810, 16803, 0,
                        16795, 16797, 16798, 16799, 16801, 16802, 16796, 16800, 0,
                        16813, 16816, 16815, 16819, 16812, 16817, 16814, 16811, 0,
                        16821, 16823, 16820, 16825, 16826, 16827, 16822, 16824, 0,
                        16834, 16836, 16833, 16830, 16831, 16828, 16835, 16829, 0,
                        16846, 16848, 16845, 16850, 16852, 16851, 16847, 16849, 0,
                        16842, 16844, 16841, 16840, 16839, 16838, 16843, 16837, 0,
                        16866, 16868, 16865, 16861, 16863, 16864, 16867, 16862, 0,
                        16854, 16856, 16853, 16857, 16860, 16858, 16855, 16859, 0,
                    },
                },
                {
                    Name = "Tier 2 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        16915, 16930, 16922, 16909, 16901, 16938, 16946, 16954, 16962, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        17182, 0,
                        18608, 18609, 0,
                        18714, 18713, 18715, 0,
                    },
                },
            },
        }),
        [1030] = ShortCircuit(SEASON_NUMBER ~= SEASONS.DISCOVERY, {
            Name = "Blackwing Lair",
            ButtonName = "[40] Blackwing Lair",
            NameShort = "BWL",
            Color = LootReserve.Constants.Colors.Size40,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Razorgore the Untamed",
                    Loot =
                    {
                        16918, 16934, 16926, 16911, 16904, 16935, 16943, 16951, 16959, 0,
                        19337, 19336, 0,
                        19370, 19369, 0,
                        19334, 19335, 0,
                    },
                },
                {
                    Name = "Vaelastrasz the Corrupt",
                    Loot =
                    {
                        16818, 16933, 16925, 16910, 16903, 16936, 16944, 16952, 16960, 0,
                        19339, 19340, 0,
                        19372, 0,
                        19371, 0,
                        19348, 19346, 0,
                    },
                },
                {
                    Name = "Broodlord Lashlayer",
                    Loot =
                    ConcatenateIf({
                        16912, 16927, 16919, 16906, 16898, 16941, 16949, 16957, 16965, 0,
                        19342, 19341, 0,
                        19374, 19373, 0,
                        19350, 19351, 0,
                    }, EXPANSION_PHASE >= 1.5, {20383, 0,}),
                },
                {
                    Name = "Firemaw",
                    Loot =
                    {
                        16913, 16928, 16920, 16907, 16899, 16940, 16948, 16956, 16964, 0,
                        19344, 19343, 0,
                        19400, 19399, 19401, 19396, 19402, 19394, 0,
                        19397, 19395, 19398, 0,
                        19355, 19365, 19353, 0,
                    },
                },
                {
                    Name = "Ebonroc",
                    Loot =
                    {
                        16913, 16928, 16920, 16907, 16899, 16940, 16948, 16956, 16964, 0,
                        19345, 0,
                        19407, 19405, 19396, 19394, 0,
                        19403, 19397, 19395, 19406, 0,
                        19355, 19353, 19368, 0,
                    },
                },
                {
                    Name = "Flamegor",
                    Loot =
                    {
                        16913, 16928, 16920, 16907, 16899, 16940, 16948, 16956, 16964, 0,
                        19430, 19396, 19433, 19394, 0,
                        19397, 19432, 19395, 19431, 0,
                        19355, 19367, 19357, 19353, 0,
                    },
                },
                {
                    Name = "Chromaggus",
                    Loot =
                    {
                        16932, 16924, 16917, 16832, 16902, 16937, 16945, 16953, 16961, 0,
                        19391, 19388, 19385, 19390, 19389, 19393, 19392, 19387, 0,
                        19386, 0,
                        19347, 19352, 19361, 19349, 0,
                    },
                },
                {
                    Name = "Nefarian",
                    Loot =
                    ConcatenateIf(Squish({
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16914),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16929),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16921),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16908),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16900),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16939),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16947),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16955),
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16963),
                        ShortCircuit(EXPANSION_PHASE >= 3.0,     0),
                        16916, 16931, 16923, 16905, 16897, 16942, 16950, 16958, 16966, 0,
                        19003, 19002, 0,
                        19375, 19381, 19380, 0,
                        19379, 19378, 19382, 19377, 19376, 0,
                        19356, 19360, 19364, 19363, 0,
                        11938, 0,
                    }), EXPANSION_PHASE >= 1.5, {21138, 0,}),
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        19438, 19437, 19439, 0,
                        19434, 19436, 0,
                        19435, 19362, 19358, 19354, 0,
                        18562, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 2 Pieces",
                    IndentType = 2,
                    Loot =
                    Squish{
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16929), 16932, 16931, 16934, 16928, 16933, 16927, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16914), 16917, 16916, 16918, 16913, 16818, 16912, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16921), 16924, 16923, 16926, 16920, 16925, 16919, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16908), 16832, 16905, 16911, 16907, 16910, 16906, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16900), 16902, 16897, 16904, 16899, 16903, 16898, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16939), 16937, 16942, 16935, 16940, 16936, 16941, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16947), 16945, 16950, 16943, 16948, 16944, 16949, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16963), 16961, 16966, 16959, 16964, 16960, 16965, 0,
                        ShortCircuit(EXPANSION_PHASE >= 3.0, 16955), 16953, 16958, 16951, 16956, 16952, 16957, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        19383, 19384, 19366, 0,
                    },
                },
            },
        }),
        [1040] = ShortCircuit(EXPANSION_PHASE < 4.0 and SEASON_NUMBER ~= SEASONS.DISCOVERY, {
            Name = "Zul'Gurub",
            ButtonName = "[20] Zul'Gurub",
            NameShort = "ZG",
            Color = LootReserve.Constants.Colors.Size20,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "High Priestess Jeklik",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        22716, 22720, 19928, 22718, 20262, 22715, 20265, 22714, 0,
                        22721, 19923, 19920, 22722, 0,
                        22713, 19918, 19915, 0,
                    },
                },
                {
                    Name = "High Priest Venoxis",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        22716, 22720, 19906, 22718, 19904, 22715, 22714, 0,
                        22721, 19905, 19907, 22722, 0,
                        19903, 22713, 19900, 0,
                    },
                },
                {
                    Name = "High Priestess Mar'li",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        20032, 22716, 22720, 22718, 19919, 22715, 22714, 0,
                        22721, 19930, 22722, 19925, 19871, 0,
                        22713, 19927, 0,
                    },
                },
                {
                    Name = "Bloodlord Mandokir",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        22637, 0,
                        19895, 19877, 19869, 19878, 0,
                        19893, 19863, 19870, 19873, 0,
                        20038, 19866, 19874, 19867, 0,
                        19872, 0,
                    },
                },
                { Name = "Edge of Madness", Header = true },
                {
                    Name = "Gri'lek",
                    IndentType = 1,
                    Loot =
                    {
                        19939, 0,
                        19961, 19962, 0,
                    },
                },
                {
                    Name = "Hazza'rah",
                    IndentType = 1,
                    Loot =
                    {
                        19942, 0,
                        19967, 19968, 0,
                    },
                },
                {
                    Name = "Renataki",
                    IndentType = 1,
                    Loot =
                    {
                        19940, 0,
                        19964, 19963, 0,
                    },
                },
                {
                    Name = "Wushoolay",
                    IndentType = 1,
                    Loot =
                    {
                        19941, 0,
                        19965, 19993, 0,
                    },
                },
                {
                    Name = "High Priest Thekal",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        19897, 22716, 19899, 22720, 22718, 20260, 22715, 20266, 22714, 0,
                        22721, 19898, 22722, 0,
                        22713, 19901, 19896, 0,
                        19902, 0,
                    },
                },
                {
                    Name = "High Priestess Arlokk",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        22716, 22720, 22718, 22715, 22714, 19913, 0,
                        22721, 22722, 19912, 0,
                        19922, 19909, 22713, 19910, 0,
                        19914, 0,
                    },
                },
                {
                    Name = "Jin'do the Hexxer",
                    Loot =
                    {
                        19721, 19724, 19723, 19722, 19717, 19716, 19718, 19719, 19720, 0,
                        22637, 0,
                        19886, 19929, 19892, 19889, 19887, 19875, 19894, 0,
                        19885, 19888, 0,
                        19891, 19884, 19890, 0,
                    },
                },
                {
                    Name = "Hakkar",
                    Loot =
                    {
                        19802, 0,
                        20257, 20264, 19855, 0,
                        19857, 19876, 19856, 0,
                        19861, 19864, 19859, 19865, 19852, 19854, 19853, 19862, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Gahz'ranka",
                    Loot =
                    {
                        19945, 0,
                        19947, 0,
                        19944, 19946, 0,
                        22739, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        20259, 20261, 20263, 0,
                        22711, 22712, 0,
                        20258, 19921, 19908, 0,
                        19707, 19708, 19709, 19710, 19711, 19712, 19713, 19714, 19715, 0,
                        19698, 19699, 19700, 19701, 19702, 19703, 19704, 19705, 19706, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        19849, 20033, 19848, 0,
                        19845, 20034, 19846, 0,
                        19841, 19843, 19842, 0,
                        19835, 19834, 19836, 0,
                        19838, 19840, 19839, 0,
                        19831, 19833, 19832, 0,
                        19828, 19830, 19829, 0,
                        19825, 19827, 19826, 0,
                        19822, 19824, 19823, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        19950, 19949, 19948, 0,
                        19788, 19787, 19789, 19790, 19784, 19785, 19786, 19783, 19782, 0,
                    },
                },
            },
        }),
        [1050] = {
            Name = "Ruins of Ahn'Qiraj",
            ButtonName = "[20] Ruins of Ahn'Qiraj",
            NameShort = "AQ20",
            Color = LootReserve.Constants.Colors.Size20,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Kurinnaxx",
                    Loot =
                    {
                        20885, 20889, 20888, 20884, 0,
                        21499, 21500, 21501, 21502, 21503, 0,
                        21498, 0,
                    },
                },
                {
                    Name = "General Rajaxx",
                    Loot =
                    {
                        20885, 20889, 20888, 20884, 0,
                        21496, 21810, 21493, 21494, 21497, 21495, 0,
                        21809, 0,
                        21806, 21492, 0,
                    },
                },
                {
                    Name = "Moam",
                    Loot =
                    {
                        20884, 20888, 20890, 20886, 0,
                        21472, 21468, 21469, 21455, 21474, 21467, 21476, 21475, 21479, 0,
                        21473, 21470, 21477, 0,
                        21471, 0,
                        22220, 0,
                    },
                },
                {
                    Name = "Buru the Gorger",
                    Loot =
                    {
                        20890, 20886, 20885, 20889, 20888, 20884, 0,
                        21489, 21491, 21487, 21486, 21490, 0,
                        21488, 0,
                        21485, 0,
                    },
                },
                {
                    Name = "Ayamiss the Hunter",
                    Loot =
                    {
                        20890, 20886, 20885, 20889, 20888, 20884, 0,
                        21484, 21482, 21480, 21481, 21479, 0,
                        21483, 0,
                        21466, 21478, 0,
                    },
                },
                {
                    Name = "Ossirian the Unscarred",
                    Loot =
                    {
                        20890, 20886, 20888, 20884, 0,
                        21220, 0,
                        21461, 21464, 21462, 21458, 21454, 21463, 21453, 21457, 21460, 0,
                        21456, 0,
                        21452, 21459, 21715, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        21804, 21803, 21805, 0,
                        21802, 21801, 21800, 0,
                        20873, 20869, 20866, 20870, 20868, 20871, 20867, 20872, 0,
                        20864, 20861, 20863, 20862, 20859, 20865, 20860, 20858, 0,
                        21761, 21156, 0,
                        22203, 22202, 0,
                    },
                },
                {
                    Name = "Class books",
                    Loot =
                    {
                        21279, 21214, 21280, 21281, 21283, 21282, 21284, 21287, 21285, 21300, 21303, 21302, 21294, 21296, 21295, 21306, 21304, 21307, 21291, 21292, 21293, 21288, 21289, 21290, 21298, 21299, 21297, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        20728, 20729, 20727, 20730, 20731, 20734, 20736, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Set Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        21418, 21417, 21416, 0,
                        21415, 21414, 21413, 0,
                        21412, 21411, 21410, 0,
                        21406, 21405, 21404, 0,
                        21409, 21408, 21407, 0,
                        21403, 21402, 21401, 0,
                        21400, 21399, 21398, 0,
                        21394, 21393, 21392, 0,
                        21397, 21396, 21395, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        21504, 21507, 21505, 21506, 0,
                    },
                },
            },
        },
        [1060] = {
            Name = "Temple of Ahn'Qiraj",
            ButtonName = "[40] Temple of Ahn'Qiraj",
            NameShort = "AQ40",
            Color = LootReserve.Constants.Colors.Size40,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "The Prophet Skeram",
                    Loot =
                    {
                        21698, 21708, 21705, 21699, 21704, 21814, 21706, 0,
                        21707, 21702, 21701, 21700, 0,
                        21703, 21128, 0,
                        21232, 21237, 0,
                        22222, 0,
                    },
                },
                {
                    Name = "Bug Trio",
                    Loot =
                    {
                        21696, 21694, 21693, 21692, 0,
                        21697, 21695, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "Kri Killed Last",
                    IndentType = 1,
                    Loot =
                    {
                        21680, 0,
                        21681, 21685, 0,
                        21603, 0,
                    },
                },
                {
                    Name = "Yauj Killed Last",
                    IndentType = 1,
                    Loot =
                    {
                        21686, 21682, 21684, 21683, 0,
                        21687, 0,
                    },
                },
                {
                    Name = "Vem Killed Last",
                    IndentType = 1,
                    Loot =
                    {
                        21689, 21691, 21688, 0,
                        21690, 0,
                    },
                },
                {
                    Name = "Battleguard Sartura",
                    Loot =
                    {
                        21676, 21648, 21671, 21669, 21672, 21675, 21668, 21667, 21674, 0,
                        21678, 21670, 0,
                        21666, 21673, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "Fankriss the Unyielding",
                    Loot =
                    {
                        21663, 21665, 21645, 21651, 21652, 21639, 0,
                        21647, 21664, 21627, 0,
                        21650, 21635, 22396, 22402, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "Viscidus",
                    Loot =
                    {
                        20928, 20932, 0,
                        21624, 21626, 21623, 0,
                        21625, 21677, 0,
                        21622, 22399, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "Princess Huhuran",
                    Loot =
                    {
                        20928, 20932, 0,
                        21619, 21617, 21618, 0,
                        21620, 21621, 0,
                        21616, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "Twin Emperors",
                    Loot =
                    {
                        20930, 20926, 0,
                        21600, 21604, 21609, 21602, 21605, 21607, 21599, 21606, 21598, 0,
                        21608, 21601, 0,
                        21597, 21679, 0,
                        21232, 21237, 0,
                        20735, 20726, 0,
                    },
                },
                {
                    Name = "Ouro",
                    Loot =
                    {
                        20931, 20927, 0,
                        21611, 21615, 0,
                        23558, 23570, 0,
                        23557, 21610, 0,
                        21237, 21232, 0,
                    },
                },
                {
                    Name = "C'Thun",
                    Loot =
                    {
                        20929, 20933, 0,
                        21221, 0,
                        22730, 21585, 21582, 21586, 21581, 0,
                        22731, 21583, 21596, 21579, 22732, 0,
                        21839, 21126, 21134, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        21838, 21888, 21889, 0,
                        21836, 21891, 0,
                        21856, 21837, 0,
                        21218, 21324, 21323, 21321, 0,
                        22203, 22202, 0,
                    },
                },
                {
                    Name = "Scarabs",
                    Loot =
                    {
                        20876, 20879, 20875, 20878, 20881, 20877, 20874, 20882, 0,
                        20864, 20861, 20863, 20862, 20859, 20865, 20860, 20858, 0,
                        21762, 21156, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        20728, 20729, 20727, 20730, 20731, 20734, 20736, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 2.5 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        21337, 21335, 21334, 21336, 21338, 0,
                        21347, 21345, 21343, 21346, 21344, 0,
                        21348, 21350, 21351, 21352, 21349, 0,
                        21360, 21361, 21364, 21362, 21359, 0,
                        21353, 21354, 21357, 21356, 21355, 0,
                        21366, 21367, 21370, 21368, 21365, 0,
                        21372, 21376, 21374, 21375, 21373, 0,
                        21329, 21330, 21331, 21332, 21333, 0,
                        21387, 21391, 21389, 21390, 21388, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        21709, 21712, 21710, 0,
                        21272, 21244, 21242, 21269, 0,
                        21273, 21275, 21268, 0,
                    },
                },
            },
        },
        [1070] = ShortCircuit(EXPANSION_PHASE < 3.0, {
            Name = "Naxxramas",
            ButtonName = "[40] Naxxramas",
            NameShort = "Naxx 40",
            Color = LootReserve.Constants.Colors.Size40,
            Expansion = 0,
            Children =
            Squish{
                {
                    Name = "Anub'Rekhan",
                    Loot =
                    {
                        22369, 22362, 22355, 0,
                        22936, 0,
                        22939, 22935, 22938, 0,
                        22937, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Grand Widow Faerlina",
                    Loot =
                    {
                        22369, 22362, 22355, 0,
                        22941, 22940, 0,
                        22943, 0,
                        22942, 22806, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Maexxna",
                    Loot =
                    {
                        22371, 22364, 22357, 0,
                        23220, 0,
                        22947, 22954, 0,
                        22807, 22804, 0,
                        22726, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Noth the Plaguebringer",
                    Loot =
                    {
                        22370, 22363, 22356, 0,
                        23031, 23030, 23028, 0,
                        23029, 23005, 23006, 22816, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Heigan the Unclean",
                    Loot =
                    {
                        22370, 22363, 22356, 0,
                        23035, 23033, 23068, 23019, 0,
                        23036, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Loatheb",
                    Loot =
                    {
                        22366, 22359, 22352, 0,
                        23037, 23038, 23042, 0,
                        22800, 23039, 0,
                        22726, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Instructor Razuvious",
                    Loot =
                    {
                        22372, 22365, 22358, 0,
                        23219, 0,
                        23017, 23018, 0,
                        23009, 23004, 23014, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Gothik the Harvester",
                    Loot =
                    {
                        22372, 22365, 22358, 0,
                        23032, 23021, 23020, 23073, 0,
                        23023, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "The Four Horsemen",
                    Loot =
                    {
                        22351, 22350, 22349, 0,
                        23071, 0,
                        23025, 23027, 0,
                        22811, 22809, 22691, 0,
                        22726, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Patchwerk",
                    Loot =
                    {
                        22368, 22361, 22354, 0,
                        22960, 22961, 0,
                        22820, 22815, 22818, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Grobbulus",
                    Loot =
                    {
                        22368, 22361, 22354, 0,
                        22968, 22967, 0,
                        22803, 22988, 22810, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Gluth",
                    Loot =
                    {
                        22368, 22369, 22370, 22372, 22361, 22362, 22363, 22365, 22354, 22355, 22356, 22358, 0,
                        22983, 0,
                        22981, 0,
                        23075, 22994, 22813, 0,
                        22726, 0,
                    },
                },
                {
                    Name = "Thaddius",
                    Loot =
                    {
                        22367, 22360, 22353, 0,
                        23070, 23000, 0,
                        23001, 0,
                        22801, 22808, 0,
                        22726, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Sapphiron",
                    Loot =
                    {
                        23549, 23548, 23545, 23547, 0,
                        23050, 23046, 23047, 23045, 23041, 23040, 0,
                        23049, 23048, 23043, 23242, 0,
                    },
                },
                {
                    Name = "Kel'Thuzad",
                    Loot =
                    {
                        23061, 23062, 23063, 23060, 23064, 23067, 23065, 23066, 23059, 0,
                        22520, 0,
                        23057, 23053, 0,
                        22821, 22799, 22819, 23056, 22802, 23054, 22798, 23577, 22812, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        23069, 23226, 23663, 23664, 23665, 23667, 23666, 23668, 0,
                        23237, 0,
                        23238, 23044, 23221, 0,
                        22376, 22373, 22374, 22375, 0,
                        23055, 22682, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 3 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        22506, 22507, 22504, 22511, 22509, 22510, 22505, 22508, 23063, 0,
                        22498, 22499, 22496, 22503, 22501, 22502, 22497, 22500, 23062, 0,
                        22514, 22515, 22512, 22519, 22517, 22518, 22513, 22516, 23061, 0,
                        22478, 22479, 22476, 22483, 22481, 22482, 22477, 22480, 23060, 0,
                        22490, 22491, 22488, 22495, 22493, 22494, 22489, 22492, 23064, 0,
                        22438, 22439, 22436, 22443, 22441, 22442, 22437, 22440, 23067, 0,
                        22466, 22467, 22464, 22471, 22469, 22470, 22465, 22468, 23065, 0,
                        22418, 22419, 22416, 22423, 22421, 22422, 22417, 22420, 23059, 0,
                        22428, 22429, 22425, 22424, 22426, 22431, 22427, 22430, 23066, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        23207, 23206, 0,
                    },
                },
            },
        }),
        
        
        -- The Burning Crusade
        
        [2010] = {
            Name = "Karazhan",
            ButtonName = "[10] Karazhan",
            NameShort = "Kara",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Attumen the Huntsman",
                    Loot =
                    {
                        28477, 28507, 28508, 28453, 28506, 28503, 28454, 28502, 28505, 0,
                        28510, 28509, 0,
                        28504, 0,
                        30480, 0,
                        23809, 0,
                    },
                },
                { Name = "Servant Quarters", Header = true },
                {
                    Name = "Rokad the Ravager",
                    IndentType = 1,
                    Loot =
                    {
                        30684, 30685, 30686, 30687, 0,
                    },
                },
                {
                    Name = "Shadikith the Glider",
                    IndentType = 1,
                    Loot =
                    {
                        30680, 30681, 30682, 30683, 0,
                    },
                },
                {
                    Name = "Hyakiss the Lurker",
                    IndentType = 1,
                    Loot =
                    {
                        30675, 30676, 30677, 30678, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Moroes",
                    Loot =
                    {
                        28565, 28545, 28567, 28569, 28566, 0,
                        28530, 28570, 28529, 28528, 0,
                        28568, 28525, 28524, 0,
                        22559, 0,
                    },
                },
                {
                    Name = "Maiden of Virtue",
                    Loot =
                    {
                        28515, 28517, 28511, 28521, 28514, 28520, 28519, 28512, 28518, 0,
                        28516, 0,
                        28523, 28522, 0,
                    },
                },
                {
                    Name = "Opera Event",
                    Loot =
                    {
                        28594, 28591, 28589, 28593, 0,
                        28590, 0,
                        28592, 0,
                    },
                },
                {
                    Name = "The Wizard of Oz",
                    IndentType = 1,
                    Loot =
                    {
                        28586, 28585, 0,
                        28588, 28587, 0,
                    },
                },
                {
                    Name = "The Big Bad Wolf",
                    IndentType = 1,
                    Loot =
                    {
                        28583, 0,
                        28582, 0,
                        28581, 28584, 0,
                    },
                },
                {
                    Name = "Romulo and Julianne",
                    IndentType = 1,
                    Loot =
                    {
                        28578, 0,
                        28579, 0,
                        28572, 28573, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Nightbane",
                    Loot =
                    {
                        28602, 28600, 28601, 28599, 28610, 28608, 28597, 0,
                        28609, 0,
                        28603, 28604, 28611, 28606, 0,
                    },
                },
                {
                    Name = "The Curator",
                    Loot =
                    {
                        29757, 29758, 29756, 0,
                        28612, 28647, 28631, 28621, 0,
                        28649, 0,
                        28633, 0,
                    },
                },
                {
                    Name = "Terestian Illhoof",
                    Loot =
                    {
                        28654, 28652, 28655, 28656, 28662, 0,
                        28785, 28661, 28653, 28660, 0,
                        28658, 28657, 28659, 0,
                        22561, 0,
                    },
                },
                {
                    Name = "Shade of Aran",
                    Loot =
                    {
                        28726, 28670, 28663, 28669, 28671, 28666, 0,
                        28727, 28674, 28672, 28675, 0,
                        28673, 28728, 0,
                        22560, 0,
                    },
                },
                {
                    Name = "Netherspite",
                    Loot =
                    {
                        28744, 28742, 28732, 28741, 28735, 28740, 28733, 28743, 0,
                        28731, 28730, 0,
                        28734, 28729, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Chess Event",
                    Loot =
                    {
                        28756, 28752, 28755, 28750, 28751, 28746, 28748, 28747, 0,
                        28753, 28745, 0,
                        28754, 28749, 0,
                    },
                },
                {
                    Name = "Prince Malchezaar",
                    Loot =
                    {
                        29760, 29761, 29759, 0,
                        28762, 28766, 28765, 28763, 28764, 28757, 0,
                        28770, 28771, 28767, 28773, 28768, 28772, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        30642, 30668, 30673, 30644, 30674, 30643, 30641, 0,
                        30666, 30667, 0,
                        -- 23857, 23864, 23862, 23865, 0,
                        21882, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        21903, 21904, 0,
                    },
                },
                {
                    Name = "Engineering",
                    IndentType = 1,
                    Loot =
                    {
                        23809, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        22559, 22561, 22560, 0,
                        22545, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 4 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        28963, 28968, 0,
                        29076, 29080, 0,
                        29058, 29057, 0,
                        29049, 29055, 0,
                        29093, 29092, 0,
                        29086, 29090, 0,
                        29098, 29097, 0,
                        29044, 29048, 0,
                        29081, 29085, 0,
                        29035, 29034, 0,
                        29028, 29032, 0,
                        29040, 29039, 0,
                        29021, 29020, 0,
                        29011, 29017, 0,
                        29061, 29065, 0,
                        29073, 29072, 0,
                        29068, 29067, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.2, {
                    Name = "Season 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        24553, 24556, 0,
                        30187, 30188, 0,
                        25855, 25857, 0,
                        27708, 27707, 0,
                        31410, 31409, 0,
                        28137, 28136, 0,
                        31376, 31375, 0,
                        28127, 28126, 0,
                        25830, 25834, 0,
                        28331, 28335, 0,
                        27471, 27470, 0,
                        31400, 31397, 0,
                        25998, 26000, 0,
                        24545, 24549, 0,
                        31616, 31614, 0,
                        27881, 27880, 0,
                        27704, 27703, 0,
                    },
                }),
            },
        },
        [2020] = {
            Name = "Gruul's Lair",
            ButtonName = "[25] Gruul's Lair",
            NameShort = "Gruul",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "High King Maulgar",
                    Loot =
                    {
                        29763, 29764, 29762, 0,
                        28799, 28796, 28801, 28795, 0,
                        28797, 0,
                        28800, 0,
                    },
                },
                {
                    Name = "Gruul the Dragonkiller",
                    Loot =
                    {
                        29766, 29767, 29765, 0,
                        28804, 28803, 28828, 28810, 28827, 28824, 0,
                        28822, 28823, 28830, 0,
                        28802, 28826, 28794, 28825, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 4 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        28967, 28966, 0,
                        29079, 29078, 0,
                        29060, 29059, 0,
                        29054, 29053, 0,
                        29095, 29094, 0,
                        29089, 29088, 0,
                        29100, 29099, 0,
                        29047, 29046, 0,
                        29084, 29083, 0,
                        29037, 29036, 0,
                        29031, 29030, 0,
                        29043, 29042, 0,
                        29023, 29022, 0,
                        29016, 29015, 0,
                        29064, 29063, 0,
                        29075, 29074, 0,
                        29070, 29069, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.2, {
                    Name = "Season 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        24554, 24555, 0,
                        30186, 30201, 0,
                        25854, 25858, 0,
                        27710, 27709, 0,
                        31412, 31411, 0,
                        28139, 28138, 0,
                        31378, 31377, 0,
                        28129, 28128, 0,
                        25832, 25833, 0,
                        28333, 28332, 0,
                        27473, 27472, 0,
                        31407, 31406, 0,
                        25999, 26001, 0,
                        24546, 24547, 0,
                        31619, 31618, 0,
                        27883, 27882, 0,
                        27706, 27705, 0,
                    },
                }),
            },
        },
        [2030] = {
            Name = "Magtheridon's Lair",
            ButtonName = "[25] Magtheridon's Lair",
            NameShort = "Mag",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Magtheridon",
                    Loot =
                    {
                        29754, 29753, 29755, 0,
                        32385, 32386, 0,
                        28780, 28777, 28776, 28778, 28779, 28775, 0,
                        28789, 0,
                        28783, 28781, 28782, 29458, 28774, 0,
                        34845, 0,
                        34846, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 4 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        28964, 0,
                        29077, 0,
                        29056, 29050, 0,
                        29091, 29087, 29096, 0,
                        29045, 0,
                        29082, 0,
                        29033, 29029, 29038, 0,
                        29019, 29012, 0,
                        29062, 29071, 29066, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.2, {
                    Name = "Season 1 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        24552, 30200, 0,
                        25856, 0,
                        27711, 31413, 0,
                        28140, 31379, 28130, 0,
                        25831, 0,
                        28334, 0,
                        27469, 31396, 25997, 0,
                        24544, 0,
                        31613, 27879, 27702, 0,
                    },
                }),
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        28791, 28790, 28793, 28792, 0,
                    },
                },
            },
        },
        [2040] = {
            Name = "Serpentshrine Cavern",
            ButtonName = "[25] Serpentshrine Cavern",
            NameShort = "SSC",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Hydross the Unstable",
                    Loot =
                    {
                        30664, 0,
                        30050, 30056, 32516, 30055, 30047, 30054, 30048, 30053, 0,
                        30052, 33055, 30629, 0,
                        30049, 30051, 0,
                    },
                },
                {
                    Name = "The Lurker Below",
                    Loot =
                    {
                        30665, 0,
                        30064, 30067, 30062, 30060, 30066, 30065, 30057, 0,
                        30059, 30061, 33054, 0,
                        30063, 30058, 0,
                    },
                },
                {
                    Name = "Leotheras the Blind",
                    Loot =
                    {
                        30239, 30240, 30241, 0,
                        30092, 30097, 30091, 30096, 0,
                        30627, 0,
                        30095, 0,
                    },
                },
                {
                    Name = "Fathom-Lord Karathress",
                    Loot =
                    {
                        30663, 0,
                        30245, 30246, 30247, 0,
                        30100, 30101, 0,
                        30626, 30099, 0,
                        30090, 0,
                    },
                },
                {
                    Name = "Morogrim Tidewalker",
                    Loot =
                    {
                        30720, 0,
                        30079, 30075, 30085, 30068, 30084, 30081, 0,
                        30008, 33058, 30098, 30083, 0,
                        30080, 30082, 0,
                    },
                },
                {
                    Name = "Lady Vashj",
                    Loot =
                    {
                        30242, 30243, 30244, 0,
                        30107, 30111, 30106, 30104, 30112, 30102, 0,
                        30109, 30110, 30621, 0,
                        30108, 30103, 30105, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        30027, 0,
                        30022, 30620, 0,
                        30023, 30025, 30021, 0,
                        30183, 0,
                        32897, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        30280, 30282, 30283, 30281, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        30308, 30304, 30305, 30307, 30306, 30301, 30303, 30302, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        30322, 30323, 30321, 30324, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 5 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        30212, 30211, 30213, 0,
                        30206, 30205, 30207, 0,
                        30161, 30160, 30162, 0,
                        30152, 30151, 30153, 0,
                        30233, 30232, 30234, 0,
                        30219, 30217, 30220, 0,
                        30228, 30223, 30229, 0,
                        30146, 30145, 30148, 0,
                        30141, 30140, 30142, 0,
                        30171, 30170, 30172, 0,
                        30166, 30165, 30167, 0,
                        30190, 30189, 30192, 0,
                        30120, 30119, 30121, 0,
                        30115, 30114, 30116, 0,
                        30136, 30135, 30137, 0,
                        30131, 30130, 30132, 0,
                        30125, 30124, 30126, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.3, {
                    Name = "Season 2 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        31974, 31973, 31975, 0,
                        31980, 31981, 31983, 0,
                        32048, 32049, 32051, 0,
                        32035, 32034, 32036, 0,
                        32016, 32015, 32017, 0,
                        32057, 32056, 32058, 0,
                        31988, 31987, 31989, 0,
                        31968, 31967, 31969, 0,
                        31999, 31998, 32000, 0,
                        31962, 31961, 31963, 0,
                        32011, 32010, 32012, 0,
                        32031, 32030, 32032, 0,
                        32006, 32005, 32007, 0,
                        30488, 30487, 30489, 0,
                        32022, 32021, 32023, 0,
                        32041, 32040, 32042, 0,
                        31997, 31993, 31995, 0,
                    },
                }),
            },
        },
        [2050] = {
            Name = "The Eye",
            ButtonName = "[25] The Eye",
            NameShort = "TK",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Al'ar",
                    Loot =
                    {
                        30448, 30447, 0,
                        29918, 29947, 29921, 0,
                        29922, 29920, 29925, 0,
                        29923, 32944, 29948, 29924, 29949, 0,
                    },
                },
                {
                    Name = "Void Reaver",
                    Loot =
                    {
                        30450, 0,
                        30248, 30249, 30250, 0,
                        29986, 29984, 29985, 29983, 32515, 0,
                        30619, 0,
                    },
                },
                {
                    Name = "High Astromancer Solarian",
                    Loot =
                    {
                        30449, 30446, 0,
                        29972, 29977, 29966, 29976, 29951, 29965, 29950, 32267, 0,
                        29982, 29981, 29962, 0,
                    },
                },
                {
                    Name = "Kael'thas Sunstrider",
                    Loot =
                    {
                        30236, 30237, 30238, 0,
                        32405, 0,
                        29987, 29990, 29995, 29991, 29998, 0,
                        29992, 29989, 29994, 29997, 0,
                        29988, 29996, 29993, 0,
                        32458, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        30020, 30024, 30029, 30030, 30026, 0,
                        30028, 0,
                        30183, 0,
                        32897,
                    }
                },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        30280, 30282, 30283, 30281, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        30308, 30304, 30305, 30307, 30306, 30301, 30303, 30302, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        30322, 30323, 30321, 30324, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 5 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        30215, 30214, 0,
                        30210, 30196, 0,
                        30163, 30159, 0,
                        30154, 30150, 0,
                        30235, 30231, 0,
                        30221, 30216, 0,
                        30230, 30222, 0,
                        30149, 30144, 0,
                        30143, 30139, 0,
                        30173, 30169, 0,
                        30168, 30164, 0,
                        30194, 30185, 0,
                        30122, 30118, 0,
                        30117, 30113, 0,
                        30138, 30134, 0,
                        30133, 30129, 0,
                        30127, 30123, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.3, {
                    Name = "Season 2 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        31976, 31977, 0,
                        31979, 31982, 0,
                        32047, 32050, 0,
                        32037, 32038, 0,
                        32018, 32019, 0,
                        32059, 32060, 0,
                        31990, 31991, 0,
                        31971, 31972, 0,
                        32001, 32002, 0,
                        31964, 31960, 0,
                        32013, 32009, 0,
                        32033, 32029, 0,
                        32008, 32004, 0,
                        30490, 30486, 0,
                        32024, 32020, 0,
                        32043, 32039, 0,
                        31996, 31992, 0,
                    },
                }),
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        30015, 30018, 30017, 30007, 0,
                    },
                },
            },
        },
        [2060] = {
            Name = "Battle for Mount Hyjal",
            ButtonName = "[25] Battle for Mount Hyjal",
            NameShort = "Hyjal",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Rage Winterchill",
                    Loot =
                    {
                        30870, 30871, 30868, 30863, 30873, 30869, 30864, 30862, 30866, 30861, 0,
                        30872, 30865, 0,
                    },
                },
                {
                    Name = "Anetheron",
                    Loot =
                    {
                        30884, 30888, 30885, 30886, 30879, 30887, 30880, 30878, 0,
                        30882, 30883, 30881, 30874, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Kaz'rogal",
                    Loot =
                    {
                        30894, 30916, 30895, 30914, 30917, 30891, 30893, 30892, 30919, 30915, 0,
                        30918, 30889, 0,
                    },
                },
                {
                    Name = "Azgalor",
                    Loot =
                    {
                        31092, 31094, 31093, 0,
                        30899, 30898, 30900, 30897, 30896, 0,
                        30901, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Archimonde",
                    Loot =
                    {
                        31097, 31095, 31096, 0,
                        30913, 30912, 30905, 30907, 30904, 30903, 0,
                        30910, 30908, 30911, 30902, 30906, 30909, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        32609, 32592, 0,
                        32589, 32590, 32591, 34010, 0,
                        34009, 32946, 32945, 0,
                        32428, 32897, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        32754, 32755, 32753, 32752, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        32744, 32745, 32746, 32747, 32750, 32751, 32748, 32749, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        32738, 32739, 32736, 32737, 0,
                    },
                },
                {
                    Name = "Jewelcrafting",
                    IndentType = 1,
                    Loot =
                    {
                        32296, 32307, 32289, 32285, 32303, 32297, 32298, 32295, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 6 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        31051, 31050, 0,
                        31056, 31055, 0,
                        31064, 31061, 0,
                        31063, 31060, 0,
                        31040, 31035, 0,
                        31037, 31032, 0,
                        31039, 31034, 0,
                        31027, 31026, 0,
                        31003, 31001, 0,
                        31014, 31008, 0,
                        31012, 31007, 0,
                        31015, 31011, 0,
                        30972, 30969, 0,
                        30974, 30970, 0,
                        30988, 30983, 0,
                        30989, 30982, 0,
                        30987, 30985, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.5, {
                    Name = "Season 3 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        33677, 33676, 0,
                        33683, 33684, 0,
                        33758, 33759, 0,
                        33745, 33744, 0,
                        33718, 33717, 0,
                        33768, 33767, 0,
                        33691, 33690, 0,
                        33672, 33671, 0,
                        33701, 33700, 0,
                        33666, 33665, 0,
                        33713, 33712, 0,
                        33740, 33739, 0,
                        33708, 33707, 0,
                        33730, 33729, 0,
                        33724, 33723, 0,
                        33751, 33750, 0,
                        33697, 33696, 0,
                    },
                }),
            },
        },
        [2070] = {
            Name = "Black Temple",
            ButtonName = "[25] Black Temple",
            NameShort = "BT",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "High Warlord Naj'entus",
                    Loot =
                    {
                        32239, 32240, 32377, 32242, 32241, 32234, 32243, 32245, 32232, 0,
                        32247, 32238, 0,
                        32237, 32236, 32248, 0,
                    },
                },
                {
                    Name = "Supremus",
                    Loot =
                    {
                        32256, 32252, 32259, 32258, 32251, 32250, 0,
                        32260, 32261, 0,
                        32255, 32257, 32262, 32253, 32254, 0,
                    },
                },
                {
                    Name = "Shade of Akama",
                    Loot =
                    {
                        32270, 32513, 32273, 32271, 32265, 32276, 32275, 32264, 32278, 32279, 32268, 32263, 0,
                        32266, 0,
                        32361, 0,
                    },
                },
                {
                    Name = "Teron Gorefiend",
                    Loot =
                    {
                        32327, 32329, 32328, 32324, 32510, 32512, 32280, 0,
                        32323, 0,
                        32330, 32348, 32326, 32325, 0,
                    },
                },
                {
                    Name = "Gurtogg Bloodboil",
                    Loot =
                    {
                        32340, 32338, 32339, 32334, 32341, 32342, 32333, 0,
                        32337, 32335, 32501, 0,
                        32343, 32344, 32269, 0,
                    },
                },
                {
                    Name = "Reliquary of the Lost",
                    Loot =
                    {
                        32353, 32352, 32351, 32347, 32517, 32346, 32354, 32345, 0,
                        32349, 32362, 0,
                        32350, 32363, 32332, 0,
                    },
                },
                {
                    Name = "Mother Shahraz",
                    Loot =
                    {
                        31101, 31103, 31102, 0,
                        32367, 32366, 32365, 0,
                        32370, 32369, 32368, 0,
                    },
                },
                {
                    Name = "The Illidari Council",
                    Loot =
                    {
                        31098, 31100, 31099, 0,
                        32519, 32518, 32376, 32373, 0,
                        32331, 32505, 0,
                    },
                },
                {
                    Name = "Illidan Stormrage",
                    Loot =
                    {
                        32837, 32838, 0,
                        31089, 31091, 31090, 0,
                        32525, 32235, 32521, 0,
                        32483, 32496, 32524, 32497, 0,
                        32374, 32500, 32471, 32336, 32375, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        32609, 32593, 32592, 32606, 32608, 0,
                        32589, 32590, 32527, 32528, 34012, 32526, 32591, 0,
                        34009, 32943, 34011, 0,
                        32228, 32231, 32229, 32249, 32230, 32227, 0,
                        32428, 32897, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        32754, 32755, 32753, 32752, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        32744, 32745, 32746, 32747, 32750, 32751, 32748, 32749, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        32738, 32739, 32736, 32737, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 6 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        31054, 31052, 31053, 0,
                        31059, 31057, 31058, 0,
                        31070, 31065, 31067, 0,
                        31069, 31066, 31068, 0,
                        31049, 31043, 31046, 0,
                        31047, 31041, 31045, 0,
                        31048, 31042, 31044, 0,
                        31030, 31028, 31029, 0,
                        31006, 31004, 31005, 0,
                        31023, 31017, 31020, 0,
                        31022, 31016, 31019, 0,
                        31024, 31018, 31021, 0,
                        30979, 30975, 30977, 0,
                        30980, 30976, 30978, 0,
                        30996, 30992, 30994, 0,
                        30997, 30990, 30993, 0,
                        30998, 30991, 30995, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 2.5, {
                    Name = "Season 3 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        33679, 33680, 33678, 0,
                        33682, 33685, 33686, 0,
                        33757, 33760, 33761, 0,
                        33747, 33748, 33746, 0,
                        33720, 33721, 33719, 0,
                        33770, 33771, 33769, 0,
                        33693, 33694, 33692, 0,
                        33674, 33675, 33673, 0,
                        33703, 33704, 33702, 0,
                        33668, 33664, 33667, 0,
                        33715, 33711, 33714, 0,
                        33742, 33738, 33741, 0,
                        33710, 33706, 33709, 0,
                        33732, 33728, 33731, 0,
                        33726, 33722, 33725, 0,
                        33753, 33749, 33752, 0,
                        33699, 33695, 33698, 0,
                    },
                }),
            },
        },
        [2080] = ShortCircuit(EXPANSION_PHASE < 4.0, {
            Name = "Zul'Aman",
            ButtonName = "[10] Zul'Aman",
            NameShort = "ZA",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Akil'zon",
                    Loot =
                    {
                        33286, 33216, 33215, 0,
                        33293, 33281, 0,
                        33283, 33214, 0,
                        33307, 0,
                    },
                },
                {
                    Name = "Nalorakk",
                    Loot =
                    {
                        33285, 33203, 33211, 33206, 33327, 33191, 0,
                        33640, 0,
                        33307, 0,
                    },
                },
                {
                    Name = "Jan'alai",
                    Loot =
                    {
                        33357, 33356, 33329, 33328, 0,
                        33354, 33332, 33326, 0,
                        33307, 0,
                    },
                },
                {
                    Name = "Halazzi",
                    Loot =
                    {
                        33317, 33322, 33300, 33533, 33299, 33303, 0,
                        33297, 0,
                        33307, 0,
                    },
                },
                {
                    Name = "Hex Lord Malacrass",
                    Loot =
                    {
                        33453, 33463, 33432, 33464, 33421, 33446, 0,
                        33829, 33828, 33592, 34029, 0,
                        33465, 33389, 33298, 33388, 0,
                        33307, 0,
                    },
                },
                {
                    Name = "Zul'jin",
                    Loot =
                    {
                        33102, 0,
                        33471, 33479, 33469, 33473, 0,
                        33466, 33831, 33830, 0,
                        33467, 33468, 33474, 33478, 33476, 0,
                        33307, 0,
                    },
                },
                { Separator = true },
                { Name = "Timed Chests", Header = true },
                {
                    Name = "First Prisoner Saved",
                    IndentType = 1,
                    Loot =
                    {
                        33489, 33480, 33971, 33483, 33805, 33481, 0,
                        33591, 33590, 0,
                    },
                },
                {
                    Name = "Second Prisoner Saved",
                    IndentType = 1,
                    Loot =
                    {
                        33494, 33490, 33495, 33493, 33492, 33491, 0,
                    },
                },
                {
                    Name = "Third Prisoner Saved",
                    IndentType = 1,
                    Loot =
                    {
                        33497, 33498, 33496, 33500, 33499, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE < 3.0, {
                    Name = " - Fourth Prisoner Saved",
                    Loot =
                    {
                        33809, 0,
                    },
                }),
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        33865, 0,
                        -- 33930, 33932, 33931, 33933, 0,
                        33993, 0,
                    },
                },
            },
        }),
        [2090] = {
            Name = "Sunwell Plateau",
            ButtonName = "[25] Sunwell Plateau",
            NameShort = "SWP",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 1,
            Children =
            Squish{
                {
                    Name = "Kalecgos",
                    Loot =
                    {
                        34848, 34851, 34852, 0,
                        34170, 34169, 34168, 34167, 0,
                        34166, 0,
                        34165, 34164, 0,
                    },
                },
                {
                    Name = "Brutallus",
                    Loot =
                    {
                        34853, 34854, 34855, 0,
                        34181, 34180, 0,
                        34177, 34178, 0,
                        34179, 34176, 0,
                    },
                },
                {
                    Name = "Felmyst",
                    Loot =
                    {
                        34856, 34857, 34858, 0,
                        34188, 34186, 34352, 0,
                        34184, 0,
                        34182, 34185, 0,
                    },
                },
                {
                    Name = "Eredar Twins",
                    Loot =
                    {
                        34210, 34202, 34209, 34195, 34208, 34194, 34193, 34192, 0,
                        35290, 34204, 35291, 34205, 34189, 35292, 34190, 0,
                        34206, 34199, 34198, 34197, 34203, 34196, 0,
                    },
                },
                {
                    Name = "M'uru",
                    Loot =
                    {
                        34232, 34233, 34212, 34211, 34234, 34229, 34228, 34240, 34215, 34216, 0,
                        34230, 35282, 34429, 34430, 35283, 35284, 34427, 34428, 34213, 0,
                        34231, 34214, 0,
                    },
                },
                {
                    Name = "Kil'jaeden",
                    Loot =
                    {
                        34334, 0,
                        34340, 34344, 34339, 34342, 34245, 34244, 34332, 34333, 34343, 34243, 34345, 34341, 0,
                        34242, 34241, 0,
                        34336, 34335, 34337, 34329, 34247, 34331, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        34351, 34350, 0,
                        35733, 0,
                        34347, 34348, 34349, 34183, 34346, 0,
                        35273, 0,
                        32228, 32231, 32229, 32249, 32230, 32227, 0,
                        34664, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        35204, 35206, 35205, 35207, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        35212, 35216, 35213, 35217, 35214, 35218, 35215, 35219, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        35208, 35210, 35209, 35211, 0,
                    },
                },
                {
                    Name = "Engineering",
                    IndentType = 1,
                    Loot =
                    {
                        35186, 35189, 35197, 35190, 35191, 35192, 35193, 35194, 35187, 35195, 35196, 0,
                    },
                },
                {
                    Name = "Jewelcrafting",
                    IndentType = 1,
                    Loot =
                    {
                        35198, 35201, 35199, 35202, 35200, 35203, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 6 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        34436, 34541, 34564, 0,
                        34447, 34557, 34574, 0,
                        34434, 34528, 34563, 0,
                        34435, 34527, 34562, 0,
                        34446, 34555, 34572, 0,
                        34445, 34554, 34571, 0,
                        34444, 34556, 34573, 0,
                        34448, 34558, 34575, 0,
                        34443, 34549, 34570, 0,
                        34437, 34542, 34566, 0,
                        34438, 34543, 34565, 0,
                        34439, 34545, 34567, 0,
                        34441, 34546, 34569, 0,
                        34442, 34547, 34568, 0,
                        34432, 34487, 34559, 0,
                        34431, 34485, 34561, 0,
                        34433, 34488, 34560, 0,
                    },
                },
                {
                    Name = "Sunmote Exchanges",
                    IndentType = 2,
                    Loot =
                    {
                        34405, 34393, 34399, 34406, 34386, 0,
                        34403, 34391, 34398, 34407, 34384, 34404, 34397, 34392, 34408, 34385, 0,
                        34402, 34396, 34390, 34409, 34383, 0,
                        34401, 34389, 34395, 34382, 34400, 34388, 34394, 34381, 0,
                    },
                },
            },
        },
        
        
        -- Wrath of the Lich King
        
        -- Naxxramas
        [3010] = ShortCircuit(EXPANSION_PHASE <= 3.1, {
            Name = "Naxxramas 10",
            ButtonName = "[10] Naxxramas",
            NameShort = "Naxx 10",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Anub'Rekhan",
                    Loot =
                    {
                        39192, 39190, 39191, 39189, 39188, 39139, 0,
                        39193, 39146, 39141, 0,
                        39140, 0,
                    },
                },
                {
                    Name = "Grand Widow Faerlina",
                    Loot =
                    {
                        39216, 39215, 39196, 39217, 39194, 39198, 39195, 39197, 0,
                        39199, 39200, 0,
                    },
                },
                {
                    Name = "Maexxna",
                    Loot =
                    {
                        39230, 39224, 39228, 0,
                        39232, 39231, 39229, 39225, 0,
                        39226, 39221, 39233, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Noth the Plaguebringer",
                    Loot =
                    {
                        39242, 39240, 39237, 39243, 39236, 39239, 39235, 39234, 0,
                        39241, 39244, 0,
                    },
                },
                {
                    Name = "Heigan the Unclean",
                    Loot =
                    {
                        39252, 39254, 39247, 39248, 39251, 39249, 0,
                        39246, 39250, 0,
                        39245, 39255, 0,
                    },
                },
                {
                    Name = "Loatheb",
                    Loot =
                    {
                        40622, 40623, 40624, 0,
                        39259, 39260, 39258, 0,
                        39257, 0,
                        39256, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Instructor Razuvious",
                    Loot =
                    {
                        39309, 39310, 39308, 39299, 39307, 39306, 39298, 0,
                        39297, 0,
                        39311, 39296, 0,
                    },
                },
                {
                    Name = "Gothik the Harvester",
                    Loot =
                    {
                        39390, 39386, 39391, 39379, 39345, 39369, 0,
                        39392, 39389, 39388, 0,
                        39344, 0,
                    },
                },
                {
                    Name = "The Four Horsemen",
                    Loot =
                    {
                        40610, 40611, 40612, 0,
                        39396, 39397, 39395, 0,
                        39394, 39393, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Patchwerk",
                    Loot =
                    {
                        39273, 39275, 39274, 39267, 39262, 39261, 0,
                        39272, 0,
                        39271, 39270, 0,
                    },
                },
                {
                    Name = "Grobbulus",
                    Loot =
                    {
                        39284, 39285, 39283, 39279, 39278, 39280, 0,
                        39282, 39277, 0,
                        39281, 39276, 0,
                    },
                },
                {
                    Name = "Gluth",
                    Loot =
                    {
                        40622, 40623, 40624, 0,
                        40610, 40611, 40612, 0,
                        40619, 40620, 40621, 0,
                        39284, 39396, 39309, 39237, 39279, 39191, 39215, 39294, 39248, 39194, 39251, 39379, 39188, 39345, 0,
                        39272, 39146, 39232, 39193, 39388, 0,
                        39394, 39200, 39344, 39281, 0,
                    },
                },
                {
                    Name = "Thaddius",
                    Loot =
                    {
                        40619, 40620, 40621, 0,
                        39295, 39294, 39293, 0,
                        39292, 39291, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Sapphiron",
                    Loot =
                    {
                        39409, 39408, 39399, 39405, 39403, 39398, 0,
                        39415, 39404, 39401, 39407, 0,
                        44569, 0,
                    },
                },
                {
                    Name = "Kel'Thuzad",
                    Loot =
                    {
                        40616, 40617, 40618, 0,
                        39425, 39421, 0,
                        39416, 39424, 39420, 39417, 39423, 39422, 39426, 39419, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        39467, 0,
                        39472, 39470, 0,
                        39427, 39468, 39473, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 7 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        39496, 39499, 39497, 39498, 0,
                        39491, 39494, 39492, 39493, 0,
                        39521, 39529, 39523, 39528, 0,
                        39514, 39518, 39515, 39517, 0,
                        39545, 39548, 39547, 39546, 0,
                        39531, 39542, 39538, 39539, 0,
                        39553, 39556, 39554, 39555, 0,
                        39561, 39565, 39558, 39564, 0,
                        39578, 39581, 39579, 39580, 0,
                        39594, 39596, 39592, 39595, 0,
                        39583, 39590, 39588, 39589, 0,
                        39602, 39604, 39597, 39603, 0,
                        39605, 39608, 39606, 39607, 0,
                        39610, 39613, 39611, 39612, 0,
                        39619, 39621, 39617, 39620, 0,
                        39625, 39627, 39623, 39626, 0,
                        39628, 39631, 39629, 39630, 0,
                        39635, 39637, 39633, 39636, 0,
                        39640, 39642, 39638, 39641, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        44658, 44657, 44659, 44660, 0,
                    },
                },
            },
        }),
        [3011] = {
            Name = ShortCircuit(EXPANSION_PHASE <= 3.1, "Naxxramas 25", "Naxxramas"),
            ButtonName = ShortCircuit(EXPANSION_PHASE <= 3.1, "[25] Naxxramas", "Naxxramas"),
            NameShort = ShortCircuit(EXPANSION_PHASE <= 3.1, "Naxx 25", "Naxx"),
            Color = ShortCircuit(EXPANSION_PHASE <= 3.1, LootReserve.Constants.Colors.Size25, LootReserve.Constants.Colors.Size10or25),
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Anub'Rekhan",
                    Loot =
                    {
                        39719, 39721, 39720, 39722, 39701, 39702, 39718, 39704, 39703, 39717, 39706, 0,
                        40071, 40065, 40069, 40064, 40080, 40075, 40107, 40074, 0,
                        39714, 40208, 39716, 39712, 0,
                    },
                },
                {
                    Name = "Grand Widow Faerlina",
                    Loot =
                    {
                        39732, 39731, 39733, 39735, 39756, 39727, 39724, 39734, 39723, 39725, 39729, 39726, 0,
                        40071, 40065, 40069, 40064, 40080, 40075, 40107, 40108, 40074, 0,
                        39730, 39757, 39728, 0,
                    },
                },
                {
                    Name = "Maexxna",
                    Loot =
                    {
                        40062, 40060, 39768, 40063, 39765, 39761, 40061, 39762, 39760, 39767, 39764, 39759, 0,
                        40250, 40254, 40252, 40253, 40251, 40257, 40255, 40258, 40256, 0,
                        39766, 39763, 39758, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Noth the Plaguebringer",
                    Loot =
                    {
                        40602, 40198, 40197, 40186, 40200, 40193, 40196, 40184, 40185, 40188, 40187, 0,
                        40071, 40065, 40069, 40064, 40080, 40075, 40107, 40074, 0,
                        40192, 40189, 40190, 40191, 0,
                    },
                },
                {
                    Name = "Heigan the Unclean",
                    Loot =
                    {
                        40234, 40236, 40238, 40205, 40235, 40209, 40201, 40237, 40203, 40210, 40204, 40206, 0,
                        40250, 40254, 40252, 40253, 40251, 40257, 40255, 40258, 40256, 0,
                        40207, 40208, 40233, 0,
                    },
                },
                {
                    Name = "Loatheb",
                    Loot =
                    {
                        40637, 40638, 40639, 0,
                        40247, 40246, 40249, 40243, 40242, 40241, 40240, 0,
                        40239, 40244, 40245, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Instructor Razuvious",
                    Loot =
                    {
                        40325, 40326, 40305, 40319, 40323, 40315, 40324, 40327, 40306, 40316, 40317, 40318, 40320, 0,
                        40071, 40065, 40069, 40064, 40080, 40075, 40107, 40074, 0,
                        40321, 40322, 0,
                    },
                },
                {
                    Name = "Gothik the Harvester",
                    Loot =
                    {
                        40339, 40338, 40329, 40341, 40333, 40340, 40331, 40328, 40334, 40332, 40330, 0,
                        40250, 40254, 40252, 40253, 40251, 40257, 40255, 40258, 40256, 0,
                        40342, 40337, 40336, 40335, 0,
                    },
                },
                {
                    Name = "The Four Horsemen",
                    Loot =
                    {
                        40625, 40626, 40627, 0,
                        40349, 40344, 40352, 40347, 0,
                        40350, 40348, 40345, 40343, 40346, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Patchwerk",
                    Loot =
                    {
                        40271, 40269, 40260, 40270, 40262, 40272, 40261, 40263, 40259, 0,
                        40071, 40065, 40069, 40064, 40080, 40075, 40107, 40074, 0,
                        40267, 40268, 40273, 40264, 40266, 40265, 0,
                    },
                },
                {
                    Name = "Grobbulus",
                    Loot =
                    {
                        40287, 40286, 40351, 40289, 40277, 40285, 40288, 40283, 40282, 40275, 40279, 40274, 40278, 0,
                        40250, 40254, 40252, 40253, 40251, 40257, 40255, 40258, 40256, 0,
                        40280, 40281, 40284, 0,
                    },
                },
                {
                    Name = "Gluth",
                    Loot =
                    {
                        40637, 40638, 40639, 0,
                        40625, 40626, 40627, 0,
                        40634, 40635, 40636, 0,
                        40247, 40289, 40602, 39733, 40303, 40326, 40296, 39768, 40319, 40260, 40205, 40270, 40193, 40209, 40302, 39718, 40242, 39760, 40185, 40203, 40332, 40188, 40259, 40204, 39717, 40206, 40297, 0,
                        40191, 40350, 40281, 39714, 39730, 40343, 40239, 40280, 39716, 40265, 40346, 0,
                    },
                },
                {
                    Name = "Thaddius",
                    Loot =
                    {
                        40634, 40635, 40636, 0,
                        40303, 40301, 40296, 40304, 40299, 40302, 40298, 40294, 40297, 0,
                        40300, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Sapphiron",
                    Loot =
                    {
                        40381, 40380, 40376, 40362, 40379, 40367, 40366, 40377, 40365, 40363, 0,
                        40378, 40374, 40369, 40370, 40375, 40371, 40373, 40372, 40382, 0,
                        40368, 0,
                        44577, 0,
                    },
                },
                {
                    Name = "Kel'Thuzad",
                    Loot =
                    {
                        40631, 40632, 40633, 0,
                        40398, 0,
                        40405, 40403, 40387, 40399, 0,
                        40388, 40383, 40386, 40396, 40402, 40384, 40395, 40401, 40400, 40385, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        40409, 40414, 0,
                        40410, 40412, 0,
                        40408, 40407, 40406, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 7 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        40421, 40424, 40423, 40422, 0,
                        40416, 40419, 40418, 40417, 0,
                        40456, 40459, 40458, 40457, 0,
                        40447, 40450, 40449, 40448, 0,
                        40467, 40470, 40469, 40468, 0,
                        40461, 40465, 40463, 40462, 0,
                        40473, 40494, 40471, 40493, 0,
                        40499, 40502, 40495, 40500, 0,
                        40505, 40507, 40503, 40506, 0,
                        40516, 40518, 40514, 40517, 0,
                        40510, 40513, 40508, 40512, 0,
                        40521, 40524, 40523, 40522, 0,
                        40528, 40530, 40525, 40529, 0,
                        40546, 40548, 40544, 40547, 0,
                        40554, 40557, 40550, 40556, 0,
                        40565, 40568, 40559, 40567, 0,
                        40571, 40573, 40569, 40572, 0,
                        40576, 40578, 40574, 40577, 0,
                        40581, 40584, 40579, 40583, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        44661, 44662, 44664, 44665, 0,
                    },
                },
            },
        },
        
        -- Eye of Eternity
        [3020] = ShortCircuit(EXPANSION_PHASE <= 3.1, {
            Name = "Eye of Eternity 10",
            ButtonName = "[10] Eye of Eternity",
            NameShort = "EoE 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Malygos",
                    Loot =
                    {
                        40526, 40519, 40511, 0,
                        40486, 40474, 0,
                        40489, 40491, 40488, 40497, 40475, 0,
                        43952, 0,
                    },
                },
            },
        }),
        [3021] = {
            Name = ShortCircuit(EXPANSION_PHASE <= 3.1, "Eye of Eternity 25", "Eye of Eternity"),
            ButtonName = ShortCircuit(EXPANSION_PHASE <= 3.1, "[25] Eye of Eternity", "Eye of Eternity"),
            NameShort = ShortCircuit(EXPANSION_PHASE <= 3.1, "EoE 25", "EoE"),
            Color = ShortCircuit(EXPANSION_PHASE <= 3.1, LootReserve.Constants.Colors.Size25Tiny, LootReserve.Constants.Colors.Size10or25Tiny),
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Malygos",
                    Loot =
                    {
                        40562, 40555, 40194, 40561, 40560, 40558, 40594, 40539, 40541, 40566, 40543, 40588, 40564, 40549, 40590, 40589, 40592, 40591, 0,
                        40532, 40531, 0,
                        43952, 0,
                    },
                },
            },
        },
        
        -- The Obsidian Sanctum
        [3030] = ShortCircuit(EXPANSION_PHASE <= 3.1, {
            Name = "The Obsidian Sanctum 10",
            ButtonName = "[10] The Obsidian Sanctum",
            NameShort = "OS 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Sartharion",
                    Loot =
                    {
                        40613, 40614, 40615, 0,
                        40428, 0,
                        40427, 40426, 40433, 40430, 0,
                        40429, 0,
                        43345, 43347, 0,
                    },
                },
                {
                    Name = "One Drake Left",
                    IndentType = 1,
                    Loot =
                    {
                        43990, 43991, 43989, 0,
                        43988, 43992, 0,
                    },
                },
                {
                    Name = "Two Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        43995, 43998, 43996, 43994, 0,
                        43993, 0,
                    },
                },
                {
                    Name = "Three Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        43986, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 7 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        39500, 0,
                        39495, 0,
                        39530, 39519, 0,
                        39544, 39543, 39557, 0,
                        39560, 0,
                        39582, 0,
                        39593, 39591, 39601, 0,
                        39609, 39622, 0,
                        39618, 39624, 0,
                        39632, 39634, 39639, 0,
                    },
                },
            },
        }),
        [3029] = ShortCircuit(EXPANSION_PHASE > 3.1, {
            Name = "The Obsidian Sanctum 10",
            ButtonName = "[10] The Obsidian Sanctum",
            NameShort = "OS 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Sartharion",
                    Loot =
                    {
                        40628, 40629, 40630, 0,
                        40437, 40439, 40451, 40438, 40453, 40446, 0,
                        40433, 40431, 40432, 0,
                        40455, 0,
                        43345, 43346, 0,
                    },
                },
                {
                    Name = "One Drake Left",
                    IndentType = 1,
                    Loot =
                    {
                        44002, 44003, 44004, 44000, 0,
                    },
                },
                {
                    Name = "Two Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        44008, 44007, 44011, 44006, 0,
                        44005, 0,
                    },
                },
                {
                    Name = "Three Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        43986, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 7 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        40420, 0,
                        40415, 0,
                        40454, 40445, 0,
                        40466, 40460, 40472, 0,
                        40496, 0,
                        40504, 0,
                        40515, 40509, 40520, 0,
                        40527, 40545, 0,
                        40552, 40563, 0,
                        40570, 40575, 40580, 0,
                    },
                },
            },
        }),
        [3031] = {
            Name = "The Obsidian Sanctum 25",
            ButtonName = "[25] The Obsidian Sanctum",
            NameShort = "OS 25",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Sartharion",
                    Loot =
                    {
                        40628, 40629, 40630, 0,
                        40437, 40439, 40451, 40438, 40453, 40446, 0,
                        40433, 40431, 40432, 0,
                        40455, 0,
                        43345, 43346, 0,
                    },
                },
                {
                    Name = "One Drake Left",
                    IndentType = 1,
                    Loot =
                    {
                        44002, 44003, 44004, 44000, 0,
                    },
                },
                {
                    Name = "Two Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        44008, 44007, 44011, 44006, 0,
                        44005, 0,
                    },
                },
                {
                    Name = "Three Drakes Left",
                    IndentType = 1,
                    Loot =
                    {
                        43954, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 7 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        40420, 0,
                        40415, 0,
                        40454, 40445, 0,
                        40466, 40460, 40472, 0,
                        40496, 0,
                        40504, 0,
                        40515, 40509, 40520, 0,
                        40527, 40545, 0,
                        40552, 40563, 0,
                        40570, 40575, 40580, 0,
                    },
                },
            },
        },
        
        -- Ulduar
        [3040] = ShortCircuit(EXPANSION_PHASE <= 3.2, {
            Name = "Ulduar 10",
            ButtonName = "[10] Ulduar",
            NameShort = "Uld 10",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Flame Leviathan",
                    Loot =
                    {
                        45289, 45291, 45288, 45283, 0,
                        45285, 45292, 45286, 0,
                        45284, 45287, 45282, 0,
                    },
                },
                {
                    Name = "All Defences Active",
                    IndentType = 1,
                    Loot =
                    {
                        45293, 45300, 45295, 0,
                        45297, 0,
                        45296, 0,
                    },
                },
                {
                    Name = "Ignis the Furnace Master",
                    Loot =
                    {
                        45312, 45316, 45321, 45310, 0,
                        45317, 45318, 45313, 0,
                        45314, 45311, 45309, 0,
                    },
                },
                {
                    Name = "Razorscale",
                    Loot =
                    {
                        45306, 45302, 45301, 45307, 45299, 45305, 45304, 0,
                        45303, 45308, 0,
                        45298, 0,
                    },
                },
                {
                    Name = "XT-002 Deconstructor",
                    Loot =
                    {
                        45694, 45677, 45686, 45687, 45679, 45676, 45680, 0,
                        45675, 0,
                        45685, 45682, 0,
                    },
                },
                {
                    Name = "Heart Broken",
                    IndentType = 1,
                    Loot =
                    {
                        45869, 45867, 0,
                        45871, 0,
                        45868, 45870, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "The Iron Council",
                    Loot =
                    {
                        45423, 45324, 45378, 45329, 45333, 45330, 0,
                        45322, 45418, 0,
                        45332, 45331, 0,
                    },
                },
                {
                    Name = "Steelbreaker Last",
                    IndentType = 1,
                    Loot =
                    {
                        45455, 0,
                        45447, 45456, 0,
                        45449, 45448, 0,
                    },
                },
                {
                    Name = "Kologarn",
                    Loot =
                    {
                        45701, 45697, 45698, 0,
                        45704, 45696, 45699, 45702, 45703, 0,
                        45700, 45695, 0,
                    },
                },
                {
                    Name = "Algalon the Observer",
                    Loot =
                    {
                        46045, 46050, 46043, 46049, 46044, 46037, 46039, 46041, 0,
                        46042, 46047, 46040, 46048, 46046, 46038, 46051, 0,
                        46052, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Auriaya",
                    Loot =
                    {
                        45832, 45865, 45864, 45709, 45711, 45712, 45708, 0,
                        45866, 0,
                        45707, 45713, 0,
                    },
                },
                {
                    Name = "Hodir",
                    Loot =
                    {
                        45650, 45651, 45652, 0,
                        45464, 0,
                        45873, 45874, 0,
                        45458, 45872, 0,
                    },
                },
                {
                    Name = "Unbroken Cache",
                    IndentType = 1,
                    Loot =
                    {
                        45888, 0,
                        45876, 45886, 45887, 45877, 0,
                    },
                },
                {
                    Name = "Thorim",
                    Loot =
                    {
                        45659, 45660, 45661, 0,
                        45927, 45894, 45893, 45895, 0,
                        45892, 0,
                    },
                },
                {
                    Name = "Sif Present",
                    IndentType = 1,
                    Loot =
                    {
                        45928, 0,
                        45933, 45931, 45929, 0,
                        45930, 0,
                    },
                },
                {
                    Name = "Freya",
                    Loot =
                    {
                        45644, 45645, 45646, 0,
                        45940, 45941, 45935, 45936, 0,
                        45934, 0,
                        46110, 0,
                    },
                },
                {
                    Name = "All Elders Alive",
                    IndentType = 1,
                    Loot =
                    {
                        45943, 0,
                        45945, 45946, 0,
                        45947, 45294, 0,
                    },
                },
                {
                    Name = "Mimiron",
                    Loot =
                    {
                        45647, 45648, 45649, 0,
                        45976, 45974, 45975, 0,
                        45973, 0,
                        45972, 0,
                    },
                },
                {
                    Name = "Self Destruct Activated",
                    IndentType = 1,
                    Loot =
                    {
                        45993, 45989, 45982, 45988, 0,
                        45990, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "General Vezax",
                    Loot =
                    {
                        46013, 46012, 46009, 46346, 45997, 0,
                        46014, 46008, 46015, 46010, 0,
                        46011, 45996, 0,
                    },
                },
                {
                    Name = "Saronite Animus Defeated",
                    IndentType = 1,
                    Loot =
                    {
                        46034, 0,
                        46032, 0,
                        46036, 46035, 46033, 0,
                    },
                },
                {
                    Name = "Yogg-Saron",
                    Loot =
                    {
                        45635, 45636, 45637, 0,
                        46030, 46019, 46028, 0,
                        46022, 46021, 0,
                        46024, 46016, 46031, 46025, 46018, 0,
                    },
                },
                {
                    Name = "One or Fewer Keepers",
                    IndentType = 1,
                    Loot =
                    {
                        46068, 46095, 0,
                        46096, 0,
                        46097, 46067, 0,
                    },
                },
                {
                    Name = "No Keepers",
                    IndentType = 1,
                    Loot =
                    {
                        46312, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        46344, 46346, 46345, 46340, 0,
                        46341, 46347, 46343, 0,
                        46351, 46350, 46342, 46339, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        45104, 45102, 45105, 45103, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        45100, 45094, 45096, 45095, 45101, 45098, 45099, 45097, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        45089, 45088, 45092, 45090, 45093, 45091, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        46027, 46348, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 8 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        45417, 45422, 45421, 45419, 45420, 0,
                        45365, 45369, 45368, 46131, 45367, 0,
                        45391, 45393, 45395, 45392, 45394, 0,
                        45386, 45390, 45389, 45387, 45388, 0,
                        46313, 45352, 45354, 45351, 45353, 0,
                        45346, 45349, 45348, 45345, 45347, 0,
                        45356, 45359, 45358, 45355, 45357, 0,
                        45398, 45400, 45396, 45397, 45399, 0,
                        45361, 45363, 45364, 45360, 45362, 0,
                        45408, 45410, 45411, 45406, 45409, 0,
                        45402, 45404, 45405, 45401, 45403, 0,
                        45412, 45415, 45413, 45414, 45416, 0,
                        45431, 45433, 45429, 45430, 45432, 0,
                        45425, 45428, 45424, 45426, 45427, 0,
                        45342, 45344, 45340, 45341, 45343, 0,
                        45336, 45339, 45335, 45337, 45338, 0,
                        45372, 45373, 45374, 45370, 45371, 0,
                        45377, 45380, 45375, 45376, 45379, 0,
                        45382, 45385, 45381, 45383, 45384, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        46321, 46320, 46323, 46322, 0,
                    },
                },
            },
        }),
        [3039] = ShortCircuit(EXPANSION_PHASE > 3.2, {
            Name = "Ulduar 10",
            ButtonName = "[10] Ulduar",
            NameShort = "Uld 10",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Flame Leviathan",
                    Loot =
                    {
                        45117, 45119, 45108, 45118, 45109, 45107, 45111, 0,
                        45116, 45113, 45106, 45112, 0,
                        45114, 45115, 45110, 45086, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "All Defences Active",
                    IndentType = 1,
                    Loot =
                    {
                        45293, 45300, 45295, 0,
                        45297, 0,
                        45296, 0,
                    },
                },
                {
                    Name = "Ignis the Furnace Master",
                    Loot =
                    {
                        45186, 45185, 45162, 45164, 45187, 45167, 45161, 45166, 0,
                        45157, 45168, 45158, 0,
                        45169, 45165, 45171, 45170, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Razorscale",
                    Loot =
                    {
                        45150, 45146, 45149, 45141, 45151, 45143, 45140, 45139, 0,
                        45138, 45148, 0,
                        45510, 45144, 45142, 45147, 45137, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "XT-002 Deconstructor",
                    Loot =
                    {
                        45253, 45258, 45260, 45259, 45249, 45251, 45252, 45248, 0,
                        45250, 45247, 0,
                        45254, 45255, 45246, 45256, 45257, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Heart Broken",
                    IndentType = 1,
                    Loot =
                    {
                        45869, 45867, 0,
                        45871, 0,
                        45868, 45870, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "The Iron Council",
                    Loot =
                    {
                        45240, 45238, 45237, 45232, 45227, 45239, 45226, 45225, 45228, 0,
                        45224, 45193, 45236, 45235, 0,
                        45233, 45234, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Steelbreaker Last",
                    IndentType = 1,
                    Loot =
                    {
                        45455, 0,
                        45447, 45456, 0,
                        45449, 45448, 0,
                    },
                },
                {
                    Name = "Kologarn",
                    Loot =
                    {
                        45272, 45275, 45273, 45265, 45274, 45264, 45269, 45268, 45267, 0,
                        45262, 45263, 0,
                        45270, 45271, 45266, 45261, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Algalon the Observer",
                    Loot =
                    {
                        46045, 46050, 46043, 46049, 46044, 46037, 46039, 46041, 0,
                        46042, 46047, 46040, 46048, 46046, 46038, 46051, 0,
                        46052, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Auriaya",
                    Loot =
                    {
                        45435, 45441, 45439, 45325, 45440, 45320, 45334, 45434, 0,
                        45319, 45326, 45438, 0,
                        45436, 45437, 45315, 45327, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Hodir",
                    Loot =
                    {
                        45632, 45633, 45634, 0,
                        45453, 45454, 45452, 0,
                        45451, 0,
                        45450, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Unbroken Cache",
                    IndentType = 1,
                    Loot =
                    {
                        45888, 0,
                        45876, 45886, 45887, 45877, 0,
                    },
                },
                {
                    Name = "Thorim",
                    Loot =
                    {
                        45638, 45639, 45640, 0,
                        45468, 45467, 0,
                        45469, 45466, 0,
                        45463, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Sif Present",
                    IndentType = 1,
                    Loot =
                    {
                        45928, 0,
                        45933, 45931, 45929, 0,
                        45930, 0,
                    },
                },
                {
                    Name = "Freya",
                    Loot =
                    {
                        45653, 45654, 45655, 0,
                        45483, 45482, 45481, 0,
                        45480, 45479, 0,
                        46110, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "All Elders Alive",
                    IndentType = 1,
                    Loot =
                    {
                        45943, 0,
                        45945, 45946, 0,
                        45947, 45294, 0,
                    },
                },
                {
                    Name = "Mimiron",
                    Loot =
                    {
                        45641, 45642, 45643, 0,
                        45492, 45491, 0,
                        45493, 45490, 0,
                        45489, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Self Destruct Activated",
                    IndentType = 1,
                    Loot =
                    {
                        45993, 45989, 45982, 45988, 0,
                        45990, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "General Vezax",
                    Loot =
                    {
                        45514, 45508, 45512, 45504, 45513, 45502, 45505, 45501, 0,
                        45503, 45515, 45507, 0,
                        45509, 45145, 45498, 45511, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Saronite Animus Defeated",
                    IndentType = 1,
                    Loot =
                    {
                        46034, 0,
                        46032, 0,
                        46036, 46035, 46033, 0,
                    },
                },
                {
                    Name = "Yogg-Saron",
                    Loot =
                    {
                        45656, 45657, 45658, 0,
                        45532, 45523, 45524, 45531, 0,
                        45529, 45525, 45530, 45522, 0,
                        45527, 45521, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "One or Fewer Keepers",
                    IndentType = 1,
                    Loot =
                    {
                        46068, 46095, 0,
                        46096, 0,
                        46097, 46067, 0,
                    },
                },
                {
                    Name = "No Keepers",
                    IndentType = 1,
                    Loot =
                    {
                        46312, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        45549, 45547, 45548, 45543, 45544, 45542, 0,
                        45541, 45540, 45539, 45538, 0,
                        45605, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        45104, 45102, 45105, 45103, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        45100, 45094, 45096, 45095, 45101, 45098, 45099, 45097, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        45089, 45088, 45092, 45090, 45093, 45091, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        46027, 46348, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 8 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        46140, 46136, 46137, 46135, 46139, 0,
                        46129, 46134, 46130, 46132, 46133, 0,
                        46172, 46165, 46168, 46163, 46170, 0,
                        46197, 46190, 46193, 46188, 46195, 0,
                        46191, 46196, 46194, 46189, 46192, 0,
                        46184, 46187, 46186, 46183, 46185, 0,
                        46161, 46157, 46159, 46158, 46160, 0,
                        46125, 46127, 46123, 46124, 46126, 0,
                        46143, 46145, 46141, 46142, 46144, 0,
                        46209, 46211, 46206, 46207, 46210, 0,
                        46201, 46204, 46198, 46199, 46202, 0,
                        46212, 46203, 46205, 46200, 46208, 0,
                        46151, 46149, 46146, 46148, 46150, 0,
                        46166, 46167, 46162, 46164, 46169, 0,
                        46115, 46117, 46111, 46113, 46116, 0,
                        46120, 46122, 46118, 46119, 46121, 0,
                        46180, 46182, 46178, 46179, 46181, 0,
                        46156, 46152, 46154, 46155, 46153, 0,
                        46175, 46177, 46173, 46174, 46176, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        46321, 46320, 46323, 46322, 0,
                    },
                },
            },
        }),
        [3041] = {
            Name = "Ulduar 25",
            ButtonName = "[25] Ulduar",
            NameShort = "Uld 25",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Flame Leviathan",
                    Loot =
                    {
                        45117, 45119, 45108, 45118, 45109, 45107, 45111, 0,
                        45116, 45113, 45106, 45112, 0,
                        45114, 45115, 45110, 45086, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "All Defences Active",
                    IndentType = 1,
                    Loot =
                    {
                        45135, 45136, 45134, 0,
                        45133, 0,
                        45132, 0,
                    },
                },
                {
                    Name = "Ignis the Furnace Master",
                    Loot =
                    {
                        45186, 45185, 45162, 45164, 45187, 45167, 45161, 45166, 0,
                        45157, 45168, 45158, 0,
                        45169, 45165, 45171, 45170, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Razorscale",
                    Loot =
                    {
                        45150, 45146, 45149, 45141, 45151, 45143, 45140, 45139, 0,
                        45138, 45148, 0,
                        45510, 45144, 45142, 45147, 45137, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "XT-002 Deconstructor",
                    Loot =
                    {
                        45253, 45258, 45260, 45259, 45249, 45251, 45252, 45248, 0,
                        45250, 45247, 0,
                        45254, 45255, 45246, 45256, 45257, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Heart Broken",
                    IndentType = 1,
                    Loot =
                    {
                        45446, 45444, 45445, 0,
                        45443, 0,
                        45442, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "The Iron Council",
                    Loot =
                    {
                        45240, 45238, 45237, 45232, 45227, 45239, 45226, 45225, 45228, 0,
                        45224, 45193, 45236, 45235, 0,
                        45233, 45234, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Steelbreaker Last",
                    IndentType = 1,
                    Loot =
                    {
                        45245, 45244, 45241, 0,
                        45242, 45243, 0,
                        45607, 0,
                    },
                },
                {
                    Name = "Kologarn",
                    Loot =
                    {
                        45272, 45275, 45273, 45265, 45274, 45264, 45269, 45268, 45267, 0,
                        45262, 45263, 0,
                        45270, 45271, 45266, 45261, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Algalon the Observer",
                    Loot =
                    {
                        45665, 45619, 45611, 45616, 45610, 45615, 45594, 45599, 0,
                        45609, 0,
                        45617, 45620, 45607, 45612, 45613, 45587, 45570, 0,
                        46053, 0,
                        45038, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Auriaya",
                    Loot =
                    {
                        45435, 45441, 45439, 45325, 45440, 45320, 45334, 45434, 0,
                        45319, 45326, 45438, 0,
                        45436, 45437, 45315, 45327, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Hodir",
                    Loot =
                    {
                        45632, 45633, 45634, 0,
                        45453, 45454, 45452, 0,
                        45451, 0,
                        45450, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Unbroken Cache",
                    IndentType = 1,
                    Loot =
                    {
                        45462, 45460, 0,
                        45461, 45459, 0,
                        45612, 45457, 0,
                    },
                },
                {
                    Name = "Thorim",
                    Loot =
                    {
                        45638, 45639, 45640, 0,
                        45468, 45467, 0,
                        45469, 45466, 0,
                        45463, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Sif Present",
                    IndentType = 1,
                    Loot =
                    {
                        45473, 45474, 45472, 0,
                        45471, 0,
                        45570, 45470, 0,
                    },
                },
                {
                    Name = "Freya",
                    Loot =
                    {
                        45653, 45654, 45655, 0,
                        45483, 45482, 45481, 0,
                        45480, 45479, 0,
                        46110, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "All Elders Alive",
                    IndentType = 1,
                    Loot =
                    {
                        45488, 45487, 0,
                        45486, 45485, 0,
                        45484, 45613, 0,
                    },
                },
                {
                    Name = "Mimiron",
                    Loot =
                    {
                        45641, 45642, 45643, 0,
                        45492, 45491, 0,
                        45493, 45490, 0,
                        45489, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Self Destruct Activated",
                    IndentType = 1,
                    Loot =
                    {
                        45497, 45663, 0,
                        45496, 45495, 0,
                        45494, 45620, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "General Vezax",
                    Loot =
                    {
                        45514, 45508, 45512, 45504, 45513, 45502, 45505, 45501, 0,
                        45503, 45515, 45507, 0,
                        45509, 45145, 45498, 45511, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "Saronite Animus Defeated",
                    IndentType = 1,
                    Loot =
                    {
                        45520, 45519, 0,
                        45517, 45518, 0,
                        45516, 0,
                    },
                },
                {
                    Name = "Yogg-Saron",
                    Loot =
                    {
                        45656, 45657, 45658, 0,
                        45532, 45523, 45524, 45531, 0,
                        45529, 45525, 45530, 45522, 0,
                        45527, 45521, 0,
                        45038, 0,
                    },
                },
                {
                    Name = "One or Fewer Keepers",
                    IndentType = 1,
                    Loot =
                    ConcatenateIf({
                        45537, 45536, 0,
                        45534, 45535, 0,
                        45533, 0,
                    }, EXPANSION_PHASE <= 3.2, {45038, 0,}),
                },
                {
                    Name = "No Keepers",
                    IndentType = 1,
                    Loot =
                    ConcatenateIf({
                        45693, 0,
                    }, EXPANSION_PHASE <= 3.2, {45038, 0,}),
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        45549, 45547, 45548, 45543, 45544, 45542, 0,
                        45541, 45540, 45539, 45538, 0,
                        45605, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        45104, 45102, 45105, 45103, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        45100, 45094, 45096, 45095, 45101, 45098, 45099, 45097, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        45089, 45088, 45092, 45090, 45093, 45091, 0,
                    },
                },
                {
                    Name = "Enchanting",
                    IndentType = 1,
                    Loot =
                    {
                        46027, 46348, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 8 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        46140, 46136, 46137, 46135, 46139, 0,
                        46129, 46134, 46130, 46132, 46133, 0,
                        46172, 46165, 46168, 46163, 46170, 0,
                        46197, 46190, 46193, 46188, 46195, 0,
                        46191, 46196, 46194, 46189, 46192, 0,
                        46184, 46187, 46186, 46183, 46185, 0,
                        46161, 46157, 46159, 46158, 46160, 0,
                        46125, 46127, 46123, 46124, 46126, 0,
                        46143, 46145, 46141, 46142, 46144, 0,
                        46209, 46211, 46206, 46207, 46210, 0,
                        46201, 46204, 46198, 46199, 46202, 0,
                        46212, 46203, 46205, 46200, 46208, 0,
                        46151, 46149, 46146, 46148, 46150, 0,
                        46166, 46167, 46162, 46164, 46169, 0,
                        46115, 46117, 46111, 46113, 46116, 0,
                        46120, 46122, 46118, 46119, 46121, 0,
                        46180, 46182, 46178, 46179, 46181, 0,
                        46156, 46152, 46154, 46155, 46153, 0,
                        46175, 46177, 46173, 46174, 46176, 0,
                    },
                },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        45618, 45614, 45588, 45608, 0,
                        46017, 0,
                    },
                },
            },
        },
        
        -- Trial of the Crusader
        [3051] = {
            Name = "Trial of the Crusader 10",
            ButtonName = "[10] Trial of the Crusader",
            NameShort = "ToC 10",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 2,
            Children =
            Squish{
                { Name = "The Beasts of Northrend", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47617, 47613, 47608, 47616, 47610, 47611, 47609, 47615, 47614, 0,
                        47607, 47578, 0,
                        47612, 0,
                        
                        -- Horde
                        47855, 47857, 47853, 47860, 47850, 47852, 47851, 47859, 47858, 0,
                        47849, 47854, 0,
                        47856, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47921, 47923, 47919, 47926, 47916, 47918, 47917, 47924, 47925, 0,
                        47915, 47920, 0,
                        47922, 0,
                        
                        -- Horde
                        47994, 47996, 47992, 47999, 47989, 47991, 47990, 47998, 47997, 0,
                        47988, 47993, 0,
                        47995, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47617, 47921, 47613, 47923, 47608, 47919, 47616, 47926, 47610, 47916, 47611, 47918, 47609, 47917, 47615, 47924, 47614, 47925, 0,
                        47607, 47915, 47578, 47920, 0,
                        47612, 47922, 0,
                        
                        -- Horde
                        47855, 47994, 47857, 47996, 47853, 47992, 47860, 47999, 47850, 47989, 47852, 47991, 47851, 47990, 47859, 47998, 47858, 47997, 0,
                        47849, 47988, 47854, 47993, 0,
                        47856, 47995, 0,
                    },
                },
                { Name = "Lord Jaraxxus", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47663, 47620, 47669, 47621, 49235, 47683, 47680, 47711, 0,
                        47619, 47679, 47618, 47703, 0,
                        47676, 0,
                        
                        -- Horde
                        47861, 47865, 47863, 47866, 49236, 47867, 47869, 47870, 0,
                        47872, 47864, 47862, 47868, 0,
                        47871, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47927, 47931, 47929, 47932, 49238, 47933, 47935, 47937, 0,
                        47930, 47939, 47928, 47934, 0,
                        47938, 0,
                        
                        -- Horde
                        48000, 48004, 48002, 48005, 49237, 48006, 48008, 48009, 0,
                        48011, 48003, 48001, 48007, 0,
                        48010, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47663, 47927, 47620, 47931, 47669, 47929, 47621, 47932, 49235, 49238, 47683, 47933, 47680, 47935, 47711, 47937, 0,
                        47619, 47930, 47679, 47939, 47618, 47928, 47703, 47934, 0,
                        47676, 47938, 0,
                        
                        -- Horde
                        47861, 48000, 47865, 48004, 47863, 48002, 47866, 48005, 49236, 49237, 47867, 48006, 47869, 48008, 47870, 48009, 0,
                        47872, 48011, 47864, 48003, 47862, 48001, 47868, 48007, 0,
                        47871, 48010, 0,
                    },
                },
                { Name = "Faction Champions", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47721, 47719, 47718, 47717, 47720, 0,
                        47728, 47727, 47726, 47725, 0,
                        47724, 0,
                        
                        -- Horde
                        47873, 47878, 47875, 47876, 47877, 0,
                        47880, 47882, 47879, 47881, 0,
                        47874, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47940, 47945, 47942, 47943, 47944, 0,
                        47947, 47949, 47946, 47948, 0,
                        47941, 0,
                        
                        -- Horde
                        48012, 48017, 48014, 48015, 48016, 0,
                        48019, 48021, 48018, 48020, 0,
                        48013, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47721, 47940, 47719, 47945, 47718, 47942, 47717, 47943, 47720, 47944, 0,
                        47728, 47947, 47727, 47949, 47726, 47946, 47725, 47948, 0,
                        47724, 47941, 0,
                        
                        -- Horde
                        47873, 48012, 47878, 48017, 47875, 48014, 47876, 48015, 47877, 48016, 0,
                        47880, 48019, 47882, 48021, 47879, 48018, 47881, 48020, 0,
                        47874, 48013, 0,
                    },
                },
                { Name = "The Twin Val'kyr", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47745, 49231, 47746, 47739, 47744, 47738, 0,
                        47747, 47700, 0,
                        47742, 47736, 47737, 47743, 47740, 0,
                        
                        -- Horde
                        47889, 49232, 47891, 47887, 47893, 47885, 0,
                        47890, 47888, 0,
                        47913, 47886, 47884, 47892, 47883, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47956, 49234, 47959, 47954, 47961, 47952, 0,
                        47957, 47955, 0,
                        47958, 47953, 47951, 47960, 47950, 0,
                        
                        -- Horde
                        48028, 49233, 48034, 48026, 48038, 48024, 0,
                        48030, 48027, 0,
                        48032, 48025, 48023, 48036, 48022, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47745, 47956, 49231, 49234, 47746, 47959, 47739, 47954, 47744, 47961, 47738, 47952, 0,
                        47747, 47957, 47700, 47955, 0,
                        47742, 47958, 47736, 47953, 47737, 47951, 47743, 47960, 47740, 47950, 0,
                        
                        -- Horde
                        47889, 48028, 49232, 49233, 47891, 48034, 47887, 48026, 47893, 48038, 47885, 48024, 0,
                        47890, 48030, 47888, 48027, 0,
                        47913, 48032, 47886, 48025, 47884, 48023, 47892, 48036, 47883, 48022, 0,
                    },
                },
                { Name = "Anub'arak", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47838, 47837, 47832, 47813, 47829, 47811, 47836, 47830, 0,
                        47810, 47814, 47808, 47809, 47816, 47834, 47815, 47835, 47812, 47741, 0,
                        
                        -- Horde
                        47906, 47909, 47904, 47897, 47901, 47896, 47902, 47908, 0,
                        47899, 47903, 47898, 47894, 47905, 47911, 47900, 47910, 47895, 47907, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47974, 47977, 47972, 47965, 47969, 47964, 47976, 47970, 0,
                        47967, 47971, 47966, 47962, 47973, 47979, 47968, 47978, 47963, 47975, 0,
                        
                        -- Horde
                        48051, 48054, 48049, 48042, 48046, 48041, 48047, 48053, 0,
                        48044, 48048, 48043, 48039, 48050, 48056, 48045, 48055, 48040, 48052, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47838, 47974, 47837, 47977, 47832, 47972, 47813, 47965, 47829, 47969, 47811, 47964, 47836, 47976, 47830, 47970, 0,
                        47810, 47967, 47814, 47971, 47808, 47966, 47809, 47962, 47816, 47973, 47834, 47979, 47815, 47968, 47835, 47978, 47812, 47963, 47741, 47975, 0,
                        
                        -- Horde
                        47906, 48051, 47909, 48054, 47904, 48049, 47897, 48042, 47901, 48046, 47896, 48041, 47902, 48047, 47908, 48053, 0,
                        47899, 48044, 47903, 48048, 47898, 48043, 47894, 48039, 47905, 48050, 47911, 48056, 47900, 48045, 47910, 48055, 47895, 48040, 47907, 48052, 0,
                    },
                },
                { Separator = true },
                { Name = "Tribute Chest (Heroic only)", Header = true },
                {
                    Name = "1-24 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        47556, 0,
                    },
                },
                {
                    Name = "25-44 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        48708, 48709, 48712, 48713, 48710, 48714, 48711, 0,
                        
                        -- Horde
                        48701, 48693, 48703, 48695, 48705, 48699, 48697, 0,
                    },
                },
                {
                    Name = "45-49 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                    },
                },
                {
                    Name = "50 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        49044, 0,
                        48672, 48671, 48674, 48673, 48675, 0,
                        
                        -- Horde
                        49046, 0,
                        48667, 48666, 48669, 48668, 48670, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47654, 47655, 47656, 47657, 0,
                        
                        -- Horde
                        47639, 47638, 47637, 47636, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47629, 47635, 47631, 47630, 47628, 47634, 47632, 47633, 0,
                        
                        -- Horde
                        47646, 47647, 47648, 47649, 47650, 47651, 47652, 47653, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47622, 47623, 47627, 47626, 47624, 47625, 0,
                        
                        -- Horde
                        47640, 47641, 47642, 47643, 47644, 47645, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 9 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        -- Alliance
                        47778, 47781, 47779, 47782, 47780, 0,
                        47754, 47757, 47756, 47753, 47755, 0,
                        48078, 48081, 48080, 48077, 48079, 0,
                        47984, 47987, 47986, 47983, 47985, 0,
                        48164, 48167, 48166, 48163, 48165, 0,
                        48134, 48137, 48136, 48133, 48135, 0,
                        48211, 48208, 48209, 48212, 48210, 0,
                        48225, 48227, 48223, 48224, 48226, 0,
                        48257, 48259, 48255, 48256, 48258, 0,
                        48318, 48320, 48316, 48317, 48319, 0,
                        48287, 48289, 48285, 48286, 48288, 0,
                        48348, 48350, 48346, 48347, 48349, 0,
                        48378, 48380, 48376, 48377, 48379, 0,
                        48430, 48454, 48450, 48452, 48446, 0,
                        48483, 48485, 48481, 48482, 48484, 0,
                        48540, 48542, 48538, 48539, 48541, 0,
                        48577, 48579, 48575, 48576, 48578, 0,
                        48609, 48611, 48607, 48608, 48610, 0,
                        48639, 48637, 48641, 48640, 48638, 0,
                        
                        -- Horde
                        47804, 47807, 47806, 47803, 47805, 0,
                        47771, 47768, 47769, 47772, 47770, 0,
                        48095, 48092, 48093, 48096, 48094, 0,
                        48065, 48062, 48063, 48066, 48064, 0,
                        48181, 48178, 48179, 48182, 48180, 0,
                        48151, 48148, 48149, 48152, 48150, 0,
                        48194, 48197, 48196, 48193, 48195, 0,
                        48240, 48238, 48242, 48241, 48239, 0,
                        48272, 48270, 48274, 48273, 48271, 0,
                        48333, 48331, 48335, 48334, 48332, 0,
                        48302, 48304, 48300, 48301, 48303, 0,
                        48363, 48361, 48365, 48364, 48362, 0,
                        48393, 48395, 48391, 48392, 48394, 0,
                        48463, 48465, 48461, 48462, 48464, 0,
                        48498, 48496, 48500, 48499, 48497, 0,
                        48555, 48553, 48557, 48556, 48554, 0,
                        48592, 48590, 48594, 48593, 48591, 0,
                        48624, 48622, 48626, 48625, 48623, 0,
                        48659, 48661, 48657, 48658, 48660, 0,
                    },
                },
            },
        },
        [3053] = {
            Name = "Trial of the Crusader 25",
            ButtonName = "[25] Trial of the Crusader",
            NameShort = "ToC 25",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 2,
            Children =
            Squish{
                { Name = "The Beasts of Northrend", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        46992, 46972, 46974, 46988, 46960, 46990, 46962, 46961, 46985, 0,
                        46970, 46976, 46959, 0,
                        46979, 46958, 46963, 0,
                        
                        -- Horde
                        47264, 47258, 47259, 47262, 47251, 47265, 47254, 47253, 47263, 0,
                        47257, 47256, 47252, 0,
                        47261, 47255, 47260, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        46993, 46973, 46975, 46989, 46965, 46991, 46968, 46967, 46986, 0,
                        46971, 46977, 46966, 0,
                        46980, 46969, 46964, 0,
                        
                        -- Horde
                        47425, 47419, 47420, 47423, 47412, 47426, 47415, 47414, 47424, 0,
                        47418, 47417, 47413, 0,
                        47422, 47416, 47421, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        46992, 46993, 46972, 46973, 46974, 46975, 46988, 46989, 46960, 46965, 46990, 46991, 46962, 46968, 46961, 46967, 46985, 46986, 0,
                        46970, 46971, 46976, 46977, 46959, 46966, 0,
                        46979, 46980, 46958, 46969, 46963, 46964, 0,
                        
                        -- Horde
                        47264, 47425, 47258, 47419, 47259, 47420, 47262, 47423, 47251, 47412, 47265, 47426, 47254, 47415, 47253, 47414, 47263, 47424, 0,
                        47257, 47418, 47256, 47417, 47252, 47413, 0,
                        47261, 47422, 47255, 47416, 47260, 47421, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                { Name = "Lord Jaraxxus", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47051, 47000, 47055, 47056, 46999, 47057, 47052, 46997, 0,
                        47042, 47043, 47223, 47041, 0,
                        47053, 46996, 46994, 0,
                        
                        -- Horde
                        47274, 47270, 47277, 47280, 47268, 47279, 47273, 47269, 0,
                        47275, 47272, 47278, 47271, 0,
                        47276, 47266, 47267, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47062, 47004, 47066, 47068, 47002, 47067, 47061, 47003, 0,
                        47063, 47060, 47224, 47059, 0,
                        47064, 47001, 46995, 0,
                        
                        -- Horde
                        47435, 47431, 47438, 47441, 47429, 47440, 47434, 47430, 0,
                        47436, 47433, 47439, 47432, 0,
                        47437, 47427, 47428, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47051, 47062, 47000, 47004, 47055, 47066, 47056, 47068, 46999, 47002, 47057, 47067, 47052, 47061, 46997, 47003, 0,
                        47042, 47063, 47043, 47060, 47223, 47224, 47041, 47059, 0,
                        47053, 47064, 46996, 47001, 46994, 46995, 0,
                        
                        -- Horde
                        47274, 47435, 47270, 47431, 47277, 47438, 47280, 47441, 47268, 47429, 47279, 47440, 47273, 47434, 47269, 47430, 0,
                        47275, 47436, 47272, 47433, 47278, 47439, 47271, 47432, 0,
                        47276, 47437, 47266, 47427, 47267, 47428, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                { Name = "Faction Champions", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47081, 47092, 47094, 47071, 47073, 47083, 47090, 47082, 47093, 47072, 0,
                        47089, 47070, 47080, 0,
                        47069, 47079, 0,
                        
                        -- Horde
                        47286, 47293, 47292, 47284, 47281, 47289, 47295, 47288, 47294, 47283, 0,
                        47291, 47282, 47290, 0,
                        47285, 47287, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47084, 47097, 47096, 47077, 47074, 47087, 47099, 47086, 47098, 47076, 0,
                        47095, 47075, 47088, 0,
                        47078, 47085, 0,
                        
                        -- Horde
                        47447, 47454, 47453, 47445, 47442, 47450, 47456, 47449, 47455, 47444, 0,
                        47452, 47443, 47451, 0,
                        47446, 47448, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47081, 47084, 47092, 47097, 47094, 47096, 47071, 47077, 47073, 47074, 47083, 47087, 47090, 47099, 47082, 47086, 47093, 47098, 47072, 47076, 0,
                        47089, 47095, 47070, 47075, 47080, 47088, 0,
                        47069, 47078, 47079, 47085, 0,
                        
                        -- Horde
                        47286, 47447, 47293, 47454, 47292, 47453, 47284, 47445, 47281, 47442, 47289, 47450, 47295, 47456, 47288, 47449, 47294, 47455, 47283, 47444, 0,
                        47291, 47452, 47282, 47443, 47290, 47451, 0,
                        47285, 47446, 47287, 47448, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                { Name = "The Twin Val'kyr", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47126, 47141, 47107, 47140, 47106, 47142, 47108, 47121, 0,
                        47116, 47105, 47139, 47115, 0,
                        47138, 47104, 47114, 0,
                        
                        -- Horde
                        47301, 47306, 47308, 47299, 47296, 47310, 47298, 47304, 0,
                        47307, 47305, 47297, 47303, 0,
                        47309, 47300, 47302, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47129, 47143, 47112, 47145, 47109, 47147, 47111, 47132, 0,
                        47133, 47110, 47144, 47131, 0,
                        47146, 47113, 47130, 0,
                        
                        -- Horde
                        47462, 47467, 47469, 47460, 47457, 47471, 47459, 47465, 0,
                        47468, 47466, 47458, 47464, 0,
                        47470, 47461, 47463, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47126, 47129, 47141, 47143, 47107, 47112, 47140, 47145, 47106, 47109, 47142, 47147, 47108, 47111, 47121, 47132, 0,
                        47116, 47133, 47105, 47110, 47139, 47144, 47115, 47131, 0,
                        47138, 47146, 47104, 47113, 47114, 47130, 0,
                        
                        -- Horde
                        47301, 47462, 47306, 47467, 47308, 47469, 47299, 47460, 47296, 47457, 47310, 47471, 47298, 47459, 47304, 47465, 0,
                        47307, 47468, 47305, 47466, 47297, 47458, 47303, 47464, 0,
                        47309, 47470, 47300, 47461, 47302, 47463, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                { Name = "Anub'arak", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47203, 47235, 47187, 47194, 47151, 47186, 47204, 47152, 47184, 47234, 47195, 47150, 0,
                        47225, 47183, 47054, 47149, 47182, 0,
                        47148, 47193, 47233, 0,
                        
                        -- Horde
                        47324, 47326, 47317, 47321, 47313, 47318, 47325, 47311, 47319, 47330, 47323, 47312, 0,
                        47328, 47320, 47315, 47327, 47316, 0,
                        47314, 47322, 47329, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47208, 47236, 47189, 47205, 47155, 47190, 47209, 47153, 47191, 47240, 47207, 47154, 0,
                        47238, 47192, 47237, 47157, 47188, 0,
                        47156, 47206, 47239, 0,
                        
                        -- Horde
                        47485, 47487, 47478, 47482, 47474, 47479, 47486, 47472, 47480, 47492, 47484, 47473, 0,
                        47490, 47481, 47476, 47489, 47477, 0,
                        47475, 47483, 47491, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        47242, 0,
                        
                        -- Alliance
                        47203, 47208, 47235, 47236, 47187, 47189, 47194, 47205, 47151, 47155, 47186, 47190, 47204, 47209, 47152, 47153, 47184, 47191, 47234, 47240, 47195, 47207, 47150, 47154, 0,
                        47225, 47238, 47183, 47192, 47054, 47237, 47149, 47157, 47182, 47188, 0,
                        47148, 47156, 47193, 47206, 47233, 47239, 0,
                        
                        -- Horde
                        47324, 47485, 47326, 47487, 47317, 47478, 47321, 47482, 47313, 47474, 47318, 47479, 47325, 47486, 47311, 47472, 47319, 47480, 47330, 47492, 47323, 47484, 47312, 47473, 0,
                        47328, 47490, 47320, 47481, 47315, 47476, 47327, 47489, 47316, 47477, 0,
                        47314, 47475, 47322, 47483, 47329, 47491, 0,
                        
                        -- Crusader Orb
                        47556,
                    },
                },
                { Separator = true },
                { Name = "Tribute Chest (Heroic only)", Header = true },
                {
                    Name = "1-24 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        47557, 47558, 47559, 0,
                    },
                },
                {
                    Name = "25-44 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47517, 47524, 47526, 47519, 47515, 47506, 47521, 0,
                        
                        -- Horde
                        47518, 47525, 47528, 47520, 47516, 47513, 47523, 0,
                    },
                },
                {
                    Name = "45-49 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        47557, 47558, 47559, 0,
                    },
                },
                {
                    Name = "50 Attempts left",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        49096, 0,
                        47553, 47552, 47547, 47545, 47549, 0,
                        
                        -- Horde
                        49098, 0,
                        47554, 47551, 47548, 47546, 47550, 0,
                    },
                },
                { Separator = true },
                { Name = "Recipes", Header = true },
                {
                    Name = "Tailoring",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47654, 47655, 47656, 47657, 0,
                        
                        -- Horde
                        47639, 47638, 47637, 47636, 0,
                    },
                },
                {
                    Name = "Leatherworking",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47629, 47635, 47631, 47630, 47628, 47634, 47632, 47633, 0,
                        
                        -- Horde
                        47646, 47647, 47648, 47649, 47650, 47651, 47652, 47653, 0,
                    },
                },
                {
                    Name = "Blacksmithing",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47622, 47623, 47627, 47626, 47624, 47625, 0,
                        
                        -- Horde
                        47640, 47641, 47642, 47643, 47644, 47645, 0,
                    },
                },
                { Separator = true },
                { Name = "Tier 9 Pieces", Header = true },
                {
                    Name = "Normal",
                    IndentType = 2,
                    Loot =
                    {
                        -- Alliance
                        47778, 47781, 47779, 47782, 47780, 0,
                        47754, 47757, 47756, 47753, 47755, 0,
                        48078, 48081, 48080, 48077, 48079, 0,
                        47984, 47987, 47986, 47983, 47985, 0,
                        48164, 48167, 48166, 48163, 48165, 0,
                        48134, 48137, 48136, 48133, 48135, 0,
                        48211, 48208, 48209, 48212, 48210, 0,
                        48225, 48227, 48223, 48224, 48226, 0,
                        48257, 48259, 48255, 48256, 48258, 0,
                        48318, 48320, 48316, 48317, 48319, 0,
                        48287, 48289, 48285, 48286, 48288, 0,
                        48348, 48350, 48346, 48347, 48349, 0,
                        48378, 48380, 48376, 48377, 48379, 0,
                        48430, 48454, 48450, 48452, 48446, 0,
                        48483, 48485, 48481, 48482, 48484, 0,
                        48540, 48542, 48538, 48539, 48541, 0,
                        48577, 48579, 48575, 48576, 48578, 0,
                        48609, 48611, 48607, 48608, 48610, 0,
                        48639, 48637, 48641, 48640, 48638, 0,
                        
                        -- Horde
                        47804, 47807, 47806, 47803, 47805, 0,
                        47771, 47768, 47769, 47772, 47770, 0,
                        48095, 48092, 48093, 48096, 48094, 0,
                        48065, 48062, 48063, 48066, 48064, 0,
                        48181, 48178, 48179, 48182, 48180, 0,
                        48151, 48148, 48149, 48152, 48150, 0,
                        48194, 48197, 48196, 48193, 48195, 0,
                        48240, 48238, 48242, 48241, 48239, 0,
                        48272, 48270, 48274, 48273, 48271, 0,
                        48333, 48331, 48335, 48334, 48332, 0,
                        48302, 48304, 48300, 48301, 48303, 0,
                        48363, 48361, 48365, 48364, 48362, 0,
                        48393, 48395, 48391, 48392, 48394, 0,
                        48463, 48465, 48461, 48462, 48464, 0,
                        48498, 48496, 48500, 48499, 48497, 0,
                        48555, 48553, 48557, 48556, 48554, 0,
                        48592, 48590, 48594, 48593, 48591, 0,
                        48624, 48622, 48626, 48625, 48623, 0,
                        48659, 48661, 48657, 48658, 48660, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 2,
                    Loot =
                    {
                        -- Alliance
                        47789, 47792, 47791, 47788, 47790, 0,
                        47761, 47758, 47759, 47762, 47760, 0,
                        48085, 48082, 48083, 48086, 48084, 0,
                        48035, 48029, 48031, 48037, 48033, 0,
                        48171, 48168, 48169, 48172, 48170, 0,
                        48141, 48138, 48139, 48142, 48140, 0,
                        48204, 48207, 48206, 48203, 48205, 0,
                        48230, 48228, 48232, 48231, 48229, 0,
                        48262, 48260, 48264, 48263, 48261, 0,
                        48323, 48321, 48325, 48324, 48322, 0,
                        48292, 48290, 48294, 48293, 48291, 0,
                        48353, 48351, 48355, 48354, 48352, 0,
                        48383, 48381, 48385, 48384, 48382, 0,
                        48433, 48455, 48451, 48453, 48447, 0,
                        48488, 48486, 48490, 48489, 48487, 0,
                        48545, 48543, 48547, 48546, 48544, 0,
                        48582, 48580, 48584, 48583, 48581, 0,
                        48614, 48612, 48616, 48615, 48613, 0,
                        48644, 48646, 48642, 48643, 48645, 0,
                        
                        -- Horde
                        47796, 47793, 47794, 47797, 47795, 0,
                        47764, 47767, 47766, 47763, 47765, 0,
                        48088, 48091, 48090, 48087, 48089, 0,
                        48058, 48061, 48060, 48057, 48059, 0,
                        48174, 48177, 48176, 48173, 48175, 0,
                        48144, 48147, 48146, 48143, 48145, 0,
                        48201, 48198, 48199, 48202, 48200, 0,
                        48235, 48237, 48233, 48234, 48236, 0,
                        48267, 48269, 48265, 48266, 48268, 0,
                        48328, 48330, 48326, 48327, 48329, 0,
                        48307, 48309, 48305, 48306, 48308, 0,
                        48358, 48360, 48356, 48357, 48359, 0,
                        48398, 48400, 48396, 48397, 48399, 0,
                        48468, 48470, 48466, 48467, 48469, 0,
                        48493, 48495, 48491, 48492, 48494, 0,
                        48550, 48552, 48548, 48549, 48551, 0,
                        48587, 48585, 48589, 48588, 48586, 0,
                        48619, 48621, 48617, 48618, 48620, 0,
                        48649, 48647, 48651, 48650, 48648, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 2,
                    Loot =
                    {
                        -- Alliance
                        47778, 47789, 47781, 47792, 47779, 47791, 47782, 47788, 47780, 47790, 0,
                        47754, 47761, 47757, 47758, 47756, 47759, 47753, 47762, 47755, 47760, 0,
                        48078, 48085, 48081, 48082, 48080, 48083, 48077, 48086, 48079, 48084, 0,
                        47984, 48035, 47987, 48029, 47986, 48031, 47983, 48037, 47985, 48033, 0,
                        48164, 48171, 48167, 48168, 48166, 48169, 48163, 48172, 48165, 48170, 0,
                        48134, 48141, 48137, 48138, 48136, 48139, 48133, 48142, 48135, 48140, 0,
                        48211, 48204, 48208, 48207, 48209, 48206, 48212, 48203, 48210, 48205, 0,
                        48225, 48230, 48227, 48228, 48223, 48232, 48224, 48231, 48226, 48229, 0,
                        48257, 48262, 48259, 48260, 48255, 48264, 48256, 48263, 48258, 48261, 0,
                        48318, 48323, 48320, 48321, 48316, 48325, 48317, 48324, 48319, 48322, 0,
                        48287, 48292, 48289, 48290, 48285, 48294, 48286, 48293, 48288, 48291, 0,
                        48348, 48353, 48350, 48351, 48346, 48355, 48347, 48354, 48349, 48352, 0,
                        48378, 48383, 48380, 48381, 48376, 48385, 48377, 48384, 48379, 48382, 0,
                        48430, 48433, 48454, 48455, 48450, 48451, 48452, 48453, 48446, 48447, 0,
                        48483, 48488, 48485, 48486, 48481, 48490, 48482, 48489, 48484, 48487, 0,
                        48540, 48545, 48542, 48543, 48538, 48547, 48539, 48546, 48541, 48544, 0,
                        48577, 48582, 48579, 48580, 48575, 48584, 48576, 48583, 48578, 48581, 0,
                        48609, 48614, 48611, 48612, 48607, 48616, 48608, 48615, 48610, 48613, 0,
                        48639, 48644, 48637, 48646, 48641, 48642, 48640, 48643, 48638, 48645, 0,
                        
                        -- Horde
                        47804, 47796, 47807, 47793, 47806, 47794, 47803, 47797, 47805, 47795, 0,
                        47771, 47764, 47768, 47767, 47769, 47766, 47772, 47763, 47770, 47765, 0,
                        48095, 48088, 48092, 48091, 48093, 48090, 48096, 48087, 48094, 48089, 0,
                        48065, 48058, 48062, 48061, 48063, 48060, 48066, 48057, 48064, 48059, 0,
                        48181, 48174, 48178, 48177, 48179, 48176, 48182, 48173, 48180, 48175, 0,
                        48151, 48144, 48148, 48147, 48149, 48146, 48152, 48143, 48150, 48145, 0,
                        48194, 48201, 48197, 48198, 48196, 48199, 48193, 48202, 48195, 48200, 0,
                        48240, 48235, 48238, 48237, 48242, 48233, 48241, 48234, 48239, 48236, 0,
                        48272, 48267, 48270, 48269, 48274, 48265, 48273, 48266, 48271, 48268, 0,
                        48333, 48328, 48331, 48330, 48335, 48326, 48334, 48327, 48332, 48329, 0,
                        48302, 48307, 48304, 48309, 48300, 48305, 48301, 48306, 48303, 48308, 0,
                        48363, 48358, 48361, 48360, 48365, 48356, 48364, 48357, 48362, 48359, 0,
                        48393, 48398, 48395, 48400, 48391, 48396, 48392, 48397, 48394, 48399, 0,
                        48463, 48468, 48465, 48470, 48461, 48466, 48462, 48467, 48464, 48469, 0,
                        48498, 48493, 48496, 48495, 48500, 48491, 48499, 48492, 48497, 48494, 0,
                        48555, 48550, 48553, 48552, 48557, 48548, 48556, 48549, 48554, 48551, 0,
                        48592, 48587, 48590, 48585, 48594, 48589, 48593, 48588, 48591, 48586, 0,
                        48624, 48619, 48622, 48621, 48626, 48617, 48625, 48618, 48623, 48620, 0,
                        48659, 48649, 48661, 48647, 48657, 48651, 48658, 48650, 48660, 48648, 0,
                    },
                },
            },
        },
        
        -- Onyxia's Lair
        [3060] = {
            Name = "Onyxia's Lair 10",
            ButtonName = "[10] Onyxia's Lair",
            NameShort = "Ony 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Onyxia",
                    Loot =
                    {
                        49315, 0,
                        49318, 0,
                        49317, 49316, 0,
                        49327, 49326, 49328, 0,
                        49322, 0,
                        49319, 0,
                        49330, 49329, 49331, 0,
                        49321, 49320, 0,
                        49333, 49332, 0,
                        49323, 49325, 49324, 0,
                        
                        49307, 49306, 49309, 49463, 49310, 0,
                        49308, 49304, 49437, 49298, 49303, 49296, 49299, 49297, 49302, 49301, 49305, 0,
                        49644, 0,
                        49295, 49294, 0,
                        49636, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        49486, 49485, 49487, 0,
                    },
                },
            },
        },
        [3061] = {
            Name = "Onyxia's Lair 25",
            ButtonName = "[25] Onyxia's Lair",
            NameShort = "Ony 25",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 2,
            Children =
            Squish{
                {
                    Name = "Onyxia",
                    Loot =
                    {
                        49484, 0,
                        49481, 0,
                        49482, 49483, 0,
                        49472, 49473, 49471, 0,
                        49477, 0,
                        49480, 0,
                        49468, 49470, 49469, 0,
                        49478, 49479, 0,
                        49466, 49467, 0,
                        49476, 49474, 49475, 0,
                        
                        49491, 49492, 49489, 49464, 49488, 0,
                        49490, 49494, 49465, 49499, 49495, 49501, 49498, 49500, 49496, 49497, 49493, 0,
                        49644, 0,
                        49295, 49294, 0,
                        49636, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Quest Rewards",
                    IndentType = 2,
                    Loot =
                    {
                        49486, 49485, 49487, 0,
                    },
                },
            },
        },
        
        -- Icecrown Citadel
        [3071] = {
            Name = "Icecrown Citadel 10",
            ButtonName = "[10] Icecrown Citadel",
            NameShort = "ICC 10",
            Color = LootReserve.Constants.Colors.Size10,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Lord Marrowgar", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50773, 50774, 50762, 50775, 50772, 0,
                        50764, 50763, 50339, 0,
                        50771, 50761, 50759, 50760, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51930, 51929, 51935, 51928, 51931, 0,
                        51933, 51934, 50346, 0,
                        51932, 51936, 51938, 51937, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50773, 51930, 50774, 51929, 50762, 51935, 50775, 51928, 50772, 51931, 0,
                        50764, 51933, 50763, 51934, 50339, 50346, 0,
                        50771, 51932, 50761, 51936, 50759, 51938, 50760, 51937, 0,
                        49908, 0,
                    },
                },
                { Name = "Lady Deathwhisper", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50785, 50782, 50780, 50778, 50783, 50777, 50784, 50779, 50786, 0,
                        50342, 0,
                        50781, 50776, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51918, 51921, 51923, 51925, 51920, 51926, 51919, 51924, 51917, 0,
                        50343, 0,
                        51922, 51927, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50785, 51918, 50782, 51921, 50780, 51923, 50778, 51925, 50783, 51920, 50777, 51926, 50784, 51919, 50779, 51924, 50786, 51917, 0,
                        50342, 50343, 0,
                        50781, 51922, 50776, 51927, 0,
                        49908, 0,
                    },
                },
                { Name = "Icecrown Gunship Battle", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50795, 50797, 50792, 50789, 50796, 50788, 0,
                        50791, 50790, 50340, 0,
                        50793, 50787, 50794, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51908, 51906, 51911, 51914, 51907, 51915, 0,
                        51912, 51913, 50345, 0,
                        51910, 51916, 51909, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50795, 51908, 50797, 51906, 50792, 51911, 50789, 51914, 50796, 51907, 50788, 51915, 0,
                        50791, 51912, 50790, 51913, 50340, 50345, 0,
                        50793, 51910, 50787, 51916, 50794, 51909, 0,
                        49908, 0,
                    },
                },
                { Name = "Deathbringer Saurfang", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50807, 50804, 50799, 50806, 50800, 50801, 50802, 50808, 0,
                        50809, 50803, 0,
                        50798, 50805, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51896, 51899, 51904, 51897, 51903, 51902, 51901, 51895, 0,
                        51894, 51900, 0,
                        51905, 51898, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50807, 51896, 50804, 51899, 50799, 51904, 50806, 51897, 50800, 51903, 50801, 51902, 50802, 51901, 50808, 51895, 0,
                        50809, 51894, 50803, 51900, 0,
                        50798, 51905, 50805, 51898, 0,
                        49908, 0,
                    },
                },
                { Name = "Festergut", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50988, 50990, 50985, 50858, 50812, 50967, 50811, 0,
                        50859, 50852, 50986, 0,
                        50810, 50966, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51883, 51882, 51885, 51889, 51891, 51886, 51892, 0,
                        51888, 51890, 51884, 0,
                        51893, 51887, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50988, 51883, 50990, 51882, 50985, 51885, 50858, 51889, 50812, 51891, 50967, 51886, 50811, 51892, 0,
                        50859, 51888, 50852, 51890, 50986, 51884, 0,
                        50810, 51893, 50966, 51887, 0,
                        49908, 0,
                    },
                },
                { Name = "Rotface", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51007, 51005, 51009, 51002, 51006, 51000, 0,
                        51008, 51001, 0,
                        51003, 51004, 50998, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51872, 51874, 51870, 51877, 51873, 51879, 0,
                        51871, 51878, 0,
                        51876, 51875, 51881, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        51007, 51872, 51005, 51874, 51009, 51870, 51002, 51877, 51006, 51873, 51000, 51879, 0,
                        51008, 51871, 51001, 51878, 0,
                        51003, 51876, 51004, 51875, 50998, 51881, 0,
                        49908, 0,
                    },
                },
                { Name = "Professor Putricide", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51020, 51017, 51013, 51015, 51019, 51014, 51018, 0,
                        51012, 51016, 50341, 0,
                        51011, 51010, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51859, 51862, 51866, 51864, 51860, 51865, 51861, 0,
                        51867, 51863, 50344, 0,
                        51868, 51869, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51020, 51859, 51017, 51862, 51013, 51866, 51015, 51864, 51019, 51860, 51014, 51865, 51018, 51861, 0,
                        51012, 51867, 51016, 51863, 50341, 50344, 0,
                        51011, 51868, 51010, 51869, 0,
                        49908, 0,
                    },
                },
                { Name = "Blood Prince Council", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51379, 51380, 51023, 51325, 51383, 51025, 0,
                        51382, 51381, 51024, 0,
                        51021, 51022, 51326, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51851, 51850, 51856, 51853, 51847, 51854, 0,
                        51848, 51849, 51855, 0,
                        51858, 51857, 51852, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        51379, 51851, 51380, 51850, 51023, 51856, 51325, 51853, 51383, 51847, 51025, 51854, 0,
                        51382, 51848, 51381, 51849, 51024, 51855, 0,
                        51021, 51858, 51022, 51857, 51326, 51852, 0,
                        49908, 0,
                    },
                },
                { Name = "Blood-Queen Lana'thel", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51554, 51552, 51550, 51551, 51386, 51556, 51555, 0,
                        51548, 51387, 0,
                        51384, 51385, 51553, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51837, 51839, 51841, 51840, 51844, 51835, 51836, 0,
                        51842, 51843, 0,
                        51846, 51845, 51838, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51554, 51837, 51552, 51839, 51550, 51841, 51551, 51840, 51386, 51844, 51556, 51835, 51555, 51836, 0,
                        51548, 51842, 51387, 51843, 0,
                        51384, 51846, 51385, 51845, 51553, 51838, 0,
                        49908, 0,
                    },
                },
                { Name = "Valithria Dreamwalker", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51777, 51585, 51565, 51583, 51566, 51586, 51563, 51564, 0,
                        51584, 0,
                        51562, 51582, 51561, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        51823, 51825, 51830, 51827, 51829, 51824, 51832, 51831, 0,
                        51826, 0,
                        51833, 51828, 51834, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        51777, 51823, 51585, 51825, 51565, 51830, 51583, 51827, 51566, 51829, 51586, 51824, 51563, 51832, 51564, 51831, 0,
                        51584, 51826, 0,
                        51562, 51833, 51582, 51828, 51561, 51834, 0,
                        49908, 0,
                    },
                },
                { Name = "Sindragosa", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51790, 51783, 51789, 51792, 51785, 51782, 51786, 51787, 0,
                        51779, 0,
                        51784, 51788, 51791, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51813, 51820, 51814, 51811, 51818, 51821, 51817, 51816, 0,
                        51822, 0,
                        51819, 51815, 51812, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51790, 51813, 51783, 51820, 51789, 51814, 51792, 51811, 51785, 51818, 51782, 51821, 51786, 51817, 51787, 51816, 0,
                        51779, 51822, 0,
                        51784, 51819, 51788, 51815, 51791, 51812, 0,
                        49908, 0,
                    },
                },
                { Name = "The Lich King", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        51801, 51803, 51800, 51795, 51798, 51796, 51799, 51797, 51802, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51941, 51939, 51942, 51947, 51944, 51946, 51943, 51945, 51940, 0,
                        49908, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        51801, 51941, 51803, 51939, 51800, 51942, 51795, 51947, 51798, 51944, 51796, 51946, 51799, 51943, 51797, 51945, 51802, 51940, 0,
                        49908, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        50449, 50450, 50451, 0,
                        50452, 50447, 50453, 0,
                        50444, 0,
                        52019, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Tier 10 Pieces",
                    IndentType = 2,
                    Loot =
                    {
                        51208, 51205, 51206, 51209, 51207, 0,
                        51158, 51155, 51156, 51159, 51157, 0,
                        51184, 51182, 51180, 51183, 51181, 0,
                        51178, 51175, 51176, 51179, 51177, 0,
                        51149, 51147, 51145, 51148, 51146, 0,
                        51137, 51135, 51139, 51138, 51136, 0,
                        51143, 51140, 51141, 51144, 51142, 0,
                        51187, 51185, 51189, 51188, 51186, 0,
                        51153, 51151, 51150, 51154, 51152, 0,
                        51202, 51204, 51200, 51201, 51203, 0,
                        51192, 51194, 51190, 51191, 51193, 0,
                        51197, 51199, 51195, 51196, 51198, 0,
                        51212, 51210, 51214, 51213, 51211, 0,
                        51218, 51215, 51219, 51217, 51216, 0,
                        51127, 51125, 51129, 51128, 51126, 0,
                        51133, 51130, 51134, 51132, 51131, 0,
                        51167, 51166, 51165, 51169, 51168, 0,
                        51162, 51160, 51164, 51163, 51161, 0,
                        51173, 51170, 51174, 51172, 51171, 0,
                    },
                },
            },
        },
        [3073] = {
            Name = "Icecrown Citadel 25",
            ButtonName = "[25] Icecrown Citadel",
            NameShort = "ICC 25",
            Color = LootReserve.Constants.Colors.Size25,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Lord Marrowgar", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        49978, 49979, 49950, 49952, 49980, 49951, 49960, 49964, 0,
                        49975, 49949, 49977, 49967, 0,
                        49968, 50415, 49976, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50613, 50615, 50607, 50605, 50617, 50606, 50611, 50612, 0,
                        50609, 50604, 50614, 50610, 0,
                        50608, 50709, 50616, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        49978, 50613, 49979, 50615, 49950, 50607, 49952, 50605, 49980, 50617, 49951, 50606, 49960, 50611, 49964, 50612, 0,
                        49975, 50609, 49949, 50604, 49977, 50614, 49967, 50610, 0,
                        49968, 50608, 50415, 50709, 49976, 50616, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Lady Deathwhisper", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        49991, 49994, 49987, 49996, 49988, 49993, 49986, 49995, 49983, 0,
                        49989, 49985, 49990, 0,
                        49982, 49992, 50034, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50643, 50651, 50646, 50649, 50645, 50652, 50640, 50650, 50639, 0,
                        50647, 50642, 50644, 0,
                        50641, 50648, 50638, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        49991, 50643, 49994, 50651, 49987, 50646, 49996, 50649, 49988, 50645, 49993, 50652, 49986, 50640, 49995, 50650, 49983, 50639, 0,
                        49989, 50647, 49985, 50642, 49990, 50644, 0,
                        49982, 50641, 49992, 50648, 50034, 50638, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Icecrown Gunship Battle", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50006, 50011, 50001, 50009, 50000, 50003, 50002, 50010, 0,
                        49998, 50005, 50008, 49999, 50359, 50352, 0,
                        50411, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50661, 50663, 50656, 50665, 50655, 50660, 50659, 50667, 0,
                        50653, 50658, 50664, 50657, 50366, 50349, 0,
                        50654, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50006, 50661, 50011, 50663, 50001, 50656, 50009, 50665, 50000, 50655, 50003, 50660, 50002, 50659, 50010, 50667, 0,
                        49998, 50653, 50005, 50658, 50008, 50664, 49999, 50657, 50359, 50366, 50352, 50349, 0,
                        50411, 50654, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Deathbringer Saurfang", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50333, 50015, 0,
                        50014, 50362, 0,
                        50412, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50670, 50671, 0,
                        50668, 50363, 0,
                        50672, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50333, 50670, 50015, 50671, 0,
                        50014, 50668, 50362, 50363, 0,
                        50412, 50672, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Festergut", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50063, 50056, 50062, 50042, 50041, 50059, 50038, 50064, 50413, 50060, 50037, 50036, 0,
                        50061, 50414, 0,
                        50035, 50040, 0,
                        49908, 0,
                        50274, 50226, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50702, 50694, 50699, 50697, 50696, 50698, 50689, 50703, 50688, 50701, 50690, 50691, 0,
                        50700, 50693, 0,
                        50692, 50695, 0,
                        49908, 0,
                        50274, 50226, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50063, 50702, 50056, 50694, 50062, 50699, 50042, 50697, 50041, 50696, 50059, 50698, 50038, 50689, 50064, 50703, 50413, 50688, 50060, 50701, 50037, 50690, 50036, 50691, 0,
                        50061, 50700, 50414, 50693, 0,
                        50035, 50692, 50040, 50695, 0,
                        49908, 0,
                        50274, 50226, 0,
                    },
                },
                { Name = "Rotface", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50032, 50026, 50021, 50022, 50030, 50020, 50024, 50027, 0,
                        50019, 50023, 50025, 50353, 0,
                        50028, 50016, 50033, 0,
                        49908, 0,
                        50274, 50231, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50686, 50679, 50675, 50673, 50687, 50674, 50681, 50680, 0,
                        50677, 50682, 50678, 50348, 0,
                        50685, 50676, 50684, 0,
                        49908, 0,
                        50274, 50231, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50032, 50686, 50026, 50679, 50021, 50675, 50022, 50673, 50030, 50687, 50020, 50674, 50024, 50681, 50027, 50680, 0,
                        50019, 50677, 50023, 50682, 50025, 50678, 50353, 50348, 0,
                        50028, 50685, 50016, 50676, 50033, 50684, 0,
                        50274, 50231, 0,
                    },
                },
                { Name = "Professor Putricide", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50067, 50069, 0,
                        50351, 0,
                        50179, 50068, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50707, 50705, 0,
                        50706, 0,
                        50708, 50704, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50067, 50707, 50069, 50705, 0,
                        50351, 50706, 0,
                        50179, 50708, 50068, 50704, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Blood Prince Council", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50172, 50176, 50073, 50171, 50177, 50071, 50072, 50175, 50075, 0,
                        50074, 50174, 50170, 0,
                        50173, 50184, 49919, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50717, 50722, 50713, 50715, 50723, 50711, 50712, 50721, 50716, 0,
                        50718, 50720, 50714, 0,
                        50719, 50710, 50603, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50172, 50717, 50176, 50722, 50073, 50713, 50171, 50715, 50177, 50723, 50071, 50711, 50072, 50712, 50175, 50721, 50075, 50716, 0,
                        50074, 50718, 50174, 50720, 50170, 50714, 0,
                        50173, 50719, 50184, 50710, 49919, 50603, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Blood-Queen Lana'thel", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50182, 50180, 50354, 0,
                        50178, 50181, 50065, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50724, 50728, 50726, 0,
                        50727, 50725, 50729, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50182, 50724, 50180, 50728, 50354, 50726, 0,
                        50178, 50727, 50181, 50725, 50065, 50729, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Valithria Dreamwalker", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        50418, 50417, 50202, 50188, 50187, 50199, 50192, 50416, 50190, 0,
                        50205, 50195, 50185, 50186, 0,
                        50183, 50472, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        50629, 50630, 50626, 50619, 50620, 50623, 50624, 50632, 50625, 0,
                        50628, 50627, 50622, 50618, 0,
                        50621, 50631, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        50418, 50629, 50417, 50630, 50202, 50626, 50188, 50619, 50187, 50620, 50199, 50623, 50192, 50624, 50416, 50632, 50190, 50625, 0,
                        50205, 50628, 50195, 50627, 50185, 50622, 50186, 50618, 0,
                        50183, 50621, 50472, 50631, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "Sindragosa", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50421, 50424, 50360, 50361, 0,
                        50423, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50633, 50636, 50365, 50364, 0,
                        50635, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50421, 50633, 50424, 50636, 50360, 50365, 50361, 50364, 0,
                        50423, 50635, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Name = "The Lich King", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        50426, 50427, 50070, 50012, 50428, 49997, 50425, 50429, 49981, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50736, 50732, 50730, 50737, 50734, 50738, 50735, 50731, 50733, 0,
                        50818, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        52027, 52026, 52025, 0,
                        52030, 52029, 52028, 0,
                        50426, 50736, 50427, 50732, 50070, 50730, 50012, 50737, 50428, 50734, 49997, 50738, 50425, 50735, 50429, 50731, 49981, 50733, 0,
                        50818, 0,
                        49908, 0,
                        50274, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        50449, 50450, 50451, 0,
                        50452, 50447, 50453, 0,
                        50444, 0,
                        52019, 0,
                    },
                },
                { Separator = true },
                { Name = "Tier 10 Pieces", Header = true },
                {
                    Name = "Normal",
                    IndentType = 2,
                    Loot =
                    {
                        51208, 51205, 51206, 51209, 51207, 0,
                        51158, 51155, 51156, 51159, 51157, 0,
                        51184, 51182, 51180, 51183, 51181, 0,
                        51178, 51175, 51176, 51179, 51177, 0,
                        51149, 51147, 51145, 51148, 51146, 0,
                        51137, 51135, 51139, 51138, 51136, 0,
                        51143, 51140, 51141, 51144, 51142, 0,
                        51187, 51185, 51189, 51188, 51186, 0,
                        51153, 51151, 51150, 51154, 51152, 0,
                        51202, 51204, 51200, 51201, 51203, 0,
                        51192, 51194, 51190, 51191, 51193, 0,
                        51197, 51199, 51195, 51196, 51198, 0,
                        51212, 51210, 51214, 51213, 51211, 0,
                        51218, 51215, 51219, 51217, 51216, 0,
                        51127, 51125, 51129, 51128, 51126, 0,
                        51133, 51130, 51134, 51132, 51131, 0,
                        51167, 51166, 51165, 51169, 51168, 0,
                        51162, 51160, 51164, 51163, 51161, 0,
                        51173, 51170, 51174, 51172, 51171, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 2,
                    Loot =
                    {
                        51231, 51234, 51233, 51230, 51232, 0,
                        51281, 51284, 51283, 51280, 51282, 0,
                        51255, 51257, 51259, 51256, 51258, 0,
                        51261, 51264, 51263, 51260, 51262, 0,
                        51290, 51292, 51294, 51291, 51293, 0,
                        51302, 51304, 51300, 51301, 51303, 0,
                        51296, 51299, 51298, 51295, 51297, 0,
                        51252, 51254, 51250, 51251, 51253, 0,
                        51286, 51288, 51289, 51285, 51287, 0,
                        51237, 51235, 51239, 51238, 51236, 0,
                        51247, 51245, 51249, 51248, 51246, 0,
                        51242, 51240, 51244, 51243, 51241, 0,
                        51227, 51229, 51225, 51226, 51228, 0,
                        51221, 51224, 51220, 51222, 51223, 0,
                        51312, 51314, 51310, 51311, 51313, 0,
                        51306, 51309, 51305, 51307, 51308, 0,
                        51272, 51273, 51274, 51270, 51271, 0,
                        51277, 51279, 51275, 51276, 51278, 0,
                        51266, 51269, 51265, 51267, 51268, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 2,
                    Loot =
                    {
                        51208, 51231, 51205, 51234, 51206, 51233, 51209, 51230, 51207, 51232, 0,
                        51158, 51281, 51155, 51284, 51156, 51283, 51159, 51280, 51157, 51282, 0,
                        51184, 51255, 51182, 51257, 51180, 51259, 51183, 51256, 51181, 51258, 0,
                        51178, 51261, 51175, 51264, 51176, 51263, 51179, 51260, 51177, 51262, 0,
                        51149, 51290, 51147, 51292, 51145, 51294, 51148, 51291, 51146, 51293, 0,
                        51137, 51302, 51135, 51304, 51139, 51300, 51138, 51301, 51136, 51303, 0,
                        51143, 51296, 51140, 51299, 51141, 51298, 51144, 51295, 51142, 51297, 0,
                        51187, 51252, 51185, 51254, 51189, 51250, 51188, 51251, 51186, 51253, 0,
                        51153, 51286, 51151, 51288, 51150, 51289, 51154, 51285, 51152, 51287, 0,
                        51202, 51237, 51204, 51235, 51200, 51239, 51201, 51238, 51203, 51236, 0,
                        51192, 51247, 51194, 51245, 51190, 51249, 51191, 51248, 51193, 51246, 0,
                        51197, 51242, 51199, 51240, 51195, 51244, 51196, 51243, 51198, 51241, 0,
                        51212, 51227, 51210, 51229, 51214, 51225, 51213, 51226, 51211, 51228, 0,
                        51218, 51221, 51215, 51224, 51219, 51220, 51217, 51222, 51216, 51223, 0,
                        51127, 51312, 51125, 51314, 51129, 51310, 51128, 51311, 51126, 51313, 0,
                        51133, 51306, 51130, 51309, 51134, 51305, 51132, 51307, 51131, 51308, 0,
                        51167, 51272, 51166, 51273, 51165, 51274, 51169, 51270, 51168, 51271, 0,
                        51162, 51277, 51160, 51279, 51164, 51275, 51163, 51276, 51161, 51278, 0,
                        51173, 51266, 51170, 51269, 51174, 51265, 51172, 51267, 51171, 51268, 0,
                    },
                },
            },
        },
        
        -- The Ruby Sanctum
        [3081] = {
            Name = "The Ruby Sanctum 10",
            ButtonName = "[10] The Ruby Sanctum",
            NameShort = "RS 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Halion", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        53118, 53114, 53117, 53113, 53119, 53112, 53121, 53111, 0,
                        53115, 53103, 53116, 53110, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        54562, 54561, 54560, 54566, 54558, 54559, 54565, 54564, 0,
                        54556, 54557, 54563, 54567, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        53118, 54562, 53114, 54561, 53117, 54560, 53113, 54566, 53119, 54558, 53112, 54559, 53121, 54565, 53111, 54564, 0,
                        53115, 54556, 53103, 54557, 53116, 54563, 53110, 54567, 0,
                    },
                },
            },
        },
        [3083] = {
            Name = "The Ruby Sanctum 25",
            ButtonName = "[25] The Ruby Sanctum",
            NameShort = "RS 25",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Halion", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        53486, 53134, 53126, 53488, 53127, 53125, 53487, 53129, 0,
                        53489, 53132, 53490, 53133, 54572, 54573, 54571, 54569, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        54582, 54584, 54580, 54587, 54577, 54578, 54586, 54579, 0,
                        54583, 54581, 54585, 54576, 54588, 54589, 54591, 54590, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        53486, 54582, 53134, 54584, 53126, 54580, 53488, 54587, 53127, 54577, 53125, 54578, 53487, 54586, 53129, 54579, 0,
                        53489, 54583, 53132, 54581, 53490, 54585, 53133, 54576, 54572, 54588, 54573, 54589, 54571, 54591, 54569, 54590, 0,
                    },
                },
            },
        },
        
        -- Vault of Archavon
        [3090] = {
            Name = "Vault of Archavon 10",
            ButtonName = "[10] Vault of Archavon",
            NameShort = "VoA 10",
            Color = LootReserve.Constants.Colors.Size10Tiny,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Archavon the Stone Watcher", Header = true },
                {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        39497, 39498, 39500, 0,
                        39492, 39493, 39495, 0,
                        39523, 39528, 39530, 0,
                        39515, 39517, 39519, 0,
                        39547, 39546, 39544, 0,
                        39538, 39539, 39543, 0,
                        39554, 39555, 39557, 0,
                        39558, 39564, 39560, 0,
                        39579, 39580, 39582, 0,
                        39592, 39595, 39593, 0,
                        39588, 39589, 39591, 0,
                        39597, 39603, 39601, 0,
                        39606, 39607, 39609, 0,
                        39611, 39612, 39622, 0,
                        39617, 39620, 39618, 0,
                        39623, 39626, 39624, 0,
                        39629, 39630, 39632, 0,
                        39633, 39636, 39634, 0,
                        39638, 39641, 39639, 0,
                    },
                },
                {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42001, 42015, 42003, 0,
                        41950, 41969, 41957, 0,
                        41919, 41938, 41925, 0,
                        41857, 41872, 41862, 0,
                        41314, 41291, 41302, 0,
                        41308, 41284, 41296, 0,
                        41659, 41771, 41665, 0,
                        41648, 41765, 41653, 0,
                        41085, 41141, 41203, 0,
                        40989, 41005, 41031, 0,
                        40988, 40999, 41025, 0,
                        41079, 41135, 41162, 0,
                        40783, 40801, 40840, 0,
                        40781, 40803, 40841, 0,
                        40904, 40925, 40937, 0,
                        40782, 40802, 40842, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 3.2, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, { Name = "Emalon the Storm Watcher", Header = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        45419, 45420, 0,
                        46131, 45367, 0,
                        45392, 45394, 0,
                        45387, 45388, 0,
                        45351, 45353, 0,
                        45345, 45347, 0,
                        45355, 45357, 0,
                        45397, 45399, 0,
                        45360, 45362, 0,
                        45406, 45409, 0,
                        45401, 45403, 0,
                        45414, 45416, 0,
                        45430, 45432, 0,
                        45426, 45427, 0,
                        45341, 45343, 0,
                        45337, 45338, 0,
                        45370, 45371, 0,
                        45376, 45379, 0,
                        45383, 45384, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42016, 42004, 0,
                        41970, 41958, 0,
                        41939, 41926, 0,
                        41873, 41863, 0,
                        41315, 41292, 0,
                        41309, 41286, 0,
                        41660, 41772, 0,
                        41766, 41654, 0,
                        41142, 41204, 0,
                        41006, 41032, 0,
                        41000, 41026, 0,
                        41136, 41198, 0,
                        40804, 40844, 0,
                        40806, 40845, 0,
                        40926, 40938, 0,
                        40805, 40846, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "Koralon the Flame Watcher",
                    Loot =
                    {
                        -- Alliance
                        43959, 0,
                        
                        -- Horde
                        44083, 0,
                        
                        41909, 41898, 41903, 41893, 41881, 41885, 0,
                        41640, 41630, 41635, 41625, 41617, 41621, 41840, 41832, 41836, 0,
                        41065, 41070, 41075, 41060, 41051, 41055, 41225, 41235, 41230, 0,
                        40983, 40976, 40977, 40889, 40881, 40882, 0,
                        42071, 42073, 42069, 42072, 42070, 42074, 42075, 0,
                        42037, 42039, 42036, 42040, 42038, 46373, 42034, 42035, 0,
                        42116, 42117, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47783, 47785, 0,
                        47752, 47750, 0,
                        48072, 48074, 0,
                        47982, 47980, 0,
                        48162, 48160, 0,
                        48132, 48130, 0,
                        48213, 48215, 0,
                        48222, 48220, 0,
                        48254, 48252, 0,
                        48312, 48314, 0,
                        48284, 48282, 0,
                        48342, 48344, 0,
                        48375, 48373, 0,
                        48449, 48445, 0,
                        48480, 48476, 0,
                        48537, 48533, 0,
                        48574, 48568, 0,
                        48603, 48605, 0,
                        48633, 48635, 0,
                        
                        -- Horde
                        47802, 47800, 0,
                        47773, 47775, 0,
                        48097, 48099, 0,
                        48067, 48069, 0,
                        48183, 48185, 0,
                        48153, 48155, 0,
                        48192, 48190, 0,
                        48244, 48246, 0,
                        48276, 48278, 0,
                        48337, 48339, 0,
                        48296, 48298, 0,
                        48367, 48369, 0,
                        48387, 48389, 0,
                        48457, 48459, 0,
                        48502, 48504, 0,
                        48559, 48561, 0,
                        48598, 48596, 0,
                        48630, 48628, 0,
                        48653, 48655, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42017, 42005, 0,
                        41971, 41959, 0,
                        41940, 41927, 0,
                        41874, 41864, 0,
                        41293, 41304, 0,
                        41287, 41298, 0,
                        41773, 41667, 0,
                        41767, 41655, 0,
                        41143, 41205, 0,
                        41007, 41033, 0,
                        41001, 41027, 0,
                        41137, 41199, 0,
                        40807, 40847, 0,
                        40809, 40848, 0,
                        40927, 40939, 0,
                        40808, 40849, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "Toravon the Ice Watcher",
                    Loot =
                    {
                        -- Alliance
                        43959, 0,
                        
                        -- Horde
                        44083, 0,
                        
                        41910, 41899, 41904, 41894, 41882, 41886, 49181, 49179, 49183, 0,
                        41641, 41631, 41636, 41626, 41618, 41622, 41841, 41833, 41837, 0,
                        41066, 41071, 41076, 41061, 41052, 41056, 41226, 41236, 41231, 0,
                        40984, 40978, 40979, 40890, 40883, 40884, 0,
                        42078, 42080, 42076, 42079, 42077, 42081, 42082, 0,
                        42044, 42046, 42043, 42047, 42045, 46374, 42041, 42042, 0,
                        42118, 42119, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        50240, 50242, 0,
                        50275, 50277, 0,
                        50391, 50393, 0,
                        50766, 50769, 0,
                        50822, 50820, 0,
                        50107, 50109, 0,
                        50827, 50825, 0,
                        50088, 50090, 0,
                        50114, 50116, 0,
                        50842, 50844, 0,
                        50836, 50838, 0,
                        50831, 50833, 0,
                        50079, 50081, 0,
                        50849, 50847, 0,
                        50095, 50097, 0,
                        50856, 50854, 0,
                        50868, 50866, 0,
                        50327, 50325, 0,
                        50863, 50861, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42018, 42006, 0,
                        41972, 41960, 0,
                        41941, 41928, 0,
                        41875, 41865, 0,
                        41294, 41305, 0,
                        41288, 41299, 0,
                        41774, 41668, 0,
                        41768, 41656, 0,
                        41144, 41206, 0,
                        41008, 41034, 0,
                        41002, 41028, 0,
                        41138, 41200, 0,
                        40810, 40850, 0,
                        40811, 40851, 0,
                        40928, 40940, 0,
                        40812, 40852, 0,
                    },
                }),
            },
        },
        [3091] = {
            Name = "Vault of Archavon 25",
            ButtonName = "[25] Vault of Archavon",
            NameShort = "VoA 25",
            Color = LootReserve.Constants.Colors.Size25Tiny,
            Expansion = 2,
            Children =
            Squish{
                { Name = "Archavon the Stone Watcher", Header = true },
                {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        40423, 40420, 40422, 0,
                        40418, 40415, 40417, 0,
                        40458, 40454, 40457, 0,
                        40449, 40445, 40448, 0,
                        40469, 40466, 40468, 0,
                        40463, 40460, 40462, 0,
                        40471, 40472, 40493, 0,
                        40495, 40496, 40500, 0,
                        40503, 40504, 40506, 0,
                        40514, 40515, 40517, 0,
                        40508, 40509, 40512, 0,
                        40523, 40520, 40522, 0,
                        40525, 40527, 40529, 0,
                        40544, 40545, 40547, 0,
                        40550, 40552, 40556, 0,
                        40559, 40563, 40567, 0,
                        40569, 40570, 40572, 0,
                        40574, 40575, 40577, 0,
                        40579, 40580, 40583, 0,
                    },
                },
                {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        41997, 42016, 42004, 0,
                        41951, 41970, 41958, 0,
                        41920, 41939, 41926, 0,
                        41858, 41873, 41863, 0,
                        41315, 41292, 41303, 0,
                        41309, 41286, 41297, 0,
                        41660, 41772, 41666, 0,
                        41649, 41766, 41654, 0,
                        41086, 41142, 41204, 0,
                        40991, 41006, 41032, 0,
                        40990, 41000, 41026, 0,
                        41080, 41136, 41198, 0,
                        40786, 40804, 40844, 0,
                        40784, 40806, 40845, 0,
                        40905, 40926, 40938, 0,
                        40785, 40805, 40846, 0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 3.2, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, { Name = "Emalon the Storm Watcher", Header = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        46135, 46139, 0,
                        46188, 46195, 46163, 46170, 0,
                        46124, 46126, 0,
                        46142, 46144, 0,
                        46164, 46169, 46148, 46150, 0,
                        40809, 40848, 46113, 46116, 0,
                        46132, 46133, 0,
                        46183, 46185, 46189, 46192, 46158, 46160, 0,
                        46199, 46202, 46207, 46210, 46200, 46208, 0,
                        46174, 46176, 46179, 46181, 46155, 46153, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.2, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42017, 42005, 0,
                        41971, 41959, 0,
                        41940, 41927, 0,
                        41874, 41864, 0,
                        41293, 41304, 0,
                        41287, 41298, 0,
                        41773, 41667, 0,
                        41767, 41655, 0,
                        41143, 41205, 0,
                        41007, 41033, 0,
                        41001, 41027, 0,
                        41137, 41199, 0,
                        40807, 40847, 0,
                        40809, 40848, 0,
                        40927, 40939, 0,
                        40808, 40849, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "Koralon the Flame Watcher",
                    Loot =
                    {
                        -- Alliance
                        43959, 0,
                        -- Horde
                        44083, 0,
                        
                        41910, 41899, 41904, 41894, 41882, 41886, 49181, 49179, 49183, 0,
                        41641, 41631, 41636, 41626, 41618, 41622, 41841, 41833, 41837, 0,
                        41066, 41071, 41076, 41061, 41052, 41056, 41226, 41236, 41231, 0,
                        40984, 40978, 40979, 40890, 40883, 40884, 0,
                        42078, 42080, 42076, 42079, 42077, 42081, 42082, 0,
                        42044, 42046, 42043, 42047, 42045, 46374, 42041, 42042, 0,
                        42118, 42119, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        -- Alliance
                        47782, 47780, 0,
                        47753, 47755, 0,
                        48077, 48079, 0,
                        47983, 47985, 0,
                        48163, 48165, 0,
                        48133, 48135, 0,
                        48212, 48210, 0,
                        48224, 48226, 0,
                        48256, 48258, 0,
                        48317, 48319, 0,
                        48286, 48288, 0,
                        48347, 48349, 0,
                        48377, 48379, 0,
                        48452, 48446, 0,
                        48482, 48484, 0,
                        48539, 48541, 0,
                        48576, 48578, 0,
                        48608, 48610, 0,
                        48640, 48638, 0,
                        
                        -- Horde
                        47803, 47805, 0,
                        47772, 47770, 0,
                        48096, 48094, 0,
                        48066, 48064, 0,
                        48182, 48180, 0,
                        48152, 48150, 0,
                        48193, 48195, 0,
                        48241, 48239, 0,
                        48273, 48271, 0,
                        48334, 48332, 0,
                        48301, 48303, 0,
                        48364, 48362, 0,
                        48392, 48394, 0,
                        48462, 48464, 0,
                        48499, 48497, 0,
                        48556, 48554, 0,
                        48593, 48591, 0,
                        48625, 48623, 0,
                        48658, 48660, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.3, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        42018, 42006, 0,
                        41972, 41960, 0,
                        41941, 41928, 0,
                        41875, 41865, 0,
                        41294, 41305, 0,
                        41288, 41299, 0,
                        41774, 41668, 0,
                        41768, 41656, 0,
                        41144, 41206, 0,
                        41008, 41034, 0,
                        41002, 41028, 0,
                        41138, 41200, 0,
                        40810, 40850, 0,
                        40811, 40851, 0,
                        40928, 40940, 0,
                        40812, 40852, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, { Separator = true }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "Toravon the Ice Watcher",
                    Loot =
                    {
                        -- Alliance
                        43959, 0,
                        -- Horde
                        44083, 0,
                        
                        51329, 51327, 51328, 51367, 51365, 51366, 51339, 51337, 51338, 0,
                        51345, 51343, 51344, 51342, 51340, 51341, 51370, 51368, 51369, 0,
                        51376, 51374, 51375, 51373, 51371, 51372, 51352, 51350, 51351, 0,
                        51361, 51359, 51360, 51364, 51362, 51363, 0,
                        51334, 51348, 51330, 51346, 51332, 51354, 51356, 0,
                        51335, 51349, 51331, 51347, 51333, 51353, 51355, 51357, 0,
                        51336, 51358, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "PvE Sets",
                    IndentType = 1,
                    Loot =
                    {
                        51209, 51207, 0,
                        51159, 51157, 0,
                        51183, 51181, 0,
                        51179, 51177, 0,
                        51148, 51146, 0,
                        51138, 51136, 0,
                        51144, 51142, 0,
                        51188, 51186, 0,
                        51154, 51152, 0,
                        51201, 51203, 0,
                        51191, 51193, 0,
                        51196, 51198, 0,
                        51213, 51211, 0,
                        51217, 51216, 0,
                        51128, 51126, 0,
                        51132, 51131, 0,
                        51169, 51168, 0,
                        51163, 51161, 0,
                        51172, 51171, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 3.4, {
                    Name = "PvP Sets",
                    IndentType = 1,
                    Loot =
                    {
                        51537, 51539, 0,
                        51464, 51466, 0,
                        51488, 51490, 0,
                        51483, 51485, 0,
                        51434, 51436, 0,
                        51420, 51422, 0,
                        51426, 51428, 0,
                        51493, 51495, 0,
                        51459, 51461, 0,
                        51510, 51512, 0,
                        51498, 51500, 0,
                        51504, 51506, 0,
                        51542, 51544, 0,
                        51414, 51416, 0,
                        51469, 51471, 0,
                        51475, 51477, 0,
                    },
                }),
            },
        },
        
        
        -- Cataclysm
        
        -- Blackwing Descent
        [4010] = {
            Name = "Blackwing Descent",
            NameShort = "BWD",
            Color = LootReserve.Constants.Colors.Size10or25,
            Expansion = 3,
            Children =
            Squish{
                { Name = "Omnotron Defense System", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59219, 59217, 59218, 59120, 63540, 59119, 59216, 59118, 59117, 0,
                        59220, 59121, 0,
                        59122, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65077, 65079, 65078, 65083, 65004, 65084, 65080, 65085, 65086, 0,
                        65076, 65082, 0,
                        65081, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        59219, 65077, 59217, 65079, 59218, 65078, 59120, 65083, 63540, 65004, 59119, 65084, 59216, 65080, 59118, 65085, 59117, 65086, 0,
                        59220, 65076, 59121, 65082, 0,
                        59122, 65081, 0,
                    },
                },
                { Name = "Magmaw", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59336, 59452, 59335, 59329, 59334, 59331, 59340, 59328, 0,
                        59332, 0,
                        59341, 59333, 59492, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        67429, 67430, 67431, 0,
                        65044, 65020, 65045, 65050, 65046, 65049, 65042, 65051, 0,
                        65048, 0,
                        65041, 65047, 65007, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        67429, 67430, 67431, 0,
                        59336, 65044, 59452, 65020, 59335, 65045, 59329, 65050, 59334, 65046, 59331, 65049, 59340, 65042, 59328, 65051, 0,
                        59332, 65048, 0,
                        59341, 65041, 59333, 65047, 59492, 65007, 0,
                    },
                },
                { Name = "Atramedes", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59325, 59322, 59312, 59318, 59324, 59315, 59316, 59317, 0,
                        59326, 59319, 0,
                        59327, 59320, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65054, 65056, 65066, 65060, 65055, 65063, 65062, 65061, 0,
                        65053, 65059, 0,
                        65052, 65058, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        59325, 65054, 59322, 65056, 59312, 65066, 59318, 65060, 59324, 65055, 59315, 65063, 59316, 65062, 59317, 65061, 0,
                        59326, 65053, 59319, 65059, 0,
                        59327, 65052, 59320, 65058, 0,
                    },
                },
                { Name = "Chimaeron", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59234, 59313, 59451, 59223, 59310, 59355, 59311, 59225, 59221, 0,
                        59224, 59233, 0,
                        59314, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65069, 65065, 65021, 65073, 65068, 65028, 65067, 65071, 65075, 0,
                        65072, 65070, 0,
                        65064, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        59234, 65069, 59313, 65065, 59451, 65021, 59223, 65073, 59310, 65068, 59355, 65028, 59311, 65067, 59225, 65071, 59221, 65075, 0,
                        59224, 65072, 59233, 65070, 0,
                        59314, 65064, 0,
                    },
                },
                { Name = "Maloriak", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59349, 59351, 59353, 59343, 59350, 59346, 59352, 59342, 59344, 0,
                        59348, 59354, 0,
                        59347, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        67428, 67427, 67426, 0,
                        65034, 65032, 65030, 65039, 65033, 65037, 65031, 65040, 65038, 0,
                        65035, 65029, 0,
                        65036, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        67428, 67427, 67426, 0,
                        59349, 65034, 59351, 65032, 59353, 65030, 59343, 65039, 59350, 65033, 59346, 65037, 59352, 65031, 59342, 65040, 59344, 65038, 0,
                        59348, 65035, 59354, 65029, 0,
                        59347, 65036, 0,
                    },
                },
                { Name = "Nefarian's End", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        63683, 63684, 63682, 0,
                        59454, 59337, 59321, 59222, 59450, 59356, 0,
                        59457, 59442, 59441, 0,
                        59459, 59443, 63679, 59444, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65001, 65000, 65002, 0,
                        65019, 65043, 65057, 65074, 65022, 65027, 0,
                        65018, 65025, 65026, 0,
                        65017, 65024, 65003, 65023, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        63683, 63684, 63682, 0,
                        65001, 65000, 65002, 0,
                        59454, 65019, 59337, 65043, 59321, 65057, 59222, 65074, 59450, 65022, 59356, 65027, 0,
                        59457, 65018, 59442, 65025, 59441, 65026, 0,
                        59459, 65017, 59443, 65024, 63679, 65003, 59444, 65023, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        59468, 59467, 59465, 59464, 0,
                        59466, 59461, 0,
                        59460, 59463, 68601, 63537, 63538, 59462, 0,
                    },
                },
                { Separator = true },
                { Name = "Tier 11 Pieces", Header = true },
                {
                    Name = "Normal",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60249, 0,
                        -- Mage
                        60243, 0,
                        -- Priest
                        60256, 0,
                        60258, 0,
                        -- Druid
                        60282, 0,
                        60277, 0,
                        60286, 0,
                        -- Rogue
                        60299, 0,
                        -- Hunter
                        60303, 0,
                        -- Shaman
                        60315, 0,
                        60308, 0,
                        60320, 0,
                        -- Paladin
                        60359, 0,
                        60346, 0,
                        60356, 0,
                        -- Warrior
                        60325, 0,
                        60328, 0,
                        -- Death Knight
                        60341, 0,
                        60351, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        65260, 65259, 65261, 0,
                        -- Mage
                        65210, 65209, 65211, 0,
                        -- Priest
                        65235, 65234, 65236, 0,
                        65230, 65229, 65231, 0,
                        -- Druid
                        65200, 65199, 65201, 0,
                        65195, 65194, 65196, 0,
                        65190, 65189, 65191, 0,
                        -- Rogue
                        65241, 65240, 65242, 0,
                        -- Hunter
                        65206, 65205, 65207, 0,
                        -- Shaman
                        65256, 65255, 65257, 0,
                        65246, 65245, 65247, 0,
                        65251, 65250, 65252, 0,
                        -- Paladin
                        65221, 65220, 65222, 0,
                        65216, 65215, 65217, 0,
                        65226, 65225, 65227, 0,
                        -- Warrior
                        65266, 65265, 65267, 0,
                        65271, 65270, 65272, 0,
                        -- Death Knight
                        65181, 65180, 65182, 0,
                        65186, 65185, 65187, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60249, 65260, 65259, 65261, 0,
                        -- Mage
                        60243, 65210, 65209, 65211, 0,
                        -- Priest
                        60256, 65235, 65234, 65236, 0,
                        60258, 65230, 65229, 65231, 0,
                        -- Druid
                        60282, 65200, 65199, 65201, 0,
                        60277, 65195, 65194, 65196, 0,
                        60286, 65190, 65189, 65191, 0,
                        -- Rogue
                        60299, 65241, 65240, 65242, 0,
                        -- Hunter
                        60303, 65206, 65205, 65207, 0,
                        -- Shaman
                        60315, 65256, 65255, 65257, 0,
                        60308, 65246, 65245, 65247, 0,
                        60320, 65251, 65250, 65252, 0,
                        -- Paladin
                        60359, 65221, 65220, 65222, 0,
                        60346, 65216, 65215, 65217, 0,
                        60356, 65226, 65225, 65227, 0,
                        -- Warrior
                        60325, 65266, 65265, 65267, 0,
                        60328, 65271, 65270, 65272, 0,
                        -- Death Knight
                        60341, 65181, 65180, 65182, 0,
                        60351, 65186, 65185, 65187, 0,
                    },
                },
            },
        },
        
        -- The Bastion of Twilight
        [4020] = {
            Name = "The Bastion of Twilight",
            NameShort = "BoT",
            Color = LootReserve.Constants.Colors.Size10or25,
            Expansion = 3,
            Children =
            Squish{
                { Name = "Halfus Wyrmbreaker", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59475, 59482, 59469, 59481, 59472, 59476, 59471, 59470, 0,
                        59483, 59473, 0,
                        59484, 59474, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        67423, 67424, 67425, 0,
                        65138, 65135, 65144, 65136, 65141, 65137, 65142, 65143, 0,
                        65134, 65140, 0,
                        65133, 65139, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        67423, 67424, 67425, 0,
                        59475, 65138, 59482, 65135, 59469, 65144, 59481, 65136, 59472, 65141, 59476, 65137, 59471, 65142, 59470, 65143, 0,
                        59483, 65134, 59473, 65140, 0,
                        59484, 65133, 59474, 65139, 0,
                    },
                },
                { Name = "Theralion and Valiona", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        63534, 63535, 63531, 0,
                        59516, 59512, 59517, 59518, 59519, 59515, 0,
                        63536, 63533, 63532, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65093, 65092, 65096, 0,
                        65108, 65112, 65107, 65106, 65105, 65109, 0,
                        65091, 65094, 65095, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        63534, 65093, 63535, 65092, 63531, 65096, 0,
                        59516, 65108, 59512, 65112, 59517, 65107, 59518, 65106, 59519, 65105, 59515, 65109, 0,
                        63536, 65091, 63533, 65094, 63532, 65095, 0,
                    },
                },
                { Name = "Ascendant Council", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        59508, 59511, 59502, 59510, 59504, 59509, 59503, 59505, 0,
                        59507, 59514, 59506, 0,
                        59513, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65116, 65113, 65122, 65114, 65120, 65115, 65121, 65119, 0,
                        65117, 65110, 65118, 0,
                        65111, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        59508, 65116, 59511, 65113, 59502, 65122, 59510, 65114, 59504, 65120, 59509, 65115, 59503, 65121, 59505, 65119, 0,
                        59507, 65117, 59514, 65110, 59506, 65118, 0,
                        59513, 65111, 0,
                    },
                },
                { Name = "Cho'gall", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        64315, 64316, 64314, 0,
                        59498, 59495, 59490, 59499, 59485, 59497, 59487, 59486, 0,
                        59501, 59500, 0,
                        63680, 59494, 59330, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        65088, 65087, 65089, 0,
                        65126, 65128, 65129, 65125, 65132, 65127, 65130, 65131, 0,
                        65123, 65124, 0,
                        65090, 68600, 65145, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        64315, 64316, 64314, 0,
                        65088, 65087, 65089, 0,
                        59498, 65126, 59495, 65128, 59490, 65129, 59499, 65125, 59485, 65132, 59497, 65127, 59487, 65130, 59486, 65131, 0,
                        59501, 65123, 59500, 65124, 0,
                        63680, 65090, 59494, 68600, 59330, 65145, 0,
                    },
                },
                { Name = "Sinestra", Header = true },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        60237, 60238, 60236, 60231, 60235, 60230, 60234, 60228, 60229, 0,
                        60232, 60227, 60226, 60233, 0,
                    },
                },
                { Separator = true },
                {
                    Name = "Trash",
                    Loot =
                    {
                        60211, 60202, 60201, 59901, 0,
                        59520, 0,
                        59525, 59521, 60210, 0,
                    },
                },
                { Name = "Tier 11 Pieces", Header = true },
                {
                    Name = "Normal",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60252, 0,
                        -- Mage
                        60246, 0,
                        -- Priest
                        60253, 0,
                        60262, 0,
                        -- Druid
                        60284, 0,
                        60279, 0,
                        60289, 0,
                        -- Rogue
                        60302, 0,
                        -- Hunter
                        60306, 0,
                        -- Shaman
                        60317, 0,
                        60311, 0,
                        60322, 0,
                        -- Paladin
                        60362, 0,
                        60348, 0,
                        60358, 0,
                        -- Warrior
                        60327, 0,
                        60331, 0,
                        -- Death Knight
                        60343, 0,
                        60353, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        65263, 65262, 0,
                        -- Mage
                        65213, 65212, 0,
                        -- Priest
                        65238, 65237, 0,
                        65233, 65232, 0,
                        -- Druid
                        65203, 65202, 0,
                        65198, 65197, 0,
                        65193, 65192, 0,
                        -- Rogue
                        65243, 65239, 0,
                        -- Hunter
                        65208, 65204, 0,
                        -- Shaman
                        65258, 65254, 0,
                        65248, 65244, 0,
                        65253, 65249, 0,
                        -- Paladin
                        65223, 65219, 0,
                        65218, 65214, 0,
                        65228, 65224, 0,
                        -- Warrior
                        65268, 65264, 0,
                        65273, 65269, 0,
                        -- Death Knight
                        65183, 65179, 0,
                        65188, 65184, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60252, 65263, 65262, 0,
                        -- Mage
                        60246, 65213, 65212, 0,
                        -- Priest
                        60253, 65238, 65237, 0,
                        60262, 65233, 65232, 0,
                        -- Druid
                        60284, 65203, 65202, 0,
                        60279, 65198, 65197, 0,
                        60289, 65193, 65192, 0,
                        -- Rogue
                        60302, 65243, 65239, 0,
                        -- Hunter
                        60306, 65208, 65204, 0,
                        -- Shaman
                        60317, 65258, 65254, 0,
                        60311, 65248, 65244, 0,
                        60322, 65253, 65249, 0,
                        -- Paladin
                        60362, 65223, 65219, 0,
                        60348, 65218, 65214, 0,
                        60358, 65228, 65224, 0,
                        -- Warrior
                        60327, 65268, 65264, 0,
                        60331, 65273, 65269, 0,
                        -- Death Knight
                        60343, 65183, 65179, 0,
                        60353, 65188, 65184, 0,
                    },
                },
            },
        },
        
        -- Throne of the Four Winds
        [4030] = {
            Name = "Throne of the Four Winds",
            NameShort = "ToFW",
            Color = LootReserve.Constants.Colors.Size10or25,
            Expansion = 3,
            Children =
            Squish{
                { Name = "The Conclave of Wind", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        {63498, -214, 482}, {63498, -212, 482}, {63498, -213, 482}, {63498, -215, 482}, 0,
                        {63497, -214, 482}, {63497, -212, 482}, {63497, -213, 482}, {63497, -215, 482}, 0,
                        {63493, -219, 482}, {63493, -218, 482}, {63493, -216, 482}, {63493, -217, 482}, 0,
                        {63496, -214, 482}, {63496, -212, 482}, {63496, -213, 482}, {63496, -215, 482}, 0,
                        {63492, -219, 482}, {63492, -218, 482}, {63492, -216, 482}, {63492, -217, 482}, 0,
                        {63495, -214, 482}, {63495, -212, 482}, {63495, -213, 482}, {63495, -215, 482}, 0,
                        {63490, -204, 482}, {63490, -205, 482}, {63490, -203, 482}, {63490, -206, 482}, 0,
                        {63491, -209, 482}, {63491, -207, 482}, {63491, -208, 482}, 0,
                        
                        {63494, -131, 362}, {63494, -129, 362}, {63494, -114, 362}, {63494, -130, 362}, {63494, -138, 362}, {63494, -132, 362}, 0,
                        {63488, -136, 362}, {63488, -137, 362}, {63488, -133, 362}, {63488, -135, 362}, 0,
                        {63489, -128, 362}, {63489, -125, 362}, {63489, -127, 362}, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        {65376, -231, 544}, {65376, -229, 544}, {65376, -230, 544}, {65376, -232, 544}, 0,
                        {65374, -231, 544}, {65374, -229, 544}, {65374, -230, 544}, {65374, -232, 544}, 0,
                        {65371, -236, 544}, {65371, -235, 544}, {65371, -233, 544}, {65371, -234, 544}, 0,
                        {65377, -231, 544}, {65377, -229, 544}, {65377, -230, 544}, {65377, -232, 544}, 0,
                        {65368, -236, 544}, {65368, -235, 544}, {65368, -233, 544}, {65368, -234, 544}, 0,
                        {65375, -231, 544}, {65375, -229, 544}, {65375, -230, 544}, {65375, -232, 544}, 0,
                        {65369, -221, 544}, {65369, -222, 544}, {65369, -220, 544}, {65369, -223, 544}, 0,
                        {65370, -226, 544}, {65370, -224, 544}, {65370, -225, 544}, 0,
                        
                        {65373, -131, 408}, {65373, -129, 408}, {65373, -114, 408}, {65373, -130, 408}, {65373, -138, 408}, {65373, -132, 408}, 0,
                        {65367, -136, 408}, {65367, -137, 408}, {65367, -133, 408}, {65367, -135, 408}, 0,
                        {65372, -128, 408}, {65372, -125, 408}, {65372, -127, 408}, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        {63498, -214, 482}, {65376, -231, 544}, {63498, -212, 482}, {65376, -229, 544}, {63498, -213, 482}, {65376, -230, 544}, {63498, -215, 482}, {65376, -232, 544}, 0,
                        {63497, -214, 482}, {65374, -231, 544}, {63497, -212, 482}, {65374, -229, 544}, {63497, -213, 482}, {65374, -230, 544}, {63497, -215, 482}, {65374, -232, 544}, 0,
                        {63493, -219, 482}, {65371, -236, 544}, {63493, -218, 482}, {65371, -235, 544}, {63493, -216, 482}, {65371, -233, 544}, {63493, -217, 482}, {65371, -234, 544}, 0,
                        {63496, -214, 482}, {65377, -231, 544}, {63496, -212, 482}, {65377, -229, 544}, {63496, -213, 482}, {65377, -230, 544}, {63496, -215, 482}, {65377, -232, 544}, 0,
                        {63492, -219, 482}, {65368, -236, 544}, {63492, -218, 482}, {65368, -235, 544}, {63492, -216, 482}, {65368, -233, 544}, {63492, -217, 482}, {65368, -234, 544}, 0,
                        {63495, -214, 482}, {65375, -231, 544}, {63495, -212, 482}, {65375, -229, 544}, {63495, -213, 482}, {65375, -230, 544}, {63495, -215, 482}, {65375, -232, 544}, 0,
                        {63490, -204, 482}, {65369, -221, 544}, {63490, -205, 482}, {65369, -222, 544}, {63490, -203, 482}, {65369, -220, 544}, {63490, -206, 482}, {65369, -223, 544}, 0,
                        {63491, -209, 482}, {65370, -226, 544}, {63491, -207, 482}, {65370, -224, 544}, {63491, -208, 482}, {65370, -225, 544}, 0,
                        
                        {63494, -131, 362}, {65373, -131, 408}, {63494, -129, 362}, {65373, -129, 408}, {63494, -114, 362}, {65373, -114, 408}, {63494, -130, 362}, {65373, -130, 408}, {63494, -138, 362}, {65373, -138, 408}, {63494, -132, 362}, {65373, -132, 408}, 0,
                        {63488, -136, 362}, {65367, -136, 408}, {63488, -137, 362}, {65367, -137, 408}, {63488, -133, 362}, {65367, -133, 408}, {63488, -135, 362}, {65367, -135, 408}, 0,
                        {63489, -128, 362}, {65372, -128, 408}, {63489, -125, 362}, {65372, -125, 408}, {63489, -127, 362}, {65372, -127, 408}, 0,
                    },
                },
                { Name = "Al'Akir", Header = true },
                {
                    Name = "Normal",
                    IndentType = 1,
                    Loot =
                    {
                        63041, 0,
                        63683, 63684, 63682, 0,
                        64315, 64316, 64314, 0,
                        
                        {63507, -187, 649}, {63507, -183, 649}, {63507, -184, 649}, {63507, -185, 649}, {63507, -186, 649}, {63507, -188, 649}, 0,
                        {63506, -187, 649}, {63506, -185, 649}, {63506, -186, 649}, {63506, -188, 649}, 0,
                        {63503, -198, 649}, {63503, -197, 649}, {63503, -195, 649}, {63503, -196, 649}, 0,
                        {63505, -187, 649}, {63505, -185, 649}, {63505, -186, 649}, {63505, -188, 649}, 0,
                        {63502, -198, 649}, {63502, -197, 649}, {63502, -195, 649}, {63502, -196, 649}, 0,
                        {63500, -169, 649}, {63500, -171, 649}, {63500, -170, 649}, {63500, -172, 649}, 0,
                        {63504, -187, 649}, {63504, -185, 649}, {63504, -186, 649}, {63504, -188, 649}, 0,
                        {63501, -179, 649}, {63501, -177, 649}, {63501, -178, 649}, 0,
                        
                        {69835, -131, 362}, {69835, -129, 362}, {69835, -114, 362}, {69835, -130, 362}, {69835, -138, 362}, {69835, -132, 362}, 0,
                        {69831, -136, 362}, {69831, -137, 362}, {69831, -133, 362}, {69831, -135, 362}, 0,
                        {69834, -121, 362}, {69834, -122, 362}, {69834, -120, 362}, {69834, -118, 362}, 0,
                        {69833, -128, 362}, {69833, -125, 362}, {69833, -127, 362}, 0,
                        {69830, -131, 362}, {69830, -129, 362}, {69830, -114, 362}, {69830, -130, 362}, {69830, -138, 362}, {69830, -132, 362}, 0,
                        {69827, -136, 362}, {69827, -137, 362}, {69827, -133, 362}, {69827, -135, 362}, 0,
                        {69829, -121, 362}, {69829, -122, 362}, {69829, -120, 362}, {69829, -118, 362}, 0,
                        {69828, -128, 362}, {69828, -125, 362}, {69828, -127, 362}, 0,
                        {63499, -121, 362}, {63499, -122, 362}, {63499, -120, 362}, {63499, -118, 362}, 0,
                        
                        {68127, -131, 278}, {68127, -129, 278}, {68127, -114, 278}, {68127, -130, 278}, {68127, -138, 278}, {68127, -132, 278}, 0,
                        {68129, -136, 278}, {68129, -137, 278}, {68129, -133, 278}, {68129, -135, 278}, 0,
                        {68128, -121, 278}, {68128, -122, 278}, {68128, -120, 278}, {68128, -118, 278}, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 1,
                    Loot =
                    {
                        63041, 0,
                        66998, 0,
                        65001, 65000, 65002, 0,
                        65088, 65087, 65089, 0,
                        
                        {65383, -193, 733}, {65383, -189, 733}, {65383, -190, 733}, {65383, -191, 733}, {65383, -192, 733}, {65383, -194, 733}, 0,
                        {65384, -193, 733}, {65384, -191, 733}, {65384, -192, 733}, {65384, -194, 733}, 0,
                        {65381, -202, 733}, {65381, -201, 733}, {65381, -199, 733}, {65381, -200, 733}, 0,
                        {65386, -193, 733}, {65386, -191, 733}, {65386, -192, 733}, {65386, -194, 733}, 0,
                        {65378, -202, 733}, {65378, -201, 733}, {65378, -199, 733}, {65378, -200, 733}, 0,
                        {65379, -174, 733}, {65379, -175, 733}, {65379, -173, 733}, {65379, -176, 733}, 0,
                        {65385, -193, 733}, {65385, -191, 733}, {65385, -192, 733}, {65385, -194, 733}, 0,
                        {65380, -182, 733}, {65380, -180, 733}, {65380, -181, 733}, 0,
                        
                        {69881, -131, 408}, {69881, -129, 408}, {69881, -114, 408}, {69881, -130, 408}, {69881, -138, 408}, {69881, -132, 408}, 0,
                        {69884, -136, 408}, {69884, -137, 408}, {69884, -133, 408}, {69884, -135, 408}, 0,
                        {69879, -121, 408}, {69879, -122, 408}, {69879, -120, 408}, {69879, -118, 408}, 0,
                        {69878, -128, 408}, {69878, -125, 408}, {69878, -127, 408}, 0,
                        {69882, -131, 408}, {69882, -129, 408}, {69882, -114, 408}, {69882, -130, 408}, {69882, -138, 408}, {69882, -132, 408}, 0,
                        {69880, -136, 408}, {69880, -137, 408}, {69880, -133, 408}, {69880, -135, 408}, 0,
                        {69885, -121, 408}, {69885, -122, 408}, {69885, -120, 408}, {69885, -118, 408}, 0,
                        {69883, -128, 408}, {69883, -125, 408}, {69883, -127, 408}, 0,
                        {65382, -121, 408}, {65382, -122, 408}, {65382, -120, 408}, {65382, -118, 408}, 0,
                        
                        {68132, -131, 314}, {68132, -129, 314}, {68132, -114, 314}, {68132, -130, 314}, {68132, -138, 314}, {68132, -132, 314}, 0,
                        {68130, -136, 314}, {68130, -137, 314}, {68130, -133, 314}, {68130, -135, 314}, 0,
                        {68131, -121, 314}, {68131, -122, 314}, {68131, -120, 314}, {68131, -118, 314}, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 1,
                    Loot =
                    {
                        63041, 0,
                        66998, 0,
                        63683, 63684, 63682, 0,
                        65001, 65000, 65002, 0,
                        64315, 64316, 64314, 0,
                        65088, 65087, 65089, 0,
                        
                        {63507, -187, 649}, {65383, -193, 733}, {63507, -183, 649}, {65383, -189, 733}, {63507, -184, 649}, {65383, -190, 733}, {63507, -185, 649}, {65383, -191, 733}, {63507, -186, 649}, {65383, -192, 733}, {63507, -188, 649}, {65383, -194, 733}, 0,
                        {63506, -187, 649}, {65384, -193, 733}, {63506, -185, 649}, {65384, -191, 733}, {63506, -186, 649}, {65384, -192, 733}, {63506, -188, 649}, {65384, -194, 733}, 0,
                        {63503, -198, 649}, {65381, -202, 733}, {63503, -197, 649}, {65381, -201, 733}, {63503, -195, 649}, {65381, -199, 733}, {63503, -196, 649}, {65381, -200, 733}, 0,
                        {63505, -187, 649}, {65386, -193, 733}, {63505, -185, 649}, {65386, -191, 733}, {63505, -186, 649}, {65386, -192, 733}, {63505, -188, 649}, {65386, -194, 733}, 0,
                        {63502, -198, 649}, {65378, -202, 733}, {63502, -197, 649}, {65378, -201, 733}, {63502, -195, 649}, {65378, -199, 733}, {63502, -196, 649}, {65378, -200, 733}, 0,
                        {63500, -169, 649}, {65379, -174, 733}, {63500, -171, 649}, {65379, -175, 733}, {63500, -170, 649}, {65379, -173, 733}, {63500, -172, 649}, {65379, -176, 733}, 0,
                        {63504, -187, 649}, {65385, -193, 733}, {63504, -185, 649}, {65385, -191, 733}, {63504, -186, 649}, {65385, -192, 733}, {63504, -188, 649}, {65385, -194, 733}, 0,
                        {63501, -179, 649}, {65380, -182, 733}, {63501, -177, 649}, {65380, -180, 733}, {63501, -178, 649}, {65380, -181, 733}, 0,
                        
                        {69835, -131, 362}, {69881, -131, 408}, {69835, -129, 362}, {69881, -129, 408}, {69835, -114, 362}, {69881, -114, 408}, {69835, -130, 362}, {69881, -130, 408}, {69835, -138, 362}, {69881, -138, 408}, {69835, -132, 362}, {69881, -132, 408}, 0,
                        {69831, -136, 362}, {69884, -136, 408}, {69831, -137, 362}, {69884, -137, 408}, {69831, -133, 362}, {69884, -133, 408}, {69831, -135, 362}, {69884, -135, 408}, 0,
                        {69834, -121, 362}, {69879, -121, 408}, {69834, -122, 362}, {69879, -122, 408}, {69834, -120, 362}, {69879, -120, 408}, {69834, -118, 362}, {69879, -118, 408}, 0,
                        {69833, -128, 362}, {69878, -128, 408}, {69833, -125, 362}, {69878, -125, 408}, {69833, -127, 362}, {69878, -127, 408}, 0,
                        {69830, -131, 362}, {69882, -131, 408}, {69830, -129, 362}, {69882, -129, 408}, {69830, -114, 362}, {69882, -114, 408}, {69830, -130, 362}, {69882, -130, 408}, {69830, -138, 362}, {69882, -138, 408}, {69830, -132, 362}, {69882, -132, 408}, 0,
                        {69827, -136, 362}, {69880, -136, 408}, {69827, -137, 362}, {69880, -137, 408}, {69827, -133, 362}, {69880, -133, 408}, {69827, -135, 362}, {69880, -135, 408}, 0,
                        {69829, -121, 362}, {69885, -121, 408}, {69829, -122, 362}, {69885, -122, 408}, {69829, -120, 362}, {69885, -120, 408}, {69829, -118, 362}, {69885, -118, 408}, 0,
                        {69828, -128, 362}, {69883, -128, 408}, {69828, -125, 362}, {69883, -125, 408}, {69828, -127, 362}, {69883, -127, 408}, 0,
                        {63499, -121, 362}, {65382, -121, 408}, {63499, -122, 362}, {65382, -122, 408}, {63499, -120, 362}, {65382, -120, 408}, {63499, -118, 362}, {65382, -118, 408}, 0,
                        
                        {68127, -131, 278}, {68132, -131, 314}, {68127, -129, 278}, {68132, -129, 314}, {68127, -114, 278}, {68132, -114, 314}, {68127, -130, 278}, {68132, -130, 314}, {68127, -138, 278}, {68132, -138, 314}, {68127, -132, 278}, {68132, -132, 314}, 0,
                        {68129, -136, 278}, {68130, -136, 314}, {68129, -137, 278}, {68130, -137, 314}, {68129, -133, 278}, {68130, -133, 314}, {68129, -135, 278}, {68130, -135, 314}, 0,
                        {68128, -121, 278}, {68131, -121, 314}, {68128, -122, 278}, {68131, -122, 314}, {68128, -120, 278}, {68131, -120, 314}, {68128, -118, 278}, {68131, -118, 314}, 0,
                    },
                },
                { Separator = true },
                { Name = "Tier 11 Pieces", Header = true },
                {
                    Name = "Normal",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60249, 60252, 0,
                        -- Mage
                        60243, 60246, 0,
                        -- Priest
                        60256, 60253, 0,
                        60258, 60262, 0,
                        -- Druid
                        60282, 60284, 0,
                        60277, 60279, 0,
                        60286, 60289, 0,
                        -- Rogue
                        60299, 60302, 0,
                        -- Hunter
                        60303, 60306, 0,
                        -- Shaman
                        60315, 60317, 0,
                        60308, 60311, 0,
                        60320, 60322, 0,
                        -- Paladin
                        60359, 60362, 0,
                        60346, 60348, 0,
                        60356, 60358, 0,
                        -- Warrior
                        60325, 60327, 0,
                        60328, 60331, 0,
                        -- Death Knight
                        60341, 60343, 0,
                        60351, 60353, 0,
                    },
                },
                {
                    Name = "Heroic",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        65260, 65263, 0,
                        -- Mage
                        65210, 65213, 0,
                        -- Priest
                        65235, 65238, 0,
                        65230, 65233, 0,
                        -- Druid
                        65200, 65203, 0,
                        65195, 65198, 0,
                        65190, 65193, 0,
                        -- Rogue
                        65241, 65243, 0,
                        -- Hunter
                        65206, 65208, 0,
                        -- Shaman
                        65256, 65258, 0,
                        65246, 65248, 0,
                        65251, 65253, 0,
                        -- Paladin
                        65221, 65223, 0,
                        65216, 65218, 0,
                        65226, 65228, 0,
                        -- Warrior
                        65266, 65268, 0,
                        65271, 65273, 0,
                        -- Death Knight
                        65181, 65183, 0,
                        65186, 65188, 0,
                    },
                },
                {
                    Name = "Combined",
                    IndentType = 2,
                    Loot =
                    {
                        -- Warlock
                        60249, 65260, 60252, 65263, 0,
                        -- Mage
                        60243, 65210, 60246, 65213, 0,
                        -- Priest
                        60256, 65235, 60253, 65238, 0,
                        60258, 65230, 60262, 65233, 0,
                        -- Druid
                        60282, 65200, 60284, 65203, 0,
                        60277, 65195, 60279, 65198, 0,
                        60286, 65190, 60289, 65193, 0,
                        -- Rogue
                        60299, 65241, 60302, 65243, 0,
                        -- Hunter
                        60303, 65206, 60306, 65208, 0,
                        -- Shaman
                        60315, 65256, 60317, 65258, 0,
                        60308, 65246, 60311, 65248, 0,
                        60320, 65251, 60322, 65253, 0,
                        -- Paladin
                        60359, 65221, 60362, 65223, 0,
                        60346, 65216, 60348, 65218, 0,
                        60356, 65226, 60358, 65228, 0,
                        -- Warrior
                        60325, 65266, 60327, 65268, 0,
                        60328, 65271, 60331, 65273, 0,
                        -- Death Knight
                        60341, 65181, 60343, 65183, 0,
                        60351, 65186, 60353, 65188, 0,
                    },
                },
            },
        },
        
        -- Baradin Hold
        [4510] = {
            Name = "Baradin Hold",
            NameShort = "BH",
            Color = LootReserve.Constants.Colors.Size10or25Tiny,
            Expansion = 3,
            Children =
            Squish{
                {
                    Name = "Argaloth",
                    Loot =
                    {
                        61045, 61047, 61046, 0,
                        61035, 61033, 61034, 0,
                        61026, 61031, 61032, 0,
                        60794, 60799, 60800, 0,
                        60801, 60806, 60807, 0,
                    },
                },
                {
                    Name = "Druid",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60285, 60283, 60453, 60455, 0, 60280, 60278, 60448, 60450, 0, 60290, 60288, 60443, 60445, 0,
                        
                        -- Bracers / Belt / Boots
                        60611, 60583, 60607, 0, 60582, 60580, 60581, 0, -- Druid
                        60591, 60589, 60587, 0, 60594, 60586, 60593, 0, -- Rogue / Druid
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60788, -- Paladin / Priest / Shaman / Druid
                        60783, 60779, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60664, -- Paladin / Priest / Shaman / Druid
                        60669, 60668, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60649, -- Paladin / Priest / Shaman / Druid
                        60658, 60659, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                },
                {
                    Name = "Death Knight",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60340, 60342, 0, 60350, 60352, 0, 60409, 60411, 0,
                        
                        -- Bracers / Belt / Boots
                        60523, 60521, 60513, 0, -- Warrior / Paladin / Death Knight
                        60512, 60508, 60509, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        60776, 60778, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        60673, 60670, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        60651, 60650, -- Warrior / Paladin / Death Knight
                        0,
                    },
                },
                {
                    Name = "Hunter",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60307, 60305, 60424, 60426, 0,
                        
                        -- Bracers / Belt / Boots
                        60559, 60555, 60557, 0, 60565, 60564, 60554, 0, -- Hunter / Shaman
                        
                        -- Capes
                        60783, 60779, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        60669, 60668, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        60658, 60659, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                },
                {
                    Name = "Mage",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60247, 60245, 60463, 60465, 0,
                        
                        -- Bracers / Belt / Boots
                        60628, 60626, 60630, 0, 60635, 60637, 60636, 0, 60634, 60612, 60613, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                },
                {
                    Name = "Paladin",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60363, 60361, 60602, 60604, 0, 60345, 60347, 60414, 60416, 0, 60355, 60357, 0,
                        
                        -- Bracers / Belt / Boots
                        60541, 60539, 60540, 0, -- Paladin
                        60520, 60505, 60516, 0, -- Paladin
                        60523, 60521, 60513, 0, -- Warrior / Paladin / Death Knight
                        60512, 60508, 60509, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60788, -- Paladin / Priest / Shaman / Druid
                        60776, 60778, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60664, -- Paladin / Priest / Shaman / Druid
                        60673, 60670, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60649, -- Paladin / Priest / Shaman / Druid
                        60651, 60650, -- Warrior / Paladin / Death Knight
                        0,
                    },
                },
                {
                    Name = "Priest",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60257, 60255, 60473, 60475, 0, 60275, 60261, 60468, 60470, 0,
                        
                        -- Bracers / Belt / Boots
                        60628, 60626, 60630, 0, 60635, 60637, 60636, 0, 60634, 60612, 60613, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60788, -- Paladin / Priest / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60664, -- Paladin / Priest / Shaman / Druid
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60649, -- Paladin / Priest / Shaman / Druid
                        0,
                    },
                },
                {
                    Name = "Rogue",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60298, 60300, 60459, 60461, 0,
                        
                        -- Bracers / Belt / Boots
                        60591, 60589, 60587, 0, 60594, 60586, 60593, 0, -- Rogue / Druid
                        
                        -- Capes
                        60783, 60779, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        60669, 60668, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        60658, 60659, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                },
                {
                    Name = "Shaman",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60314, 60316, 60439, 60441, 0, 60312, 60310, 60429, 60431, 0, 60319, 60321, 60434, 60436, 0,
                        
                        -- Bracers / Belt / Boots
                        60569, 60536, 60567, 0, 60535, 60533, 60534, 0, -- Shaman
                        60559, 60555, 60557, 0, 60565, 60564, 60554, 0, -- Hunter / Shaman
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60788, -- Paladin / Priest / Shaman / Druid
                        60783, 60779, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60664, -- Paladin / Priest / Shaman / Druid
                        60669, 60668, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        60649, -- Paladin / Priest / Shaman / Druid
                        60658, 60659, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                },
                {
                    Name = "Warlock",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60248, 60250, 60478, 60480, 0,
                        
                        -- Bracers / Belt / Boots
                        60628, 60626, 60630, 0, 60635, 60637, 60636, 0, 60634, 60612, 60613, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        60787, 60786, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        60662, 60661, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        60647, 60645, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                },
                {
                    Name = "Warrior",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        60326, 60324, 0, 60332, 60330, 0, 60419, 60421, 0,
                        
                        -- Bracers / Belt / Boots
                        60523, 60521, 60513, 0, -- Warrior / Paladin / Death Knight
                        60512, 60508, 60509, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        60776, 60778, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        60673, 60670, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        60651, 60650, -- Warrior / Paladin / Death Knight
                        0,
                    },
                },
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Occu'thar",
                    Loot =
                    {
                        70402, 70404, 70403, 0,
                        70401, 70399, 70400, 0,
                        70396, 70397, 70398, 0,
                        70390, 70391, 70392, 0,
                        70393, 70394, 70395, 0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Druid",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71107, 71109, 70289, 70291, 0, 71102, 71104, 70284, 70286, 0, 71097, 71099, 70279, 70281, 0,
                        
                        -- Bracers / Belt / Boots
                        70359, 70346, 70358, 0, 70345, 70343, 70344, 0, -- Druid
                        70350, 70349, 70348, 0, 70352, 70347, 70351, 0, -- Rogue / Druid
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70389, -- Paladin / Priest / Shaman / Druid
                        70386, 70385, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70378, -- Paladin / Priest / Shamn / Druid
                        70380, 70379, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70371, -- Paladin / Priest / Shamn / Druid
                        70374, 70375, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Death Knight",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71059, 71061, 0, 70953, 70952, 0, 70245, 70247, 0,
                        
                        -- Bracers / Belt / Boots
                        70327, 70326, 70323, 0, 70322, 70320, 70321, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        70383, 70384, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        70382, 70381, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        70373, 70372, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Hunter",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71050, 71052, 70260, 70262, 0,
                        
                        -- Bracers / Belt / Boots
                        70338, 70336, 70337, 0, 70340, 70339, 70335, 0, -- Hunter / Shaman
                        
                        -- Capes
                        70386, 70385, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        70380, 70379, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        70374, 70375, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Mage",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71286, 71288, 70299, 70301, 0,
                        
                        -- Bracers / Belt / Boots
                        70363, 70362, 70364, 0, 70366, 70368, 70367, 0, 70365, 70360, 70361, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Paladin",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71092, 71094, 70354, 70356, 0, 71064, 71066, 70250, 70252, 0, 70949, 70947, 0,
                        
                        -- Bracers / Belt / Boots
                        70334, 70332, 70333, 0, 70325, 70319, 70324, 0, -- Paladin
                        70327, 70326, 70323, 0, 70322, 70320, 70321, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70389, -- Paladin / Priest / Shaman / Druid
                        70383, 70384, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70378, -- Paladin / Priest / Shamn / Druid
                        70382, 70381, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70371, -- Paladin / Priest / Shamn / Druid
                        70373, 70372, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Priest",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71276, 71278, 70309, 70311, 0, 71271, 71273, 70304, 70306, 0,
                        
                        -- Bracers / Belt / Boots
                        70363, 70362, 70364, 0, 70366, 70368, 70367, 0, 70365, 70360, 70361, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70389, -- Paladin / Priest / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70378, -- Paladin / Priest / Shamn / Druid
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70371, -- Paladin / Priest / Shamn / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Rogue",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71046, 71048, 70295, 70297, 0,
                        
                        -- Bracers / Belt / Boots
                        70350, 70349, 70348, 0, 70352, 70347, 70351, 0, -- Rogue / Druid
                        
                        -- Capes
                        70386, 70385, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        70380, 70379, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        70374, 70375, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Shaman",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71292, 71294, 70275, 70277, 0, 71297, 71299, 70265, 70267, 0, 71302, 71304, 70270, 70272, 0,
                        
                        -- Bracers / Belt / Boots
                        70342, 70331, 70341, 0, 70330, 70328, 70329, 0, -- Shaman
                        70338, 70336, 70337, 0, 70340, 70339, 70335, 0, -- Hunter / Shaman
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70389, -- Paladin / Priest / Shaman / Druid
                        70386, 70385, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70378, -- Paladin / Priest / Shamn / Druid
                        70380, 70379, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        70371, -- Paladin / Priest / Shamn / Druid
                        70374, 70375, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Warlock",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71281, 71283, 70314, 70316, 0,
                        
                        -- Bracers / Belt / Boots
                        70363, 70362, 70364, 0, 70366, 70368, 70367, 0, 70365, 70360, 70361, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        70388, 70387, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        70377, 70376, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        70370, 70369, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                }),
                ShortCircuit(EXPANSION_PHASE >= 4.2, {
                    Name = "Warrior",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        71069, 71071, 0, 70943, 70942, 0, 70255, 70257, 0,
                        
                        -- Bracers / Belt / Boots
                        70327, 70326, 70323, 0, 70322, 70320, 70321, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        70383, 70384, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        70382, 70381, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        70373, 70372, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Alizabal",
                    Loot =
                    {
                        73497, 73643, 73491, 0,
                        73498, 73648, 73496, 0,
                        73593, 73591, 73592, 0,
                        73539, 73535, 73536, 0,
                        73538, 73534, 73537, 0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Druid",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        77018, 77020, 73599, 73597, 0, 76749, 76751, 73607, 73605, 0, 77014, 77016, 73615, 73613, 0,
                        
                        -- Bracers / Belt / Boots
                        73600, 73602, 73601, 0, 73608, 73610, 73609, 0, -- Druid
                        73528, 73532, 73531, 0, 73529, 73533, 73530, 0, -- Rogue / Druid
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73628, -- Paladin / Priest / Shamn / Druid
                        73647, 73646, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73625, -- Paladin / Priest / Shamn / Druid
                        73645, 73644, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73621, -- Paladin / Priest / Shamn / Druid
                        73640, 73641, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Death Knight",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76975, 76977, 0, 77009, 77011, 0, 73619, 73617, 0,
                        
                        -- Bracers / Belt / Boots
                        73551, 73554, 73552, 0, 73550, 73555, 73553, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        73495, 73494, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        73492, 73493, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        73488, 73489, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Hunter",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        77029, 77031, 73583, 73581, 0,
                        
                        -- Bracers / Belt / Boots
                        73586, 73590, 73587, 0, 73585, 73589, 73588, 0, -- Hunter / Shaman
                        
                        -- Capes
                        73647, 73646, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        73645, 73644, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        73640, 73641, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Mage",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76212, 76214, 73576, 73574, 0,
                        
                        -- Bracers / Belt / Boots
                        73633, 73638, 73635, 0, 73631, 73637, 73634, 0, 73632, 73639, 73636, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Paladin",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76766, 76768, 73559, 73557, 0, 76875, 76877, 73570, 73568, 0, 77004, 77006, 0,
                        
                        -- Bracers / Belt / Boots
                        73561, 73565, 73563, 0, 73562, 73566, 73564, 0, -- Paladin
                        73551, 73554, 73552, 0, 73550, 73555, 73553, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73628, -- Paladin / Priest / Shamn / Druid
                        73495, 73494, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73625, -- Paladin / Priest / Shamn / Druid
                        73492, 73493, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73621, -- Paladin / Priest / Shamn / Druid
                        73488, 73489, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Priest",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76348, 76346, 73544, 73542, 0, 76357, 76359, 73549, 73547, 0,
                        
                        -- Bracers / Belt / Boots
                        73633, 73638, 73635, 0, 73631, 73637, 73634, 0, 73632, 73639, 73636, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73628, -- Paladin / Priest / Shamn / Druid
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73625, -- Paladin / Priest / Shamn / Druid
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73621, -- Paladin / Priest / Shamn / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Rogue",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        77024, 77026, 73526, 73524, 0,
                        
                        -- Bracers / Belt / Boots
                        73528, 73532, 73531, 0, 73529, 73533, 73530, 0, -- Rogue / Druid
                        
                        -- Capes
                        73647, 73646, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Necklaces
                        73645, 73644, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        73640, 73641, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Shaman",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        77038, 77036, 73505, 73503, 0, 76757, 76759, 73516, 73514, 0, 77041, 77043, 73511, 73509, 0,
                        
                        -- Bracers / Belt / Boots
                        73519, 73507, 73521, 0, 73518, 73522, 73520, 0, -- Shaman
                        73586, 73590, 73587, 0, 73585, 73589, 73588, 0, -- Hunter / Shaman
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73628, -- Paladin / Priest / Shamn / Druid
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73625, -- Paladin / Priest / Shamn / Druid
                        73645, 73644, -- Hunter / Rogue / Shaman / Druid
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        73621, -- Paladin / Priest / Shamn / Druid
                        73640, 73641, -- Hunter / Rogue / Shaman / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Warlock",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76343, 76341, 73487, 73485, 0,
                        
                        -- Bracers / Belt / Boots
                        73633, 73638, 73635, 0, 73631, 73637, 73634, 0, 73632, 73639, 73636, 0, -- Priest / Mage / Warlock
                        
                        -- Capes
                        73630, 73629, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Necklaces
                        73627, 73626, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                        
                        -- Rings
                        73622, 73623, -- Paladin / Priest / Shaman / Mage / Warlock / Druid
                        0,
                    },
                }),
                ShortCircuit(false, {
                    Name = "Warrior",
                    IndentType = 1,
                    Loot =
                    {
                        -- Set
                        76985, 76986, 0, 76989, 76991, 0, 73481, 73479, 0,
                        
                        -- Bracers / Belt / Boots
                        73551, 73554, 73552, 0, 73550, 73555, 73553, 0, -- Warrior / Paladin / Death Knight
                        
                        -- Capes
                        73495, 73494, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Necklaces
                        73492, 73493, -- Warrior / Paladin / Death Knight
                        0,
                        
                        -- Rings
                        73488, 73489, -- Warrior / Paladin / Death Knight
                        0,
                    },
                }),
            },
        },
    },
    ItemConditions = { },
    
    RecentLootBlacklist = {
        [29434]  = true, -- Badge of Justice (when it was an item in TBC)
        [202269] = true, -- Bounty Satchel (Titan Rune Dungeon: Alpha)
        [208157] = true, -- Bounty Satchel (Titan Rune Dungeon: Beta)
    },
    
    -- Items which start a quest that can only be completed one time
    QuestStarters = {
        -- Perfect Blackfathom Pearl
        [209693] = 78916,
        [211452] = 78917,
        
        -- Thermaplugg's Engineering Notes
        [217350] = 80324,
        [217351] = 80325,
        
        -- Scapula of the Fallen Avatar
        [221346] = 82081,
        [221363] = 82083,
        
        -- Ancient Petrified Leaf
        [18703] = 7632,
        
        -- Head of Onyxia
        [18422] = 7495,
        [18423] = 7490,
        
        -- BWL class gear (Season of Discovery)
        [231722] = 85112,
        [231814] = 85501,
        [229352] = 84870,
        [231882] = 85521,
        [231995] = 85555,
        [231452] = 85455,
        [231378] = 85445,
        
        -- Head of Nefarian
        [19002] = 7781,
        [19003] = 7783,
        
        -- Heart of Hakkar
        [19802] = 8183,
        
        -- Head of Ossirian the Unscarred
        [21220] = 8791,
        
        -- Eye of C'Thun
        [21221] = 8801,
        
        -- The Phylactery of Kel'Thuzad
        [22520] = 9120,
            
        -- Magtheridon's Head
        [32385] = 11002,
        [32386] = 11003,
        
        -- Verdant Sphere
        [32405] = 11007,
        
        -- Blood of Zul'jin
        [33102] = 11178,
    },
    
    -- Items that require an active quest to loot and duplicates are not useful
    QuestDrops = {
        -- Narain's Scrying Goggles
        [20951] = 8578,
        
        -- Draconic for Dummies
        [21110] = 8620,
        
        -- Head of the Broodlord Lashlayer
        [20383] = 8288,
        
        -- Red Scepter Shard
        [21138] = 8730,
    },
    TokenMap = {
        Tokens        = { },
        Rewards       = { },
        HeroicMirrors = { },
    },
    NonUniqueWinnings = {
        -- Items that the player may want to win multiple times
        
        -- Sunken Temple
        [220636] = true, -- Atal'ai Blood Icon
        [220637] = true, -- Atal'ai Ritual Token
        
        -- Ony/BWL
        [11938]  = true,  -- Sack of Gems
        [228992] = true, -- Onyxia Hide Backpack (Season of Discovery)
        
        -- ZG
        [22637] = true, -- Primal Hakkari Idol
        
        -- ZA
        [33865] = true, -- Amani Hex Stick
        
        -- Ony 10/25
        [49294] = {36919, 36922, 36931, 36928, 36934, 36925}, -- Ashen Sack of Gems
        
        -- ToC
        [47242] = true, -- Trophy of the Crusade
        [47557] = true, -- Regalia of the Grand Conqueror
        [47558] = true, -- Regalia of the Grand Protector
        [47559] = true, -- Regalia of the Grand Vanquisher
        
        -- ICC
        [52027] = true, -- Conqueror's Mark of Sanctification (Normal)
        [52026] = true, -- Protector's Mark of Sanctification (Normal)
        [52025] = true, -- Vanquisher's Mark of Sanctification (Normal)
        [52030] = true, -- Conqueror's Mark of Sanctification (Heroic)
        [52029] = true, -- Protector's Mark of Sanctification (Heroic)
        [52028] = true, -- Vanquisher's Mark of Sanctification (Heroic)
        
        -- Throne of the Four Winds
        [66998] = true, -- Essence of the Forlorn
    },
    ItemLevelOverrides = {},
    IntendedItems = {},
    OtherFactionItems = {},
};


local function HideItem(itemID)
    if LootReserve.Data.ItemConditions[itemID] then
        LootReserve.Data.ItemConditions[itemID] = LootReserve:Deepcopy(LootReserve.Data.ItemConditions[itemID]);
        LootReserve.Data.ItemConditions[itemID]["Hidden"] = true;
    else
        LootReserve.Data.ItemConditions[itemID] = hidden;
    end
end

local function ApplyClassRestriction(itemID, classMask)
    if LootReserve.Data.ItemConditions[itemID] then
        LootReserve.Data.ItemConditions[itemID] = LootReserve:Deepcopy(LootReserve.Data.ItemConditions[itemID]);
        LootReserve.Data.ItemConditions[itemID]["ClassMask"] = classMask;
    else
        LootReserve.Data.ItemConditions[itemID] = { ClassMask = classMask };
    end
end


local CHECK_FACTION_CONVERTED_ITEMS;
--@debug@
CHECK_FACTION_CONVERTED_ITEMS = false;
local allianceItems = {};
local hordeItems    = {};
--@end-debug@
local AddFactionConversionItem;
do
    local OtherFactionItems = LootReserve.Data.OtherFactionItems;
    if CHECK_FACTION_CONVERTED_ITEMS then
        if UnitFactionGroup("player") == "Alliance" then
            AddFactionConversionItem = function(alliance, horde)
                allianceItems[#allianceItems+1] = alliance;
                hordeItems[#hordeItems+1]       = horde;
                
                OtherFactionItems[horde] = alliance;
            end;
        else
            AddFactionConversionItem = function(alliance, horde)
                allianceItems[#allianceItems+1] = alliance;
                hordeItems[#hordeItems+1]       = horde;
                
                OtherFactionItems[alliance] = horde;
            end;
        end
    else
        if UnitFactionGroup("player") == "Alliance" then
            AddFactionConversionItem = function(alliance, horde)
                OtherFactionItems[horde] = alliance;
            end;
        else
            AddFactionConversionItem = function(alliance, horde)
                OtherFactionItems[alliance] = horde;
            end;
        end
    end
end
local function ApplySingleFactionRestriction(itemID, faction)
    if LootReserve.Data.ItemConditions[itemID] then
        LootReserve.Data.ItemConditions[itemID] = LootReserve:Deepcopy(LootReserve.Data.ItemConditions[itemID]);
        LootReserve.Data.ItemConditions[itemID]["Faction"] = faction;
    else
        LootReserve.Data.ItemConditions[itemID] = faction == "Alliance" and factionAlliance or factionHorde;
    end
end
local function ApplyFactionRestriction(allianceItem, hordeItem)
    AddFactionConversionItem(allianceItem, hordeItem)
    ApplySingleFactionRestriction(allianceItem, "Alliance")
    ApplySingleFactionRestriction(hordeItem,    "Horde")
end


-- Hidden Items
do
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        -- Gnomeregan items
        HideItem(213427); -- Grime-Encrusted Salvage
        
        -- Sunken Temple items
        HideItem(221312); -- Flask of Atal'ai Mojo
        
        -- Thunderfury items
        HideItem(232018);
        
        -- Hand of Rag items
        HideItem(227728); -- Eye of Sulfuras
    end
    
    -- Molten Core trash
    HideItem(11382);
    HideItem(17010);
    HideItem(17011);
    HideItem(17012);
    HideItem(20951);
    
    -- Hand of Rag items
    HideItem(17204);
    HideItem(17203);
    
    -- Thunderfury items
    HideItem(18563);
    HideItem(18564);
    HideItem(18562);
    HideItem(19017);
    
    -- Scale of Onyxia
    HideItem(15410);
    
    -- Red Scepter Shard
    HideItem(21138);
    
    -- ZG Coins
    HideItem(19698);
    HideItem(19699);
    HideItem(19700);
    HideItem(19701);
    HideItem(19702);
    HideItem(19703);
    HideItem(19704);
    HideItem(19705);
    HideItem(19706);
    
    -- ZG Bijous
    HideItem(19707);
    HideItem(19708);
    HideItem(19709);
    HideItem(19710);
    HideItem(19711);
    HideItem(19712);
    HideItem(19713);
    HideItem(19714);
    HideItem(19715);
    
    --AQ20 idols
    HideItem(20866);
    HideItem(20867);
    HideItem(20868);
    HideItem(20869);
    HideItem(20870);
    HideItem(20871);
    HideItem(20872);
    HideItem(20873);
    
    -- AQ40 idols
    HideItem(20874);
    HideItem(20875);
    HideItem(20876);
    HideItem(20877);
    HideItem(20878);
    HideItem(20879);
    HideItem(20881);
    HideItem(20882);
    
    -- AQ scarabs
    HideItem(20858);
    HideItem(20859);
    HideItem(20860);
    HideItem(20861);
    HideItem(20862);
    HideItem(20863);
    HideItem(20864);
    HideItem(20865);
    
    -- AQ scarab coffer items
    HideItem(21156);
    HideItem(21761);
    HideItem(21762);
    
    -- AQ trash
    HideItem(22202);
    HideItem(22203);
    
    -- Naxxramas scraps
    HideItem(22376);
    HideItem(22373);
    HideItem(22374);
    HideItem(22375);
    
    -- Naxxramas runes
    HideItem(23055);
    HideItem(22682);
    
    -- Atiesh splinters
    HideItem(22726);
    
    
    
    -- Karazhan trash
    -- HideItem(23857);
    -- HideItem(23864);
    -- HideItem(23862);
    -- HideItem(23865);
    HideItem(21882);
    
    -- Magtheridon's gem bag
    -- HideItem(34846);
    
    -- Ashes of A'lar
    HideItem(32458);
    
    -- TBC Trade items
    HideItem(32897);
    HideItem(32428);
    HideItem(34664);
    
    -- Warglaives of Azzinoth
    HideItem(32837);
    HideItem(32838);
    
    -- TBC Trash gems
    HideItem(32228);
    HideItem(32231);
    HideItem(32229);
    HideItem(32249);
    HideItem(32230);
    HideItem(32227);
    
    -- Zul'Aman trash
    HideItem(33865);
    -- HideItem(33930);
    -- HideItem(33932);
    -- HideItem(33931);
    -- HideItem(33933);
    
    -- Thoridal
    HideItem(34334);
    
    
    
    -- Fragment of Val'anyr
    HideItem(45038);
    
    -- Crusader Orb
    HideItem(47556);
    
    -- Ashen Sack of Gems
    -- HideItem(49294);
    
    -- Primordial Saronite
    HideItem(49908);
    
    -- Shadowfrost Shard
    HideItem(50274);
    
    -- Precious's Ribbon
    HideItem(52019);
end


-- Class Restricted Items
do
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        ApplyClassRestriction(227728, 1091); -- Eye of Sulfuras
    end
    
    -- Hand of Rag items
    ApplyClassRestriction(17204, 1091);
    ApplyClassRestriction(17203, 1091);
    
    -- Atiesh splinters should have a class mask since they cannot be traded
    ApplyClassRestriction(22726, 1424);
    
    -- Shadowfrost Shards should have a class mask since they cannot be traded
    ApplyClassRestriction(50274, 35);
end


-- Faction Restricted Items
do
    
    -- SoD items
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        -- Blackfathom Deeps
        
        -- Perfect Blackfathom Pearl
        ApplyFactionRestriction(209693, 211452);
        
        
        -- Gnomeregan
        
        -- Thermaplugg's Engineering Notes
        ApplyFactionRestriction(217350, 217351);
        
        
        -- Sunken Temple
        
        -- Scapula of the Fallen Avatar
        ApplyFactionRestriction(221346, 221363);
    end
    
    
    -- Head of Onyxia
    ApplyFactionRestriction(18423, 18422);
    
    -- Head of Nefarian
    ApplyFactionRestriction(19003, 19002);
    
    
    -- Magtheridon's Head
    ApplyFactionRestriction(32385, 32386);
    
    
    
    -- ToC Set Pieces
    
    -- Vendor (some of it drops in VoA)
    ApplyFactionRestriction(47784, 47801);
    ApplyFactionRestriction(47787, 47798);
    ApplyFactionRestriction(47786, 47799);
    ApplyFactionRestriction(47783, 47802);
    ApplyFactionRestriction(47785, 47800);
    ApplyFactionRestriction(47748, 47774);
    ApplyFactionRestriction(47751, 47777);
    ApplyFactionRestriction(47749, 47776);
    ApplyFactionRestriction(47752, 47773);
    ApplyFactionRestriction(47750, 47775);
    ApplyFactionRestriction(48073, 48098);
    ApplyFactionRestriction(48076, 48101);
    ApplyFactionRestriction(48075, 48100);
    ApplyFactionRestriction(48072, 48097);
    ApplyFactionRestriction(48074, 48099);
    ApplyFactionRestriction(47914, 48068);
    ApplyFactionRestriction(47981, 48071);
    ApplyFactionRestriction(47936, 48070);
    ApplyFactionRestriction(47982, 48067);
    ApplyFactionRestriction(47980, 48069);
    ApplyFactionRestriction(48158, 48184);
    ApplyFactionRestriction(48161, 48187);
    ApplyFactionRestriction(48159, 48186);
    ApplyFactionRestriction(48162, 48183);
    ApplyFactionRestriction(48160, 48185);
    ApplyFactionRestriction(48102, 48154);
    ApplyFactionRestriction(48131, 48157);
    ApplyFactionRestriction(48129, 48156);
    ApplyFactionRestriction(48132, 48153);
    ApplyFactionRestriction(48130, 48155);
    ApplyFactionRestriction(48214, 48188);
    ApplyFactionRestriction(48217, 48191);
    ApplyFactionRestriction(48216, 48189);
    ApplyFactionRestriction(48213, 48192);
    ApplyFactionRestriction(48215, 48190);
    ApplyFactionRestriction(48218, 48245);
    ApplyFactionRestriction(48221, 48247);
    ApplyFactionRestriction(48219, 48243);
    ApplyFactionRestriction(48222, 48244);
    ApplyFactionRestriction(48220, 48246);
    ApplyFactionRestriction(48250, 48277);
    ApplyFactionRestriction(48253, 48279);
    ApplyFactionRestriction(48251, 48275);
    ApplyFactionRestriction(48254, 48276);
    ApplyFactionRestriction(48252, 48278);
    ApplyFactionRestriction(48313, 48338);
    ApplyFactionRestriction(48315, 48340);
    ApplyFactionRestriction(48310, 48336);
    ApplyFactionRestriction(48312, 48337);
    ApplyFactionRestriction(48314, 48339);
    ApplyFactionRestriction(48280, 48297);
    ApplyFactionRestriction(48283, 48299);
    ApplyFactionRestriction(48281, 48295);
    ApplyFactionRestriction(48284, 48296);
    ApplyFactionRestriction(48282, 48298);
    ApplyFactionRestriction(48343, 48368);
    ApplyFactionRestriction(48345, 48370);
    ApplyFactionRestriction(48341, 48366);
    ApplyFactionRestriction(48342, 48367);
    ApplyFactionRestriction(48344, 48369);
    ApplyFactionRestriction(48371, 48388);
    ApplyFactionRestriction(48374, 48390);
    ApplyFactionRestriction(48372, 48386);
    ApplyFactionRestriction(48375, 48387);
    ApplyFactionRestriction(48373, 48389);
    ApplyFactionRestriction(48429, 48458);
    ApplyFactionRestriction(48448, 48460);
    ApplyFactionRestriction(48436, 48456);
    ApplyFactionRestriction(48449, 48457);
    ApplyFactionRestriction(48445, 48459);
    ApplyFactionRestriction(48472, 48503);
    ApplyFactionRestriction(48478, 48505);
    ApplyFactionRestriction(48474, 48501);
    ApplyFactionRestriction(48480, 48502);
    ApplyFactionRestriction(48476, 48504);
    ApplyFactionRestriction(48529, 48560);
    ApplyFactionRestriction(48535, 48562);
    ApplyFactionRestriction(48531, 48558);
    ApplyFactionRestriction(48537, 48559);
    ApplyFactionRestriction(48533, 48561);
    ApplyFactionRestriction(48564, 48597);
    ApplyFactionRestriction(48572, 48595);
    ApplyFactionRestriction(48566, 48599);
    ApplyFactionRestriction(48574, 48598);
    ApplyFactionRestriction(48568, 48596);
    ApplyFactionRestriction(48604, 48629);
    ApplyFactionRestriction(48606, 48627);
    ApplyFactionRestriction(48602, 48631);
    ApplyFactionRestriction(48603, 48630);
    ApplyFactionRestriction(48605, 48628);
    ApplyFactionRestriction(48634, 48654);
    ApplyFactionRestriction(48636, 48656);
    ApplyFactionRestriction(48632, 48652);
    ApplyFactionRestriction(48633, 48653);
    ApplyFactionRestriction(48635, 48655);
    
    
    -- Normal
    ApplyFactionRestriction(47778, 47804);
    ApplyFactionRestriction(47781, 47807);
    ApplyFactionRestriction(47779, 47806);
    ApplyFactionRestriction(47782, 47803);
    ApplyFactionRestriction(47780, 47805);
    ApplyFactionRestriction(47984, 48065);
    ApplyFactionRestriction(47987, 48062);
    ApplyFactionRestriction(47986, 48063);
    ApplyFactionRestriction(47983, 48066);
    ApplyFactionRestriction(47985, 48064);
    ApplyFactionRestriction(48078, 48095);
    ApplyFactionRestriction(48081, 48092);
    ApplyFactionRestriction(48080, 48093);
    ApplyFactionRestriction(48077, 48096);
    ApplyFactionRestriction(48079, 48094);
    ApplyFactionRestriction(48225, 48240);
    ApplyFactionRestriction(48227, 48238);
    ApplyFactionRestriction(48223, 48242);
    ApplyFactionRestriction(48224, 48241);
    ApplyFactionRestriction(48226, 48239);
    ApplyFactionRestriction(48257, 48272);
    ApplyFactionRestriction(48259, 48270);
    ApplyFactionRestriction(48255, 48274);
    ApplyFactionRestriction(48256, 48273);
    ApplyFactionRestriction(48258, 48271);
    ApplyFactionRestriction(48430, 48463);
    ApplyFactionRestriction(48454, 48465);
    ApplyFactionRestriction(48450, 48461);
    ApplyFactionRestriction(48452, 48462);
    ApplyFactionRestriction(48446, 48464);
    ApplyFactionRestriction(48378, 48393);
    ApplyFactionRestriction(48380, 48395);
    ApplyFactionRestriction(48376, 48391);
    ApplyFactionRestriction(48377, 48392);
    ApplyFactionRestriction(48379, 48394);
    ApplyFactionRestriction(48540, 48555);
    ApplyFactionRestriction(48542, 48553);
    ApplyFactionRestriction(48538, 48557);
    ApplyFactionRestriction(48539, 48556);
    ApplyFactionRestriction(48541, 48554);
    ApplyFactionRestriction(48483, 48498);
    ApplyFactionRestriction(48485, 48496);
    ApplyFactionRestriction(48481, 48500);
    ApplyFactionRestriction(48482, 48499);
    ApplyFactionRestriction(48484, 48497);
    ApplyFactionRestriction(47754, 47771);
    ApplyFactionRestriction(47757, 47768);
    ApplyFactionRestriction(47756, 47769);
    ApplyFactionRestriction(47753, 47772);
    ApplyFactionRestriction(47755, 47770);
    ApplyFactionRestriction(48134, 48151);
    ApplyFactionRestriction(48137, 48148);
    ApplyFactionRestriction(48136, 48149);
    ApplyFactionRestriction(48133, 48152);
    ApplyFactionRestriction(48135, 48150);
    ApplyFactionRestriction(48164, 48181);
    ApplyFactionRestriction(48167, 48178);
    ApplyFactionRestriction(48166, 48179);
    ApplyFactionRestriction(48163, 48182);
    ApplyFactionRestriction(48165, 48180);
    ApplyFactionRestriction(48211, 48194);
    ApplyFactionRestriction(48208, 48197);
    ApplyFactionRestriction(48209, 48196);
    ApplyFactionRestriction(48212, 48193);
    ApplyFactionRestriction(48210, 48195);
    ApplyFactionRestriction(48287, 48302);
    ApplyFactionRestriction(48289, 48304);
    ApplyFactionRestriction(48285, 48300);
    ApplyFactionRestriction(48286, 48301);
    ApplyFactionRestriction(48288, 48303);
    ApplyFactionRestriction(48318, 48333);
    ApplyFactionRestriction(48320, 48331);
    ApplyFactionRestriction(48316, 48335);
    ApplyFactionRestriction(48317, 48334);
    ApplyFactionRestriction(48319, 48332);
    ApplyFactionRestriction(48348, 48363);
    ApplyFactionRestriction(48350, 48361);
    ApplyFactionRestriction(48346, 48365);
    ApplyFactionRestriction(48347, 48364);
    ApplyFactionRestriction(48349, 48362);
    ApplyFactionRestriction(48577, 48592);
    ApplyFactionRestriction(48579, 48590);
    ApplyFactionRestriction(48575, 48594);
    ApplyFactionRestriction(48576, 48593);
    ApplyFactionRestriction(48578, 48591);
    ApplyFactionRestriction(48639, 48659);
    ApplyFactionRestriction(48637, 48661);
    ApplyFactionRestriction(48641, 48657);
    ApplyFactionRestriction(48640, 48658);
    ApplyFactionRestriction(48638, 48660);
    ApplyFactionRestriction(48609, 48624);
    ApplyFactionRestriction(48611, 48622);
    ApplyFactionRestriction(48607, 48626);
    ApplyFactionRestriction(48608, 48625);
    ApplyFactionRestriction(48610, 48623);
    
    
    -- Heroic
    ApplyFactionRestriction(47789, 47796);
    ApplyFactionRestriction(47792, 47793);
    ApplyFactionRestriction(47791, 47794);
    ApplyFactionRestriction(47788, 47797);
    ApplyFactionRestriction(47790, 47795);
    ApplyFactionRestriction(48035, 48058);
    ApplyFactionRestriction(48029, 48061);
    ApplyFactionRestriction(48031, 48060);
    ApplyFactionRestriction(48037, 48057);
    ApplyFactionRestriction(48033, 48059);
    ApplyFactionRestriction(48085, 48088);
    ApplyFactionRestriction(48082, 48091);
    ApplyFactionRestriction(48083, 48090);
    ApplyFactionRestriction(48086, 48087);
    ApplyFactionRestriction(48084, 48089);
    ApplyFactionRestriction(48230, 48235);
    ApplyFactionRestriction(48228, 48237);
    ApplyFactionRestriction(48232, 48233);
    ApplyFactionRestriction(48231, 48234);
    ApplyFactionRestriction(48229, 48236);
    ApplyFactionRestriction(48262, 48267);
    ApplyFactionRestriction(48260, 48269);
    ApplyFactionRestriction(48264, 48265);
    ApplyFactionRestriction(48263, 48266);
    ApplyFactionRestriction(48261, 48268);
    ApplyFactionRestriction(48433, 48468);
    ApplyFactionRestriction(48455, 48470);
    ApplyFactionRestriction(48451, 48466);
    ApplyFactionRestriction(48453, 48467);
    ApplyFactionRestriction(48447, 48469);
    ApplyFactionRestriction(48383, 48398);
    ApplyFactionRestriction(48381, 48400);
    ApplyFactionRestriction(48385, 48396);
    ApplyFactionRestriction(48384, 48397);
    ApplyFactionRestriction(48382, 48399);
    ApplyFactionRestriction(48545, 48550);
    ApplyFactionRestriction(48543, 48552);
    ApplyFactionRestriction(48547, 48548);
    ApplyFactionRestriction(48546, 48549);
    ApplyFactionRestriction(48544, 48551);
    ApplyFactionRestriction(48488, 48493);
    ApplyFactionRestriction(48486, 48495);
    ApplyFactionRestriction(48490, 48491);
    ApplyFactionRestriction(48489, 48492);
    ApplyFactionRestriction(48487, 48494);
    ApplyFactionRestriction(47761, 47764);
    ApplyFactionRestriction(47758, 47767);
    ApplyFactionRestriction(47759, 47766);
    ApplyFactionRestriction(47762, 47763);
    ApplyFactionRestriction(47760, 47765);
    ApplyFactionRestriction(48141, 48144);
    ApplyFactionRestriction(48138, 48147);
    ApplyFactionRestriction(48139, 48146);
    ApplyFactionRestriction(48142, 48143);
    ApplyFactionRestriction(48140, 48145);
    ApplyFactionRestriction(48171, 48174);
    ApplyFactionRestriction(48168, 48177);
    ApplyFactionRestriction(48169, 48176);
    ApplyFactionRestriction(48172, 48173);
    ApplyFactionRestriction(48170, 48175);
    ApplyFactionRestriction(48204, 48201);
    ApplyFactionRestriction(48207, 48198);
    ApplyFactionRestriction(48206, 48199);
    ApplyFactionRestriction(48203, 48202);
    ApplyFactionRestriction(48205, 48200);
    ApplyFactionRestriction(48292, 48307);
    ApplyFactionRestriction(48290, 48309);
    ApplyFactionRestriction(48294, 48305);
    ApplyFactionRestriction(48293, 48306);
    ApplyFactionRestriction(48291, 48308);
    ApplyFactionRestriction(48323, 48328);
    ApplyFactionRestriction(48321, 48330);
    ApplyFactionRestriction(48325, 48326);
    ApplyFactionRestriction(48324, 48327);
    ApplyFactionRestriction(48322, 48329);
    ApplyFactionRestriction(48353, 48358);
    ApplyFactionRestriction(48351, 48360);
    ApplyFactionRestriction(48355, 48356);
    ApplyFactionRestriction(48354, 48357);
    ApplyFactionRestriction(48352, 48359);
    ApplyFactionRestriction(48582, 48587);
    ApplyFactionRestriction(48580, 48585);
    ApplyFactionRestriction(48584, 48589);
    ApplyFactionRestriction(48583, 48588);
    ApplyFactionRestriction(48581, 48586);
    ApplyFactionRestriction(48644, 48649);
    ApplyFactionRestriction(48646, 48647);
    ApplyFactionRestriction(48642, 48651);
    ApplyFactionRestriction(48643, 48650);
    ApplyFactionRestriction(48645, 48648);
    ApplyFactionRestriction(48614, 48619);
    ApplyFactionRestriction(48612, 48621);
    ApplyFactionRestriction(48616, 48617);
    ApplyFactionRestriction(48615, 48618);
    ApplyFactionRestriction(48613, 48620);
    
    
    -- ToC Patterns
    ApplyFactionRestriction(47654, 47639);
    ApplyFactionRestriction(47655, 47638);
    ApplyFactionRestriction(47656, 47637);
    ApplyFactionRestriction(47657, 47636);
    ApplyFactionRestriction(47629, 47646);
    ApplyFactionRestriction(47635, 47647);
    ApplyFactionRestriction(47631, 47648);
    ApplyFactionRestriction(47630, 47649);
    ApplyFactionRestriction(47628, 47650);
    ApplyFactionRestriction(47634, 47651);
    ApplyFactionRestriction(47632, 47652);
    ApplyFactionRestriction(47633, 47653);
    ApplyFactionRestriction(47622, 47640);
    ApplyFactionRestriction(47623, 47641);
    ApplyFactionRestriction(47627, 47642);
    ApplyFactionRestriction(47626, 47643);
    ApplyFactionRestriction(47624, 47644);
    ApplyFactionRestriction(47625, 47645);
    
    
    -- ToC 10
    
    -- The Beasts of Northrend
    
    -- Normal
    ApplyFactionRestriction(47617, 47855);
    ApplyFactionRestriction(47613, 47857);
    ApplyFactionRestriction(47608, 47853);
    ApplyFactionRestriction(47616, 47860);
    ApplyFactionRestriction(47610, 47850);
    ApplyFactionRestriction(47611, 47852);
    ApplyFactionRestriction(47609, 47851);
    ApplyFactionRestriction(47615, 47859);
    ApplyFactionRestriction(47614, 47858);
    ApplyFactionRestriction(47607, 47849);
    ApplyFactionRestriction(47578, 47854);
    ApplyFactionRestriction(47612, 47856);
    
    -- Heroic
    ApplyFactionRestriction(47921, 47994);
    ApplyFactionRestriction(47923, 47996);
    ApplyFactionRestriction(47919, 47992);
    ApplyFactionRestriction(47926, 47999);
    ApplyFactionRestriction(47916, 47989);
    ApplyFactionRestriction(47918, 47991);
    ApplyFactionRestriction(47917, 47990);
    ApplyFactionRestriction(47924, 47998);
    ApplyFactionRestriction(47925, 47997);
    ApplyFactionRestriction(47915, 47988);
    ApplyFactionRestriction(47920, 47993);
    ApplyFactionRestriction(47922, 47995);
    
    -- Lord Jaraxxus
    
    -- Normal
    ApplyFactionRestriction(47663, 47861);
    ApplyFactionRestriction(47620, 47865);
    ApplyFactionRestriction(47669, 47863);
    ApplyFactionRestriction(47621, 47866);
    ApplyFactionRestriction(49235, 49236);
    ApplyFactionRestriction(47683, 47867);
    ApplyFactionRestriction(47680, 47869);
    ApplyFactionRestriction(47711, 47870);
    ApplyFactionRestriction(47619, 47872);
    ApplyFactionRestriction(47679, 47864);
    ApplyFactionRestriction(47618, 47862);
    ApplyFactionRestriction(47703, 47868);
    ApplyFactionRestriction(47676, 47871);
    
    -- Heroic
    ApplyFactionRestriction(47927, 48000);
    ApplyFactionRestriction(47931, 48004);
    ApplyFactionRestriction(47929, 48002);
    ApplyFactionRestriction(47932, 48005);
    ApplyFactionRestriction(49238, 49237);
    ApplyFactionRestriction(47933, 48006);
    ApplyFactionRestriction(47935, 48008);
    ApplyFactionRestriction(47937, 48009);
    ApplyFactionRestriction(47930, 48011);
    ApplyFactionRestriction(47939, 48003);
    ApplyFactionRestriction(47928, 48001);
    ApplyFactionRestriction(47934, 48007);
    ApplyFactionRestriction(47938, 48010);
    
    -- Faction Champions
    
    -- Normal
    ApplyFactionRestriction(47721, 47873);
    ApplyFactionRestriction(47719, 47878);
    ApplyFactionRestriction(47718, 47875);
    ApplyFactionRestriction(47717, 47876);
    ApplyFactionRestriction(47720, 47877);
    ApplyFactionRestriction(47728, 47880);
    ApplyFactionRestriction(47727, 47882);
    ApplyFactionRestriction(47726, 47879);
    ApplyFactionRestriction(47725, 47881);
    ApplyFactionRestriction(47724, 47874);
    
    -- Heroic
    ApplyFactionRestriction(47940, 48012);
    ApplyFactionRestriction(47945, 48017);
    ApplyFactionRestriction(47942, 48014);
    ApplyFactionRestriction(47943, 48015);
    ApplyFactionRestriction(47944, 48016);
    ApplyFactionRestriction(47947, 48019);
    ApplyFactionRestriction(47949, 48021);
    ApplyFactionRestriction(47946, 48018);
    ApplyFactionRestriction(47948, 48020);
    ApplyFactionRestriction(47941, 48013);
    
    -- The Twin Val'kyr
    
    -- Normal
    ApplyFactionRestriction(47745, 47889);
    ApplyFactionRestriction(49231, 49232);
    ApplyFactionRestriction(47746, 47891);
    ApplyFactionRestriction(47739, 47887);
    ApplyFactionRestriction(47744, 47893);
    ApplyFactionRestriction(47738, 47885);
    ApplyFactionRestriction(47747, 47890);
    ApplyFactionRestriction(47700, 47888);
    ApplyFactionRestriction(47742, 47913);
    ApplyFactionRestriction(47736, 47886);
    ApplyFactionRestriction(47737, 47884);
    ApplyFactionRestriction(47743, 47892);
    ApplyFactionRestriction(47740, 47883);
    
    -- Heroic
    ApplyFactionRestriction(47956, 48028);
    ApplyFactionRestriction(49234, 49233);
    ApplyFactionRestriction(47959, 48034);
    ApplyFactionRestriction(47954, 48026);
    ApplyFactionRestriction(47961, 48038);
    ApplyFactionRestriction(47952, 48024);
    ApplyFactionRestriction(47957, 48030);
    ApplyFactionRestriction(47955, 48027);
    ApplyFactionRestriction(47958, 48032);
    ApplyFactionRestriction(47953, 48025);
    ApplyFactionRestriction(47951, 48023);
    ApplyFactionRestriction(47960, 48036);
    ApplyFactionRestriction(47950, 48022);
    
    -- Anub'arak
    
    -- Normal
    ApplyFactionRestriction(47838, 47906);
    ApplyFactionRestriction(47837, 47909);
    ApplyFactionRestriction(47832, 47904);
    ApplyFactionRestriction(47813, 47897);
    ApplyFactionRestriction(47829, 47901);
    ApplyFactionRestriction(47811, 47896);
    ApplyFactionRestriction(47836, 47902);
    ApplyFactionRestriction(47830, 47908);
    ApplyFactionRestriction(47810, 47899);
    ApplyFactionRestriction(47814, 47903);
    ApplyFactionRestriction(47808, 47898);
    ApplyFactionRestriction(47809, 47894);
    ApplyFactionRestriction(47816, 47905);
    ApplyFactionRestriction(47834, 47911);
    ApplyFactionRestriction(47815, 47900);
    ApplyFactionRestriction(47835, 47910);
    ApplyFactionRestriction(47812, 47895);
    ApplyFactionRestriction(47741, 47907);
    
    -- Heroic
    ApplyFactionRestriction(47974, 48051);
    ApplyFactionRestriction(47977, 48054);
    ApplyFactionRestriction(47972, 48049);
    ApplyFactionRestriction(47965, 48042);
    ApplyFactionRestriction(47969, 48046);
    ApplyFactionRestriction(47964, 48041);
    ApplyFactionRestriction(47976, 48047);
    ApplyFactionRestriction(47970, 48053);
    ApplyFactionRestriction(47967, 48044);
    ApplyFactionRestriction(47971, 48048);
    ApplyFactionRestriction(47966, 48043);
    ApplyFactionRestriction(47962, 48039);
    ApplyFactionRestriction(47973, 48050);
    ApplyFactionRestriction(47979, 48056);
    ApplyFactionRestriction(47968, 48045);
    ApplyFactionRestriction(47978, 48055);
    ApplyFactionRestriction(47963, 48040);
    ApplyFactionRestriction(47975, 48052);
    
    -- Tribute Chest
    ApplyFactionRestriction(48712, 48703);
    ApplyFactionRestriction(48714, 48699);
    ApplyFactionRestriction(48709, 48693);
    ApplyFactionRestriction(48708, 48701);
    ApplyFactionRestriction(48710, 48705);
    ApplyFactionRestriction(48713, 48695);
    ApplyFactionRestriction(48711, 48697);
    ApplyFactionRestriction(49044, 49046);
    ApplyFactionRestriction(48671, 48669);
    ApplyFactionRestriction(48672, 48668);
    ApplyFactionRestriction(48674, 48670);
    ApplyFactionRestriction(48673, 48666);
    ApplyFactionRestriction(48675, 48667);
    
    
    -- ToGC 25
    
    -- The Beasts of Northrend
    
    -- Normal
    ApplyFactionRestriction(46992, 47264);
    ApplyFactionRestriction(46972, 47258);
    ApplyFactionRestriction(46974, 47259);
    ApplyFactionRestriction(46988, 47262);
    ApplyFactionRestriction(46960, 47251);
    ApplyFactionRestriction(46990, 47265);
    ApplyFactionRestriction(46962, 47254);
    ApplyFactionRestriction(46961, 47253);
    ApplyFactionRestriction(46985, 47263);
    ApplyFactionRestriction(46970, 47257);
    ApplyFactionRestriction(46976, 47256);
    ApplyFactionRestriction(46959, 47252);
    ApplyFactionRestriction(46979, 47261);
    ApplyFactionRestriction(46958, 47255);
    ApplyFactionRestriction(46963, 47260);
    
    -- Heroic
    ApplyFactionRestriction(46993, 47425);
    ApplyFactionRestriction(46973, 47419);
    ApplyFactionRestriction(46975, 47420);
    ApplyFactionRestriction(46989, 47423);
    ApplyFactionRestriction(46965, 47412);
    ApplyFactionRestriction(46991, 47426);
    ApplyFactionRestriction(46968, 47415);
    ApplyFactionRestriction(46967, 47414);
    ApplyFactionRestriction(46986, 47424);
    ApplyFactionRestriction(46971, 47418);
    ApplyFactionRestriction(46977, 47417);
    ApplyFactionRestriction(46966, 47413);
    ApplyFactionRestriction(46980, 47422);
    ApplyFactionRestriction(46969, 47416);
    ApplyFactionRestriction(46964, 47421);
    
    -- Lord Jaraxxus
    
    -- Normal
    ApplyFactionRestriction(47051, 47274);
    ApplyFactionRestriction(47000, 47270);
    ApplyFactionRestriction(47055, 47277);
    ApplyFactionRestriction(47056, 47280);
    ApplyFactionRestriction(46999, 47268);
    ApplyFactionRestriction(47057, 47279);
    ApplyFactionRestriction(47052, 47273);
    ApplyFactionRestriction(46997, 47269);
    ApplyFactionRestriction(47042, 47275);
    ApplyFactionRestriction(47043, 47272);
    ApplyFactionRestriction(47223, 47278);
    ApplyFactionRestriction(47041, 47271);
    ApplyFactionRestriction(47053, 47276);
    ApplyFactionRestriction(46996, 47266);
    ApplyFactionRestriction(46994, 47267);
    
    -- Heroic
    ApplyFactionRestriction(47062, 47435);
    ApplyFactionRestriction(47004, 47431);
    ApplyFactionRestriction(47066, 47438);
    ApplyFactionRestriction(47068, 47441);
    ApplyFactionRestriction(47002, 47429);
    ApplyFactionRestriction(47067, 47440);
    ApplyFactionRestriction(47061, 47434);
    ApplyFactionRestriction(47003, 47430);
    ApplyFactionRestriction(47063, 47436);
    ApplyFactionRestriction(47060, 47433);
    ApplyFactionRestriction(47224, 47439);
    ApplyFactionRestriction(47059, 47432);
    ApplyFactionRestriction(47064, 47437);
    ApplyFactionRestriction(47001, 47427);
    ApplyFactionRestriction(46995, 47428);
    
    -- Faction Champions
    
    -- Normal
    ApplyFactionRestriction(47081, 47286);
    ApplyFactionRestriction(47092, 47293);
    ApplyFactionRestriction(47094, 47292);
    ApplyFactionRestriction(47071, 47284);
    ApplyFactionRestriction(47073, 47281);
    ApplyFactionRestriction(47083, 47289);
    ApplyFactionRestriction(47090, 47295);
    ApplyFactionRestriction(47082, 47288);
    ApplyFactionRestriction(47093, 47294);
    ApplyFactionRestriction(47072, 47283);
    ApplyFactionRestriction(47089, 47291);
    ApplyFactionRestriction(47070, 47282);
    ApplyFactionRestriction(47080, 47290);
    ApplyFactionRestriction(47069, 47285);
    ApplyFactionRestriction(47079, 47287);
    
    -- Heroic
    ApplyFactionRestriction(47084, 47447);
    ApplyFactionRestriction(47097, 47454);
    ApplyFactionRestriction(47096, 47453);
    ApplyFactionRestriction(47077, 47445);
    ApplyFactionRestriction(47074, 47442);
    ApplyFactionRestriction(47087, 47450);
    ApplyFactionRestriction(47099, 47456);
    ApplyFactionRestriction(47086, 47449);
    ApplyFactionRestriction(47098, 47455);
    ApplyFactionRestriction(47076, 47444);
    ApplyFactionRestriction(47095, 47452);
    ApplyFactionRestriction(47075, 47443);
    ApplyFactionRestriction(47088, 47451);
    ApplyFactionRestriction(47078, 47446);
    ApplyFactionRestriction(47085, 47448);
    
    -- The Twin Val'kyr
    
    -- Normal
    ApplyFactionRestriction(47126, 47301);
    ApplyFactionRestriction(47141, 47306);
    ApplyFactionRestriction(47107, 47308);
    ApplyFactionRestriction(47140, 47299);
    ApplyFactionRestriction(47106, 47296);
    ApplyFactionRestriction(47142, 47310);
    ApplyFactionRestriction(47108, 47298);
    ApplyFactionRestriction(47121, 47304);
    ApplyFactionRestriction(47116, 47307);
    ApplyFactionRestriction(47105, 47305);
    ApplyFactionRestriction(47139, 47297);
    ApplyFactionRestriction(47115, 47303);
    ApplyFactionRestriction(47138, 47309);
    ApplyFactionRestriction(47104, 47300);
    ApplyFactionRestriction(47114, 47302);
    
    -- Heroic
    ApplyFactionRestriction(47129, 47462);
    ApplyFactionRestriction(47143, 47467);
    ApplyFactionRestriction(47112, 47469);
    ApplyFactionRestriction(47145, 47460);
    ApplyFactionRestriction(47109, 47457);
    ApplyFactionRestriction(47147, 47471);
    ApplyFactionRestriction(47111, 47459);
    ApplyFactionRestriction(47132, 47465);
    ApplyFactionRestriction(47133, 47468);
    ApplyFactionRestriction(47110, 47466);
    ApplyFactionRestriction(47144, 47458);
    ApplyFactionRestriction(47131, 47464);
    ApplyFactionRestriction(47146, 47470);
    ApplyFactionRestriction(47113, 47461);
    ApplyFactionRestriction(47130, 47463);
    
    -- Anub'arak
    
    -- Normal
    ApplyFactionRestriction(47203, 47324);
    ApplyFactionRestriction(47235, 47326);
    ApplyFactionRestriction(47187, 47317);
    ApplyFactionRestriction(47194, 47321);
    ApplyFactionRestriction(47151, 47313);
    ApplyFactionRestriction(47186, 47318);
    ApplyFactionRestriction(47204, 47325);
    ApplyFactionRestriction(47152, 47311);
    ApplyFactionRestriction(47184, 47319);
    ApplyFactionRestriction(47234, 47330);
    ApplyFactionRestriction(47195, 47323);
    ApplyFactionRestriction(47150, 47312);
    ApplyFactionRestriction(47225, 47328);
    ApplyFactionRestriction(47183, 47320);
    ApplyFactionRestriction(47054, 47315);
    ApplyFactionRestriction(47149, 47327);
    ApplyFactionRestriction(47182, 47316);
    ApplyFactionRestriction(47148, 47314);
    ApplyFactionRestriction(47193, 47322);
    ApplyFactionRestriction(47233, 47329);
    
    -- Heroic
    ApplyFactionRestriction(47208, 47485);
    ApplyFactionRestriction(47236, 47487);
    ApplyFactionRestriction(47189, 47478);
    ApplyFactionRestriction(47205, 47482);
    ApplyFactionRestriction(47155, 47474);
    ApplyFactionRestriction(47190, 47479);
    ApplyFactionRestriction(47209, 47486);
    ApplyFactionRestriction(47153, 47472);
    ApplyFactionRestriction(47191, 47480);
    ApplyFactionRestriction(47240, 47492);
    ApplyFactionRestriction(47207, 47484);
    ApplyFactionRestriction(47154, 47473);
    ApplyFactionRestriction(47238, 47490);
    ApplyFactionRestriction(47192, 47481);
    ApplyFactionRestriction(47237, 47476);
    ApplyFactionRestriction(47157, 47489);
    ApplyFactionRestriction(47188, 47477);
    ApplyFactionRestriction(47156, 47475);
    ApplyFactionRestriction(47206, 47483);
    ApplyFactionRestriction(47239, 47491);
    
    -- Tribute
    ApplyFactionRestriction(47506, 47513);
    ApplyFactionRestriction(47526, 47528);
    ApplyFactionRestriction(47517, 47518);
    ApplyFactionRestriction(47519, 47520);
    ApplyFactionRestriction(47524, 47525);
    ApplyFactionRestriction(47515, 47516);
    ApplyFactionRestriction(47521, 47523);
    ApplyFactionRestriction(49096, 49098);
    ApplyFactionRestriction(47552, 47548);
    ApplyFactionRestriction(47553, 47546);
    ApplyFactionRestriction(47547, 47550);
    ApplyFactionRestriction(47545, 47551);
    ApplyFactionRestriction(47549, 47554);
    
    
    -- Baradin Hold PvP Trinkets
    ApplyFactionRestriction(60794, 60801);
    ApplyFactionRestriction(60799, 60806);
    ApplyFactionRestriction(60800, 60807);
    
    ApplyFactionRestriction(70390, 70393);
    ApplyFactionRestriction(70391, 70394);
    ApplyFactionRestriction(70392, 70395);
    
    ApplyFactionRestriction(73539, 73538);
    ApplyFactionRestriction(73535, 73534);
    ApplyFactionRestriction(73536, 73537);
end


-- Classic only restrictions
if LootReserve:GetCurrentExpansion() == 0 then
    
    -- SoD items
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        -- Blackfathom Deeps
        ApplySingleFactionRestriction(209574, "Alliance"); -- Discarded Tenets of the Silver Hand
        ApplySingleFactionRestriction(209575, "Horde");    -- Carved Driftwood Idol
        
        
        -- Gnomeregan
        ApplySingleFactionRestriction(215435, "Alliance"); -- Libram of Benediction
        ApplySingleFactionRestriction(215436, "Horde");    -- Totem of Invigorating Flame
        
        
        -- Sunken Temple
        ApplySingleFactionRestriction(220605, "Alliance"); -- Libram of Sacrilege
        ApplySingleFactionRestriction(220607, "Horde");    -- Totem of Tormented Ancestry
        
        
        -- Molten Core
        
        -- T1
        ApplySingleFactionRestriction(226592, "Alliance");
        ApplySingleFactionRestriction(226593, "Alliance");
        ApplySingleFactionRestriction(226589, "Alliance");
        ApplySingleFactionRestriction(226610, "Alliance");
        ApplySingleFactionRestriction(226591, "Alliance");
        ApplySingleFactionRestriction(226590, "Alliance");
        ApplySingleFactionRestriction(226594, "Alliance");
        ApplySingleFactionRestriction(226588, "Alliance");
        ApplySingleFactionRestriction(226601, "Alliance");
        ApplySingleFactionRestriction(226602, "Alliance");
        ApplySingleFactionRestriction(226599, "Alliance");
        ApplySingleFactionRestriction(226597, "Alliance");
        ApplySingleFactionRestriction(226600, "Alliance");
        ApplySingleFactionRestriction(226598, "Alliance");
        ApplySingleFactionRestriction(221783, "Alliance");
        ApplySingleFactionRestriction(226596, "Alliance");
        ApplySingleFactionRestriction(226604, "Alliance");
        ApplySingleFactionRestriction(226595, "Alliance");
        ApplySingleFactionRestriction(226608, "Alliance");
        ApplySingleFactionRestriction(226607, "Alliance");
        ApplySingleFactionRestriction(226606, "Alliance");
        ApplySingleFactionRestriction(226605, "Alliance");
        ApplySingleFactionRestriction(226609, "Alliance");
        ApplySingleFactionRestriction(226603, "Alliance");
        ApplySingleFactionRestriction(226621, "Horde");
        ApplySingleFactionRestriction(226623, "Horde");
        ApplySingleFactionRestriction(226624, "Horde");
        ApplySingleFactionRestriction(226619, "Horde");
        ApplySingleFactionRestriction(226622, "Horde");
        ApplySingleFactionRestriction(226625, "Horde");
        ApplySingleFactionRestriction(226620, "Horde");
        ApplySingleFactionRestriction(226626, "Horde");
        ApplySingleFactionRestriction(226616, "Horde");
        ApplySingleFactionRestriction(226613, "Horde");
        ApplySingleFactionRestriction(226618, "Horde");
        ApplySingleFactionRestriction(226611, "Horde");
        ApplySingleFactionRestriction(226615, "Horde");
        ApplySingleFactionRestriction(226612, "Horde");
        ApplySingleFactionRestriction(226614, "Horde");
        ApplySingleFactionRestriction(226617, "Horde");
        ApplySingleFactionRestriction(226636, "Horde");
        ApplySingleFactionRestriction(226642, "Horde");
        ApplySingleFactionRestriction(226639, "Horde");
        ApplySingleFactionRestriction(226635, "Horde");
        ApplySingleFactionRestriction(226641, "Horde");
        ApplySingleFactionRestriction(226637, "Horde");
        ApplySingleFactionRestriction(226638, "Horde");
        ApplySingleFactionRestriction(226640, "Horde");
        ApplySingleFactionRestriction(226630, "Horde");
        ApplySingleFactionRestriction(226629, "Horde");
        ApplySingleFactionRestriction(226632, "Horde");
        ApplySingleFactionRestriction(226628, "Horde");
        ApplySingleFactionRestriction(226631, "Horde");
        ApplySingleFactionRestriction(226627, "Horde");
        ApplySingleFactionRestriction(226633, "Horde");
        ApplySingleFactionRestriction(226634, "Horde");
        
        -- T2
        ApplySingleFactionRestriction(231194, "Alliance");
        ApplySingleFactionRestriction(231192, "Alliance");
        ApplySingleFactionRestriction(231197, "Alliance");
        ApplySingleFactionRestriction(231190, "Alliance");
        ApplySingleFactionRestriction(231195, "Alliance");
        ApplySingleFactionRestriction(231191, "Alliance");
        ApplySingleFactionRestriction(231193, "Alliance");
        ApplySingleFactionRestriction(231196, "Alliance");
        ApplySingleFactionRestriction(231178, "Alliance");
        ApplySingleFactionRestriction(231176, "Alliance");
        ApplySingleFactionRestriction(231181, "Alliance");
        ApplySingleFactionRestriction(231174, "Alliance");
        ApplySingleFactionRestriction(231179, "Alliance");
        ApplySingleFactionRestriction(231175, "Alliance");
        ApplySingleFactionRestriction(231177, "Alliance");
        ApplySingleFactionRestriction(231180, "Alliance");
        ApplySingleFactionRestriction(231186, "Alliance");
        ApplySingleFactionRestriction(231184, "Alliance");
        ApplySingleFactionRestriction(231187, "Alliance");
        ApplySingleFactionRestriction(231182, "Alliance");
        ApplySingleFactionRestriction(231188, "Alliance");
        ApplySingleFactionRestriction(231183, "Alliance");
        ApplySingleFactionRestriction(231185, "Alliance");
        ApplySingleFactionRestriction(231189, "Alliance");
        ApplySingleFactionRestriction(231219, "Horde");
        ApplySingleFactionRestriction(231217, "Horde");
        ApplySingleFactionRestriction(231221, "Horde");
        ApplySingleFactionRestriction(231215, "Horde");
        ApplySingleFactionRestriction(231214, "Horde");
        ApplySingleFactionRestriction(231216, "Horde");
        ApplySingleFactionRestriction(231218, "Horde");
        ApplySingleFactionRestriction(231220, "Horde");
        ApplySingleFactionRestriction(231203, "Horde");
        ApplySingleFactionRestriction(231201, "Horde");
        ApplySingleFactionRestriction(231205, "Horde");
        ApplySingleFactionRestriction(231199, "Horde");
        ApplySingleFactionRestriction(231198, "Horde");
        ApplySingleFactionRestriction(231200, "Horde");
        ApplySingleFactionRestriction(231202, "Horde");
        ApplySingleFactionRestriction(231204, "Horde");
        ApplySingleFactionRestriction(231227, "Horde");
        ApplySingleFactionRestriction(231225, "Horde");
        ApplySingleFactionRestriction(231229, "Horde");
        ApplySingleFactionRestriction(231223, "Horde");
        ApplySingleFactionRestriction(231222, "Horde");
        ApplySingleFactionRestriction(231224, "Horde");
        ApplySingleFactionRestriction(231226, "Horde");
        ApplySingleFactionRestriction(231228, "Horde");
        ApplySingleFactionRestriction(231211, "Horde");
        ApplySingleFactionRestriction(231209, "Horde");
        ApplySingleFactionRestriction(231213, "Horde");
        ApplySingleFactionRestriction(231207, "Horde");
        ApplySingleFactionRestriction(231206, "Horde");
        ApplySingleFactionRestriction(231208, "Horde");
        ApplySingleFactionRestriction(231210, "Horde");
        ApplySingleFactionRestriction(231212, "Horde");
        
        -- T2 (Core Forged)
        ApplySingleFactionRestriction(232155, "Alliance");
        ApplySingleFactionRestriction(232153, "Alliance");
        ApplySingleFactionRestriction(232158, "Alliance");
        ApplySingleFactionRestriction(232151, "Alliance");
        ApplySingleFactionRestriction(232156, "Alliance");
        ApplySingleFactionRestriction(232152, "Alliance");
        ApplySingleFactionRestriction(232154, "Alliance");
        ApplySingleFactionRestriction(232157, "Alliance");
        ApplySingleFactionRestriction(232147, "Alliance");
        ApplySingleFactionRestriction(232145, "Alliance");
        ApplySingleFactionRestriction(232150, "Alliance");
        ApplySingleFactionRestriction(232143, "Alliance");
        ApplySingleFactionRestriction(232148, "Alliance");
        ApplySingleFactionRestriction(232144, "Alliance");
        ApplySingleFactionRestriction(232146, "Alliance");
        ApplySingleFactionRestriction(232149, "Alliance");
        ApplySingleFactionRestriction(232163, "Alliance");
        ApplySingleFactionRestriction(232161, "Alliance");
        ApplySingleFactionRestriction(232166, "Alliance");
        ApplySingleFactionRestriction(232159, "Alliance");
        ApplySingleFactionRestriction(232164, "Alliance");
        ApplySingleFactionRestriction(232160, "Alliance");
        ApplySingleFactionRestriction(232162, "Alliance");
        ApplySingleFactionRestriction(232165, "Alliance");
        ApplySingleFactionRestriction(232203, "Horde");
        ApplySingleFactionRestriction(232201, "Horde");
        ApplySingleFactionRestriction(232206, "Horde");
        ApplySingleFactionRestriction(232199, "Horde");
        ApplySingleFactionRestriction(232204, "Horde");
        ApplySingleFactionRestriction(232200, "Horde");
        ApplySingleFactionRestriction(232202, "Horde");
        ApplySingleFactionRestriction(232205, "Horde");
        ApplySingleFactionRestriction(232211, "Horde");
        ApplySingleFactionRestriction(232209, "Horde");
        ApplySingleFactionRestriction(232214, "Horde");
        ApplySingleFactionRestriction(232207, "Horde");
        ApplySingleFactionRestriction(232212, "Horde");
        ApplySingleFactionRestriction(232208, "Horde");
        ApplySingleFactionRestriction(232210, "Horde");
        ApplySingleFactionRestriction(232213, "Horde");
        ApplySingleFactionRestriction(232219, "Horde");
        ApplySingleFactionRestriction(232217, "Horde");
        ApplySingleFactionRestriction(232222, "Horde");
        ApplySingleFactionRestriction(232215, "Horde");
        ApplySingleFactionRestriction(232220, "Horde");
        ApplySingleFactionRestriction(232216, "Horde");
        ApplySingleFactionRestriction(232218, "Horde");
        ApplySingleFactionRestriction(232221, "Horde");
        ApplySingleFactionRestriction(232227, "Horde");
        ApplySingleFactionRestriction(232225, "Horde");
        ApplySingleFactionRestriction(232230, "Horde");
        ApplySingleFactionRestriction(232223, "Horde");
        ApplySingleFactionRestriction(232228, "Horde");
        ApplySingleFactionRestriction(232224, "Horde");
        ApplySingleFactionRestriction(232226, "Horde");
        ApplySingleFactionRestriction(232229, "Horde");
        
        -- BWL trinkets
        ApplySingleFactionRestriction(230272, "Alliance");
        ApplySingleFactionRestriction(230273, "Horde");
        
        -- BWL class weapons
        ApplySingleFactionRestriction(231452, "Alliance");
        ApplySingleFactionRestriction(231995, "Horde");
        
        -- BWL paladin/shaman gear
        ApplySingleFactionRestriction(230278, "Alliance");
        ApplySingleFactionRestriction(230745, "Alliance");
        ApplySingleFactionRestriction(230279, "Horde");
        ApplySingleFactionRestriction(230800, "Horde");
        
        -- ZG paladin/shaman gear
        ApplySingleFactionRestriction(231303, "Alliance");
        ApplySingleFactionRestriction(230914, "Alliance");
        ApplySingleFactionRestriction(230926, "Alliance");
        ApplySingleFactionRestriction(231305, "Horde");
        ApplySingleFactionRestriction(230928, "Horde");
        ApplySingleFactionRestriction(230916, "Horde");
        
        -- ZG set items
        ApplySingleFactionRestriction(231329, "Alliance");
        ApplySingleFactionRestriction(231331, "Alliance");
        ApplySingleFactionRestriction(231330, "Alliance");
        ApplySingleFactionRestriction(231341, "Horde");
        ApplySingleFactionRestriction(231343, "Horde");
        ApplySingleFactionRestriction(231342, "Horde");
        
        -- ZG enchants
        ApplySingleFactionRestriction(231364, "Alliance");
        ApplySingleFactionRestriction(231363, "Alliance");
        ApplySingleFactionRestriction(231362, "Alliance");
        ApplySingleFactionRestriction(231361, "Alliance");
        ApplySingleFactionRestriction(231372, "Horde");
        ApplySingleFactionRestriction(231373, "Horde");
        ApplySingleFactionRestriction(231371, "Horde");
        ApplySingleFactionRestriction(231375, "Horde");
    end
    
    
    
    -- T1
    ApplySingleFactionRestriction(16853, "Alliance");
    ApplySingleFactionRestriction(16854, "Alliance");
    ApplySingleFactionRestriction(16855, "Alliance");
    ApplySingleFactionRestriction(16856, "Alliance");
    ApplySingleFactionRestriction(16857, "Alliance");
    ApplySingleFactionRestriction(16858, "Alliance");
    ApplySingleFactionRestriction(16859, "Alliance");
    ApplySingleFactionRestriction(16860, "Alliance");
    ApplySingleFactionRestriction(16837, "Horde");
    ApplySingleFactionRestriction(16838, "Horde");
    ApplySingleFactionRestriction(16839, "Horde");
    ApplySingleFactionRestriction(16840, "Horde");
    ApplySingleFactionRestriction(16841, "Horde");
    ApplySingleFactionRestriction(16842, "Horde");
    ApplySingleFactionRestriction(16843, "Horde");
    ApplySingleFactionRestriction(16844, "Horde");
    
    -- T2
    ApplySingleFactionRestriction(16951, "Alliance");
    ApplySingleFactionRestriction(16952, "Alliance");
    ApplySingleFactionRestriction(16953, "Alliance");
    ApplySingleFactionRestriction(16954, "Alliance");
    ApplySingleFactionRestriction(16955, "Alliance");
    ApplySingleFactionRestriction(16956, "Alliance");
    ApplySingleFactionRestriction(16957, "Alliance");
    ApplySingleFactionRestriction(16958, "Alliance");
    ApplySingleFactionRestriction(16943, "Horde");
    ApplySingleFactionRestriction(16944, "Horde");
    ApplySingleFactionRestriction(16945, "Horde");
    ApplySingleFactionRestriction(16946, "Horde");
    ApplySingleFactionRestriction(16947, "Horde");
    ApplySingleFactionRestriction(16948, "Horde");
    ApplySingleFactionRestriction(16949, "Horde");
    ApplySingleFactionRestriction(16950, "Horde");
    
    -- BWL trinkets
    ApplySingleFactionRestriction(19343, "Alliance");
    ApplySingleFactionRestriction(19344, "Horde");
    
    -- BWL paladin/shaman gear
    ApplySingleFactionRestriction(19402, "Alliance");
    ApplySingleFactionRestriction(19392, "Alliance");
    ApplySingleFactionRestriction(19401, "Horde");
    ApplySingleFactionRestriction(19393, "Horde");
    
    -- ZG set items
    ApplySingleFactionRestriction(19825, "Alliance");
    ApplySingleFactionRestriction(19827, "Alliance");
    ApplySingleFactionRestriction(19826, "Alliance");
    ApplySingleFactionRestriction(19828, "Horde");
    ApplySingleFactionRestriction(19830, "Horde");
    ApplySingleFactionRestriction(19829, "Horde");
    
    -- ZG paladin/shaman items
    ApplySingleFactionRestriction(20264, "Alliance");
    ApplySingleFactionRestriction(20265, "Alliance");
    ApplySingleFactionRestriction(20266, "Alliance");
    ApplySingleFactionRestriction(20257, "Horde");
    ApplySingleFactionRestriction(20260, "Horde");
    ApplySingleFactionRestriction(20262, "Horde");
    
    -- ZG enchants
    ApplySingleFactionRestriction(19783, "Alliance");
    ApplySingleFactionRestriction(19786, "Horde");
    
    -- AQ20 set items
    ApplySingleFactionRestriction(21397, "Alliance");
    ApplySingleFactionRestriction(21396, "Alliance");
    ApplySingleFactionRestriction(21395, "Alliance");
    ApplySingleFactionRestriction(21400, "Horde");
    ApplySingleFactionRestriction(21399, "Horde");
    ApplySingleFactionRestriction(21398, "Horde");
    
    -- AQ20 books
    ApplySingleFactionRestriction(21288, "Alliance");
    ApplySingleFactionRestriction(21289, "Alliance");
    ApplySingleFactionRestriction(21290, "Alliance");
    ApplySingleFactionRestriction(21291, "Horde");
    ApplySingleFactionRestriction(21292, "Horde");
    ApplySingleFactionRestriction(21293, "Horde");
    
    -- AQ20 equipment
    ApplySingleFactionRestriction(21453, "Alliance");
    ApplySingleFactionRestriction(21486, "Alliance");
    ApplySingleFactionRestriction(21803, "Alliance");
    ApplySingleFactionRestriction(21454, "Horde");
    ApplySingleFactionRestriction(21487, "Horde");
    ApplySingleFactionRestriction(21804, "Horde");
    
    -- AQ40 set items
    ApplySingleFactionRestriction(21387, "Alliance");
    ApplySingleFactionRestriction(21391, "Alliance");
    ApplySingleFactionRestriction(21389, "Alliance");
    ApplySingleFactionRestriction(21390, "Alliance");
    ApplySingleFactionRestriction(21388, "Alliance");
    ApplySingleFactionRestriction(21372, "Horde");
    ApplySingleFactionRestriction(21376, "Horde");
    ApplySingleFactionRestriction(21374, "Horde");
    ApplySingleFactionRestriction(21375, "Horde");
    ApplySingleFactionRestriction(21373, "Horde");
    
    -- AQ40 boots
    ApplySingleFactionRestriction(21704, "Alliance");
    ApplySingleFactionRestriction(21705, "Horde");
    
    -- AQ40 trash paladin gloves
    ApplySingleFactionRestriction(21889, "Alliance");
    
    -- Naxx40 set items
    ApplySingleFactionRestriction(22428, "Alliance");
    ApplySingleFactionRestriction(22429, "Alliance");
    ApplySingleFactionRestriction(22425, "Alliance");
    ApplySingleFactionRestriction(22424, "Alliance");
    ApplySingleFactionRestriction(22426, "Alliance");
    ApplySingleFactionRestriction(22431, "Alliance");
    ApplySingleFactionRestriction(22427, "Alliance");
    ApplySingleFactionRestriction(22430, "Alliance");
    ApplySingleFactionRestriction(23066, "Alliance");
    ApplySingleFactionRestriction(22466, "Horde");
    ApplySingleFactionRestriction(22467, "Horde");
    ApplySingleFactionRestriction(22464, "Horde");
    ApplySingleFactionRestriction(22471, "Horde");
    ApplySingleFactionRestriction(22469, "Horde");
    ApplySingleFactionRestriction(22470, "Horde");
    ApplySingleFactionRestriction(22465, "Horde");
    ApplySingleFactionRestriction(22468, "Horde");
    ApplySingleFactionRestriction(23065, "Horde");
    
    -- Naxx40 rings
    ApplySingleFactionRestriction(23066, "Alliance");
    ApplySingleFactionRestriction(23065, "Horde");
    
    -- Naxx40 trash drops
    ApplySingleFactionRestriction(23666, "Alliance");
    ApplySingleFactionRestriction(23667, "Alliance");
    ApplySingleFactionRestriction(23668, "Alliance");
    ApplySingleFactionRestriction(23664, "Horde");
    ApplySingleFactionRestriction(23665, "Horde");
end

-- Season of Discovery item updates
do
    local upgrades = {
        -- Azuregos
        [19131] = 228384, -- Snowblind Shoes
        [18545] = 228345, -- Leggings of Arcane Supremacy
        [19132] = 228385, -- Crystal Adorned Crown
        [18547] = 228340, -- Unmelting Ice Girdle
        [18208] = 228389, -- Drape of Benediction
        [18541] = 228383, -- Puissant Cape
        [19130] = 228381, -- Cold Snap
        [17070] = 228382, -- Fang of the Mystics
        [18202] = 228349, -- Eskhandar's Left Claw
        [18542] = 228347, -- Typhoon
        
        
        -- Kazzak
        [19133] = 228352, -- Fel Infused Leggings
        [19135] = 228357, -- Blacklight Bracer
        [19134] = 228355, -- Flayed Doomguard Belt
        [18544] = 228351, -- Doomhide Gauntlets
        [18546] = 228353, -- Infernal Headcage
        [18543] = 228359, -- Ring of Entropy
        [17111] = 228354, -- Blazefury Medallion
        [18204] = 228360, -- Eskhandar's Pelt
        [17113] = 228356, -- Amberseal Keeper
        [17112] = 228397, -- Empyrean Demolisher
        
        
        -- Onyxia
        [17064] = 228298, -- Shard of the Scale
        [18205] = 228759, -- Eskhandar's Collar
        [17067] = 228955, -- Ancient Cornerstone Grimoire
        [17966] = 228992, -- Onyxia Hide Backpack
        [18404] = 228685, -- Onyxia Tooth Pendant
        [18403] = 228687, -- Dragonslayer's Signet
        [18406] = 228686, -- Onyxia Blood Talisman
        
        
        -- Molten Core
        [16837] = 226613, -- Earthfury Boots
        [19145] = 228239, -- Robe of Volatile Power
        [18872] = 228244, -- Manastorm Leggings
        [18875] = 228245, -- Salamander Scale Pants
        [19146] = 228246, -- Wristguards of Stability
        [18870] = 228285, -- Helm of the Lifegiver
        [18861] = 228240, -- Flamewaker Legplates
        [17109] = 228247, -- Choker of Enlightenment
        [19147] = 228243, -- Ring of Spell Power
        [18879] = 228242, -- Heavy Dark Iron Ring
        [18878] = 228263, -- Sorcerous Dagger
        [17077] = 228262, -- Crimson Shocker
        [16843] = 226614, -- Earthfury Legguards
        [19136] = 228256, -- Mana Igniting Cord
        [18823] = 228257, -- Aged Core Leather Gloves
        [19144] = 228253, -- Sabatons of the Flamewalker
        [18829] = 228258, -- Deep Earth Spaulders
        [18824] = 228254, -- Magma Tempered Boots
        [19143] = 228260, -- Flameguard Gauntlets
        [18820] = 228255, -- Talisman of Ephemeral Power
        [18821] = 228261, -- Quick Strike Ring
        [17065] = 228249, -- Medallion of Steadfast Might
        [19142] = 228259, -- Fire Runed Grimoire
        [18203] = 228350, -- Eskhandar's Right Claw
        [18822] = 228229, -- Obsidian Edged Blade
        [17073] = 228248, -- Earthshaker
        [17069] = 228252, -- Striker's Mark
        [16839] = 226615, -- Earthfury Gauntlets
        [16842] = 226612, -- Earthfury Helmet
        [17105] = 228264, -- Aurastone Hammer
        [17071] = 228267, -- Gutgore Ripper
        [18832] = 228265, -- Brutality Blade
        [17066] = 228266, -- Drillborer Disk
        [16844] = 226611, -- Earthfury Epaulets
        [17110] = 228268, -- Seal of the Archmagus
        [16841] = 226617, -- Earthfury Vestments
        [17103] = 228269, -- Azuresong Mageblade
        [18842] = 228271, -- Staff of Dominance
        [17072] = 228270, -- Blastershot Launcher
        [17074] = 228272, -- Shadowstrike
        [18809] = 228282, -- Sash of Whispered Secrets
        [18808] = 228281, -- Gloves of the Hypnotic Flame
        [18810] = 228283, -- Wild Growth Spaulders
        [19139] = 228279, -- Fireguard Shoulders
        [18812] = 228284, -- Wristguards of True Flight
        [18806] = 228275, -- Core Forged Greaves
        [18811] = 228280, -- Fireproof Cloak
        [19140] = 228274, -- Cauterizing Band
        [18805] = 228277, -- Core Hound Tooth
        [18803] = 228278, -- Hyperthermically Insulated Lava Dredger
        [17204] = 227728, -- Eye of Sulfuras
        [18817] = 228291, -- Crown of Destruction
        [19137] = 228295, -- Onslaught Girdle
        [18814] = 228289, -- Choker of the Fire Lord
        [19138] = 228287, -- Band of Sulfuras
        [17102] = 228290, -- Cloak of the Shrouded Mists
        [17107] = 228292, -- Dragon's Blood Cape
        [17063] = 228286, -- Band of Accuria
        [17082] = 228297, -- Shard of the Flame
        [18815] = 228293, -- Essence of the Pure Flame
        [17106] = 228294, -- Malistar's Defender
        [18816] = 228296, -- Perdition's Blade
        [17104] = 228299, -- Spinal Reaper
        [17076] = 228288, -- Bonereaver's Edge
        [17182] = 227683, -- Sulfuras, Hand of Ragnaros
        
        [18608] = 228335, -- Benediction
        [18609] = 228336, -- Anathema
        [18713] = 228334, -- Rhok'delar, Longbow of the Ancient Keepers
        [18715] = 228332, -- Lok'delar, Stave of the Ancient Keepers
        
        [17223] = 228273, -- Thunderstrike
        
        [18292] = 228304, -- Schematic: Core Marksman Rifle | Schematic: Fiery Core Sharpshooter Rifle
        
        
        -- Blackwing Lair
        [19348] = 230248, -- Red Dragonscale Protector
        [19349] = 230802, -- Elementium Reinforced Bulwark
        [19350] = 230253, -- Heartstriker
        [19354] = 232357, -- Draconic Avenger
        [19361] = 230801, -- Ashjre'thul, Crossbow of Smiting
        [19362] = 230845, -- Doom's Edge
        [19366] = 230841, -- Master Dragonslayer's Orb
        [19367] = 230737, -- Dragon's Touch
        [19368] = 230726, -- Dragonbreath Hand Cannon
        [19369] = 230239, -- Gloves of Rapid Evolution
        [19370] = 230240, -- Mantle of the Blackwing Cabal
        [19371] = 230245, -- Pendant of the Fallen Dragon
        [19372] = 230246, -- Helm of Endless Rage
        [19373] = 230251, -- Black Brood Pauldrons
        [19374] = 230252, -- Bracers of Arcane Accuracy
        [19375] = 230812, -- Mish'undare, Circlet of the Mind Flayer
        [19376] = 230808, -- Archimtiros' Ring of Reckoning
        [19377] = 231803, -- Prestor's Talisman of Connivery
        [19378] = 230804, -- Cloak of the Brood Lord
        [19379] = 230810, -- Neltharion's Tear
        [19380] = 230806, -- Therazane's Link
        [19381] = 230805, -- Boots of the Shadow Flame
        [19382] = 230811, -- Pure Elementium Band
        [19383] = 230840, -- Master Dragonslayer's Medallion
        [19384] = 230839, -- Master Dragonslayer's Ring
        [19385] = 230746, -- Empowered Leggings
        [19386] = 230744, -- Elementium Threaded Cloak
        [19387] = 230741, -- Chromatic Boots
        [19388] = 230739, -- Angelista's Grasp
        [19389] = 230740, -- Taut Dragonhide Shoulderpads
        [19390] = 230742, -- Taut Dragonhide Gloves
        [19391] = 230743, -- Shimmering Geta
        [19392] = 230745, -- Girdle of the Fallen Crusader
        [19393] = 230800, -- Primalist's Linked Waistguard
        [19394] = 230256, -- Drake Talon Pauldrons
        [19395] = 230269, -- Rejuvenating Gem
        [19396] = 230255, -- Taut Dragonhide Belt
        [19397] = 230257, -- Ring of Blackrock
        [19398] = 230277, -- Cloak of Firemaw
        [19399] = 230274, -- Black Ash Robe
        [19400] = 230275, -- Firemaw's Clutch
        [19401] = 230279, -- Primalist's Linked Legguards
        [19402] = 230278, -- Legguards of the Fallen Crusader
        [19403] = 230281, -- Band of Forced Concentration
        [19405] = 230725, -- Malfurion's Blessed Bulwark
        [19406] = 230282, -- Drake Fang Talisman
        [19407] = 230723, -- Ebony Flame Gloves
        [19430] = 230733, -- Shroud of Pure Thought
        [19431] = 230736, -- Styleen's Impeding Scarab
        [19432] = 230734, -- Circle of Applied Force
        [19433] = 230735, -- Emberweave Leggings
        [19434] = 230846, -- Band of Dark Dominion
        [19435] = 230847, -- Essence Gatherer
        [19436] = 230842, -- Cloak of Draconic Might
        [19437] = 230843, -- Boots of Pure Thought
        [19438] = 230849, -- Ringo's Blizzard Boots
        [19439] = 230848, -- Interlaced Shadow Jerkin
        
        [19336] = 230237, -- Arcane Infused Gem
        [19337] = 230238, -- The Black Book
        [19339] = 230243, -- Mind Quickening Gem
        [19340] = 210980, -- Rune of Metamorphosis
        [19341] = 230249, -- Lifegiving Gem
        [19342] = 230250, -- Venomous Totem
        [19343] = 230272, -- Scrolls of Blinding Light
        [19344] = 230273, -- Natural Alignment Crystal
        [19345] = 230280, -- Aegis of Preservation
        
        [19334] = 230242, -- The Untamed Blade
        [19335] = 230241, -- Spineshatter
        [19346] = 230247, -- Dragonfang Blade
        [19347] = 230794, -- Claw of Chromaggus
        [19351] = 230254, -- Maladath, Runed Blade of the Black Flight
        [19352] = 230747, -- Chromatically Tempered Sword
        [19353] = 230271, -- Drake Talon Cleaver
        [19355] = 230270, -- Shadow Wing Focus Staff
        [19356] = 230813, -- Staff of the Shadow Flame
        [19357] = 230738, -- Herald of Woe
        [19358] = 230844, -- Draconic Maul
        [19360] = 230838, -- Lok'amir il Romathis
        [19363] = 230837, -- Crul'shorukh, Edge of Chaos
        [19364] = 230818, -- Ashkandi, Greatsword of the Brotherhood
        [19365] = 230276, -- Claw of the Black Drake
        
        
        -- Zul'Gurub
        [19822] = 231353, -- Zandalar Vindicator's Breastplate
        [19823] = 231352, -- Zandalar Vindicator's Belt
        [19824] = 231351, -- Zandalar Vindicator's Armguards
        [19825] = 231329, -- Zandalar Freethinker's Breastplate
        [19826] = 231330, -- Zandalar Freethinker's Belt
        [19827] = 231331, -- Zandalar Freethinker's Armguards
        [19828] = 231341, -- Zandalar Augur's Hauberk
        [19829] = 231342, -- Zandalar Augur's Belt
        [19830] = 231343, -- Zandalar Augur's Bracers
        [19831] = 231321, -- Zandalar Predator's Mantle
        [19832] = 231322, -- Zandalar Predator's Belt
        [19833] = 231323, -- Zandalar Predator's Bracers
        [19834] = 231337, -- Zandalar Madcap's Tunic
        [19835] = 231338, -- Zandalar Madcap's Mantle
        [19836] = 231339, -- Zandalar Madcap's Bracers
        [19838] = 231317, -- Zandalar Haruspex's Tunic
        [19839] = 231318, -- Zandalar Haruspex's Belt
        [19840] = 231319, -- Zandalar Haruspex's Bracers
        [19841] = 231333, -- Zandalar Confessor's Mantle
        [19842] = 231334, -- Zandalar Confessor's Bindings
        [19843] = 231335, -- Zandalar Confessor's Wraps
        [19845] = 231325, -- Zandalar Illusionist's Mantle
        [19846] = 231326, -- Zandalar Illusionist's Wraps
        [20034] = 231327, -- Zandalar Illusionist's Robe
        [19848] = 231347, -- Zandalar Demoniac's Wraps
        [19849] = 231349, -- Zandalar Demoniac's Mantle
        [20033] = 231348, -- Zandalar Demoniac's Robe
        
        [19855] = 231299, -- Bloodsoaked Legplates
        [19856] = 231307, -- The Eye of Hakkar
        [19857] = 231300, -- Cloak of Consumption
        [19862] = 231289, -- Aegis of the Blood God
        [19863] = 231000, -- Primalist's Seal
        [19869] = 230995, -- Blooddrenched Grips
        [19870] = 230998, -- Hakkari Loa Cloak
        [19871] = 230922, -- Talisman of Protection
        [19873] = 230999, -- Overlord's Crimson Band
        [19875] = 231007, -- Bloodstained Coif
        [19876] = 231306, -- Soul Corrupter's Necklace
        [19877] = 230994, -- Animist's Leggings
        [19878] = 230996, -- Bloodsoaked Pauldrons
        [19885] = 231003, -- Jin'do's Evil Eye
        [19886] = 231013, -- The Hexxer's Cover
        [19887] = 231008, -- Bloodstained Legplates
        [19888] = 231012, -- Overlord's Embrace
        [19889] = 231009, -- Blooddrenched Leggings
        [19891] = 231005, -- Jin'do's Bag of Whammies
        [19892] = 231006, -- Animist's Boots
        [19893] = 231001, -- Zanzil's Seal
        [19894] = 231010, -- Bloodsoaked Gauntlets
        [19895] = 230997, -- Bloodtinged Kilt
        [19897] = 230923, -- Betrayer's Boots
        [19898] = 230929, -- Seal of Jin
        [19899] = 230927, -- Ritualistic Legguards
        [19904] = 230864, -- Runed Bloodstained Hauberk
        [19905] = 230867, -- Zanzil's Band
        [19906] = 230866, -- Blooddrenched Footpads
        [19907] = 232311, -- Zulian Tigerhide Cloak
        [19912] = 230943, -- Overlord's Onyx Band
        [19913] = 230942, -- Bloodsoaked Greaves
        [19914] = 230944, -- Panther Hide Sack
        [19915] = 232299, -- Zulian Defender
        [19919] = 230919, -- Bloodstained Greaves
        [19920] = 230915, -- Primalist's Band
        [19922] = 230941, -- Arlokk's Hoodoo Stick
        [19923] = 230913, -- Jeklik's Opaline Talisman
        [19925] = 230921, -- Band of Jin
        [19928] = 230912, -- Animist's Spaulders
        [19929] = 231011, -- Bloodtinged Gloves
        [19930] = 230920, -- Mar'li's Eye
        [19939] = 231513, -- Gri'lek's Blood
        [19940] = 231514, -- Renataki's Tooth
        [19941] = 231515, -- Wushoolay's Mane
        [19942] = 231516, -- Hazza'rah's Dream Thread
        [19945] = 231014, -- Lizardscale Eyepatch
        [19947] = 231271, -- Nat Pagle's Broken Reel
        [20032] = 230917, -- Flowing Ritual Robes
        [20257] = 231305, -- Seafury Gauntlets
        [20260] = 230928, -- Seafury Leggings
        [20262] = 230916, -- Seafury Boots
        [20264] = 231303, -- Peacekeeper Gauntlets
        [20265] = 230914, -- Peacekeeper Boots
        [20266] = 230926, -- Peacekeeper Leggings
        [22637] = 231512, -- Primal Hakkari Idol
        [22714] = 230861, -- Sacrificial Gauntlets
        [22715] = 230859, -- Gloves of the Tormented
        [22716] = 230856, -- Belt of Untapped Power
        [22718] = 230857, -- Blooddrenched Mask
        [22720] = 230862, -- Zulian Headdress
        [22721] = 230854, -- Band of Servitude
        [22722] = 230855, -- Seal of the Gurubashi Berserker
        
        [19852] = 231293, -- Ancient Hakkari Manslayer
        [19853] = 231302, -- Gurubashi Dwarf Destroyer
        [19854] = 231315, -- Zin'rokh, Destroyer of Worlds
        [19859] = 231301, -- Fang of the Faceless
        [19861] = 231308, -- Touch of Chaos
        [19864] = 231296, -- Bloodcaller
        [19865] = 231309, -- Warblade of the Hakkari
        [19866] = 230992, -- Warblade of the Hakkari
        [19867] = 230989, -- Bloodlord's Defender
        [19874] = 230991, -- Halberd of Smiting
        [19884] = 231004, -- Jin'do's Judgement
        [19890] = 231002, -- Jin'do's Hexxer
        [19896] = 230925, -- Thekal's Grasp
        [19900] = 230868, -- Zulian Stone Axe
        [19901] = 230930, -- Zulian Slicer
        [19903] = 230865, -- Fang of Venoxis
        [19909] = 230939, -- Will of Arlokk
        [19910] = 230934, -- Arlokk's Grasp
        [19918] = 230911, -- Jeklik's Crusher
        [19927] = 230918, -- Mar'li's Touch
        [19944] = 231016, -- Nat Pagle's Fish Terminator
        [19946] = 231272, -- Tigule's Harpoon
        [19961] = 231274, -- Gri'lek's Grinder
        [19962] = 231273, -- Gri'lek's Carver
        [19963] = 231277, -- Pitchfork of Madness
        [19964] = 232309, -- Renataki's Soul Conduit
        [19965] = 231279, -- Wushoolay's Poker
        [19967] = 231276, -- Thoughtblighter
        [19968] = 231275, -- Fiery Retributer | Blazefury Retributer
        [19993] = 231278, -- Hoodoo Hunting Bow
        [20038] = 230993, -- Mandokir's Sting
        [22713] = 230863, -- Zulian Scepter of Rites
    };
    
    local IntendedItems = LootReserve.Data.IntendedItems;
    if SEASON_NUMBER == SEASONS.DISCOVERY then
        for eraItem, sodItem in pairs(upgrades) do
            IntendedItems[eraItem] = sodItem;
        end
    else
        for eraItem, sodItem in pairs(upgrades) do
            IntendedItems[sodItem] = eraItem;
        end
    end
end

--@debug@
if CHECK_FACTION_CONVERTED_ITEMS then
    ConcatenateIf(allianceItems, true, hordeItems);
    local allItems = allianceItems;
    
    function LootReserve:CheckFactionConvertedItems()
        LootReserve:debug("Checking " .. #hordeItems .. " items...")
        local count = 0;
        LootReserve.ItemCache:OnCache(allItems, function()
            for i, itemID in ipairs(hordeItems) do
                local alliance = LootReserve.ItemCache(allianceItems[i]);
                local horde    = LootReserve.ItemCache(itemID);
                if alliance == horde then
                    LootReserve:debug(alliance:GetLink(), horde:GetLink());
                else
                    if alliance:Exists() and horde:Exists() then
                        count = count + 1;
                        for funcName, compare in pairs({
                            GetName          = false,
                            GetType          = true,
                            GetSubType       = true,
                            GetQuality       = true,
                            GetLevel         = true,
                            GetEquipLocation = true,
                            GetSkillRequired = true,
                        }) do
                            if compare and alliance[funcName](alliance) ~= horde[funcName](horde) then
                                LootReserve:debug(alliance:GetLink(), horde:GetLink());
                                break;
                            end
                        end
                    end
                end
            end
            LootReserve:debug("Done checking " .. count .. " existing items.")
        end);
    end
end
--@end-debug@

local tokenMap = {
    -- Blackfathom Deeps
    
    -- Perfect Blackfathom Pearl
    [209693] = UnitFactionGroup("player") == "Alliance" and {211450, 211451, 211449} or nil,
    [211452] = UnitFactionGroup("player") == "Horde"    and {211450, 211451, 211449} or nil,
    
    
    -- Gnomeregan
    
    -- Power Depleted Chest
    [217008] = {213311, 213310, 213313, 213312, 213314, 213315, 213316, 216485},
    -- Power Depleted Legs
    [217009] = {213329, 213328, 213332, 213331, 213333, 213334, 213330, 216486},
    -- Power Depleted Boots
    [217007] = {213336, 213337, 213341, 213342, 213339, 213338, 213335, 216484},
    
    -- Thermaplugg's Engineering Notes
    [217350] = UnitFactionGroup("player") == "Alliance" and {213345, 213346, 213344, 213343} or nil,
    [217351] = UnitFactionGroup("player") == "Horde"    and {213345, 213346, 213344, 213343} or nil,
    
    
    -- Sunken Temple
    
    -- Atal'ai Ritual Token
    [220637] = {220783, 220781, 220784, 220680, 220679, 220681, 220683, 220684, 220685, 220672, 220673, 220675, 220669, 220671, 220670, 220779, 220778, 220780},
    -- Atal'ai Blood Icon
    [220636] = {220676, 220678, 220677, 220666, 220667, 220668, 220657, 220658, 220659, 220665, 220663, 220664, 220660, 220661, 220662, 220650, 220651, 220652, 220653, 220654, 220656, 220642, 220643, 220648},
    
    -- Scapula of the Fallen Avatar
    [221346] = UnitFactionGroup("player") == "Alliance" and {220628, 220626, 220627, 220629, 220630} or nil,
    [221363] = UnitFactionGroup("player") == "Horde"    and {220628, 220626, 220627, 220629, 220630} or nil,
    
    
    -- Molten Core
    
    [227532] = {226584, 226573, 226562, 226564, 226549, 216922}, -- Incandescent Hood (Season of Discovery)
    [227764] = {226495, 226488, 226446, 226480, 226658, 226647, 226659, 226670}, -- Scorched Core  Helm (Season of Discovery)
    [227755] = {226590, 226599, 226607, 226533, 226536, 226622, 226612, 226638, 226630}, -- Molten Scaled Helm (Season of Discovery)
    
    [227537] = {226581, 226576, 226560, 226566, 226550, 216925}, -- Incandescent Shoulderpads (Season of Discovery)
    [227762] = {226492, 226491, 226444, 226478, 226653, 226644, 226665, 226674}, -- Scorched Core Shoulderpads (Season of Discovery)
    [227752] = {226588, 221783, 226605, 226527, 226543, 226624, 226611, 226640, 226632}, -- Molten Scaled Shoulderpads (Season of Discovery)
    
    [227535] = {226582, 226575, 226559, 226563, 226548, 216924}, -- Incandescent Robe (Season of Discovery)
    [227766] = {226494, 226489, 226447, 226473, 226656, 221785, 226661, 226675}, -- Scorched Core Chest (Season of Discovery)
    [227758] = {226610, 226602, 226595, 226534, 226535, 226619, 226617, 226635, 226627}, -- Molten Scaled Chest (Season of Discovery)
    
    [227531] = {226579, 226578, 226558, 226567, 226553, 216920}, -- Incandescent Bindings (Season of Discovery)
    [227760] = {226499, 226484, 226442, 226476, 226655, 226649, 226662, 226668}, -- Scorched Core Bindings (Season of Discovery)
    [227750] = {226589, 226596, 226603, 226530, 226541, 226626, 226618, 226642, 226634}, -- Molten Scaled Bindings (Season of Discovery)
    
    [227533] = {226585, 226572, 226556, 226569, 226552, 216921}, -- Incandescent Gloves (Season of Discovery)
    [227759] = {226497, 226486, 226441, 226475, 226654, 226648, 226664, 226669}, -- Scorched Core Gloves (Season of Discovery)
    [227756] = {226591, 226600, 226608, 226528, 226540, 226621, 226615, 226637, 226629}, -- Molten Scaled Gloves (Season of Discovery)
    
    [227530] = {226580, 226577, 226555, 226570, 226551, 216919}, -- Incandescent Belt (Season of Discovery)
    [227761] = {226498, 226485, 226440, 226474, 226657, 226650, 226660, 226667}, -- Scorched Core Belt (Season of Discovery)
    [227751] = {226592, 226597, 226604, 226529, 226542, 226625, 226616, 226641, 226633}, -- Molten Scaled Belt (Season of Discovery)
    
    [227534] = {226583, 226574, 226561, 226565, 226547, 216923}, -- Incandescent Leggings (Season of Discovery)
    [227763] = {226493, 226490, 226445, 226479, 226651, 226646, 226666, 226671}, -- Scorched Core Leggings (Season of Discovery)
    [227754] = {226594, 226598, 226606, 226532, 226537, 226623, 226614, 226639, 226631}, -- Molten Scaled Leggings (Season of Discovery)
    
    [227536] = {226586, 226571, 226557, 226568, 226554, 216918}, -- Incandescent Boots (Season of Discovery)
    [227765] = {226496, 226487, 226443, 226477, 226652, 226645, 226663, 226673}, -- Scorched Core Boots (Season of Discovery)
    [227757] = {226593, 226601, 226609, 226531, 226538, 226620, 226613, 226636, 226628}, -- Molten Scaled Boots (Season of Discovery)
    
    -- Shadowflame Sword (Season of Discovery)
    [228129] = {228143},
    
    -- Shadowstrike
    [17074] = {17223},
    -- Shadowstrike (Season of Discovery)
    [228272] = {228273, 229381},
    
    -- Eye of Sulfuras
    [17204] = {17182},
    -- Eye of Sulfuras (Season of Discovery)
    [227728] = {227683},
    
    -- The Eye of Divinity
    [18646] = {18608, 18609, 228335, 228336},
    -- Ancient Petrified Leaf
    [18703] = {18714, 18713, 18715, 228334, 228332},
    
    
    -- Ony
    
    -- Can't add mature black dragon sinew because it's a token reward in MC
    -- Head of Onyxia
    [18423]  = UnitFactionGroup("player") == "Alliance" and {18404, 18403, 18406, 228685, 228687, 228686} or nil,
    [18422]  = UnitFactionGroup("player") == "Horde"    and {18404, 18403, 18406, 228685, 228687, 228686} or nil,
    
    
    -- Ony/BWL
    
    -- Sack of Gems
    [11938] = {17962, 17963, 17964, 17965, 17969},
    
    
    -- BWL
    
    -- Head of Nefarian
    [19003] = UnitFactionGroup("player") == "Alliance" and {19383, 19384, 19366, 230840, 230839, 230841} or nil,
    [19002] = UnitFactionGroup("player") == "Horde"    and {19383, 19384, 19366, 230840, 230839, 230841} or nil,
    
    [231711] = {231074, 231092, 231103, 231111, 231167, 231157, 232235, 232243, 232131, 232139, 232171, 232179, }, -- Draconian Hood (Season of Discovery)
    [231719] = {231035, 231027, 231043, 231051, 231249, 231233, 231257, 231241, 232251, 232259, 232187, 232195, 232083, 232091, 232099, 232107, }, -- Primeval Helm (Season of Discovery)
    [231728] = {231194, 231178, 231186, 231059, 231068, 231219, 231203, 231227, 231211, 232155, 232147, 232163, 232115, 232123, 232203, 232211, 232219, 232227, }, -- Ancient Helm (Season of Discovery)
    
    [231709] = {231077, 231096, 231106, 231114, 231170, 231160, 232233, 232241, 232129, 232137, 232169, 232177, }, -- Draconian Shoulderpads (Season of Discovery)
    [231717] = {231033, 231025, 231039, 231047, 231251, 231235, 231259, 231243, 232249, 232257, 232185, 232193, 232081, 232089, 232097, 232105, }, -- Primeval Shoulderpads (Season of Discovery)
    [231726] = {231192, 231176, 231184, 231057, 231066, 231217, 231201, 231225, 231209, 232153, 232145, 232161, 232113, 232121, 232201, 232209, 232217, 232225, }, -- Ancient Shoulderpads (Season of Discovery)
    
    [231714] = {231076, 231095, 231105, 231113, 231169, 231159, 232238, 232246, 232134, 232142, 232174, 232182, }, -- Draconian Robe (Season of Discovery)
    [231723] = {231038, 231030, 231040, 231048, 231246, 231230, 231254, 231238, 232254, 232262, 232190, 232198, 232086, 232094, 232102, 232110, }, -- Primeval Chest (Season of Discovery)
    [231731] = {231197, 231181, 231187, 231062, 231071, 231221, 231205, 231229, 231213, 232158, 232150, 232166, 232118, 232126, 232206, 232214, 232222, 232230, }, -- Ancient Chest (Season of Discovery)
    
    [231707] = {231079, 231098, 231107, 231115, 231172, 231162, 232231, 232239, 232127, 232135, 232167, 232175, }, -- Draconian Bindings (Season of Discovery)
    [231715] = {231031, 231023, 231046, 231054, 231253, 231237, 231261, 231245, 232247, 232255, 232183, 232191, 232079, 232087, 232095, 232103, }, -- Primeval Bindings (Season of Discovery)
    [231724] = {231190, 231174, 231182, 231055, 231063, 231215, 231199, 231223, 231207, 232151, 232143, 232159, 232111, 232119, 232199, 232207, 232215, 232223, }, -- Ancient Bindings (Season of Discovery)
    
    [231712] = {231073, 231091, 231102, 231110, 231166, 231156, 232236, 232244, 232132, 232140, 232172, 232180, }, -- Draconian Gloves (Season of Discovery)
    [231720] = {231036, 231028, 231042, 231050, 231248, 231232, 231256, 231240, 232252, 232260, 232188, 232196, 232084, 232092, 232100, 232108, }, -- Primeval Gloves (Season of Discovery)
    [231729] = {231195, 231179, 231188, 231060, 231069, 231214, 231198, 231222, 231206, 232156, 232148, 232164, 232116, 232124, 232204, 232212, 232220, 232228, }, -- Ancient Gloves (Season of Discovery)
    
    [231708] = {231078, 231097, 231100, 231108, 231171, 231161, 232232, 232240, 232128, 232136, 232168, 232176, }, -- Draconian Belt (Season of Discovery)
    [231716] = {231032, 231024, 231045, 231053, 231252, 231236, 231260, 231244, 232248, 232256, 232184, 232192, 232080, 232088, 232096, 232104, }, -- Primeval Belt (Season of Discovery)
    [231725] = {231191, 231175, 231183, 231056, 231065, 231216, 231200, 231224, 231208, 232152, 232144, 232160, 232120, 232112, 232200, 232208, 232216, 232224, }, -- Ancient Belt (Season of Discovery)
    
    [231710] = {231075, 231093, 231104, 231112, 231168, 231158, 232234, 232242, 232130, 232138, 232170, 232178, }, -- Draconian Leggings (Season of Discovery)
    [231718] = {231034, 231026, 231044, 231052, 231250, 231234, 231258, 231242, 232250, 232258, 232186, 232194, 232082, 232090, 232098, 232106, }, -- Primeval Leggings (Season of Discovery)
    [231727] = {231193, 231177, 231185, 231058, 231067, 231218, 231202, 231226, 231210, 232154, 232146, 232162, 232114, 232122, 232202, 232210, 232218, 232226, }, -- Ancient Leggings (Season of Discovery)
    
    [231713] = {231072, 231090, 231101, 231109, 231165, 231155, 232237, 232245, 232133, 232141, 232173, 232181, }, -- Draconian Boots (Season of Discovery)
    [231721] = {231037, 231029, 231041, 231049, 231247, 231231, 231255, 231239, 232253, 232261, 232189, 232197, 232085, 232093, 232101, 232109, }, -- Primeval Boots (Season of Discovery)
    [231730] = {231196, 231180, 231189, 231061, 231070, 231220, 231204, 231228, 231212, 232157, 232149, 232165, 232117, 232125, 232205, 232213, 232221, 232229, }, -- Ancient Boots (Season of Discovery)
    
    -- class quest gear
    [231722] = {229910},                 -- Depleted Staff of Chaos
    [230904] = {229971, 229972, 229909}, -- Scroll: SEENECS FO RIEF
    [229906] = {231509},                 -- Tarnished Bronze Scale
    [231814] = {224281, 224282},         -- Chromatic Heart
    [229352] = {224122},                 -- Intelligence Findings
    [231882] = {231754, 231755},         -- Suppression Device Receipt
    [231995] = {231890, 224279},         -- Hardened Elementium Slag
    [231452] = {229806, 229749},         -- Blood of the Lightbringer
    [231378] = {224280},                 -- Shimmering Golden Disk
    
    
    -- ZG
    
    -- Heart of Hakkar
    [19802] = {19950, 19949, 19948},
    -- Primal Hakkari Idol
    [22637] = {19789, 19787, 19788, 19784, 19790, 19785, 19786, 19783, 19782},
    -- Primal Hakkari Idol (SoD)
    [231512] = {231376, 231377, 231383, 231367, 231366, 231355, 231354, 231357, 231358, 231370, 231368, 231359, 231384, 231372, 231373, 231371, 231375, 231364, 231363, 231362, 231361, 231379, 231381},
    -- Primal Hakkari Shawl
    [19721] = {19826, 19832, 19845, 231330, 231322, 231325},
    -- Primal Hakkari Aegis
    [19724] = {19831, 19834, 19841, 231321, 231337, 231333},
    -- Primal Hakkari Kossack
    [19723] = {19822, 20034, 20033, 231353, 231327, 231348},
    -- Primal Hakkari Tabard
    [19722] = {19825, 19828, 19838, 231329, 231341, 231317},
    -- Primal Hakkari Armsplint
    [19717] = {19824, 19836, 19830, 231351, 231339, 231343},
    -- Primal Hakkari Bindings
    [19716] = {19827, 19833, 19846, 231331, 231323, 231326},
    -- Primal Hakkari Stanchion
    [19718] = {19843, 19848, 19840, 231335, 231347, 231319},
    -- Primal Hakkari Girdle
    [19719] = {19823, 19835, 19829, 231352, 231338, 231342},
    -- Primal Hakkari Sash
    [19720] = {19842, 19849, 19839, 231334, 231349, 231318},
    
    
    -- AQ20
    
    -- Head of Ossirian the Unscarred
    [21220] = {21504, 21507, 21505, 21506},
    -- Qiraji Martial Drape
    [20885] = {21394, 21406, 21412, 21415},
    -- Qiraji Regal Drape
    [20889] = {21397, 21403, 21400, 21418, 21409},
    -- Qiraji Ceremonial Ring
    [20888] = {21402, 21405, 21411, 21417},
    -- Qiraji Magisterial Ring
    [20884] = {21393, 21396, 21399, 21414, 21408},
    -- Qiraji Ornate Hilt
    [20890] = {21410, 21413, 21416, 21407},
    -- Qiraji Spiked Hilt
    [20886] = {21392, 21395, 21401, 21404, 21398},
    
    
    -- AQ40
    
    -- Eye of C'Thun
    [21221] = {21712, 21710, 21709},
    -- Carapace of the Old God
    [20929] = {21331, 21389, 21370, 21364, 21374},
    -- Husk of the Old God
    [20933] = {21351, 21343, 21334, 21357},
    -- Ouro's Intact Hide
    [20927] = {21332, 21362, 21352, 21346},
    -- Skin of the Great Sandworm
    [20931] = {21390, 21368, 21375, 21336, 21356},
    -- Vek'lor's Diadem
    [20930] = {21387, 21366, 21360, 21372, 21353},
    -- Vek'nilash's Circlet
    [20926] = {21329, 21348, 21347, 21337},
    -- Imperial Qiraji Armaments
    [21232] = {21242, 21244, 21272, 21269},
    -- Imperial Qiraji Regalia
    [21237] = {21268, 21273, 21275},
    -- Qiraji Bindings of Command
    [20928] = {21330, 21333, 21367, 21365, 21361, 21359, 21350, 21349},
    -- Qiraji Bindings of Dominance
    [20932] = {21391, 21388, 21376, 21373, 21345, 21344, 21335, 21338, 21354, 21355},
    
    
    -- Naxx 40
    
    -- The Phylactery of Kel'Thuzad
    [22520] = {23207, 23206},
    -- Desecrated Bindings
    [22369] = {22519, 22503, 22511},
    -- Desecrated Wristguards
    [22362] = {22424, 22443, 22471, 22495},
    -- Desecrated Bracers
    [22355] = {22423, 22483},
    -- Desecrated Gloves
    [22371] = {22517, 22501, 22509},
    -- Desecrated Handguards
    [22364] = {22426, 22441, 22469, 22493},
    -- Desecrated Gauntlets
    [22357] = {22421, 22481},
    -- Desecrated Belt
    [22370] = {22518, 22502, 22510},
    -- Desecrated Girdle
    [22363] = {22431, 22442, 22470, 22494},
    -- Desecrated Waistguard
    [22356] = {22422, 22482},
    -- Desecrated Leggings
    [22366] = {22513, 22497, 22505},
    -- Desecrated Legguards
    [22359] = {22427, 22437, 22465, 22489},
    -- Desecrated Legplates
    [22352] = {22417, 22477},
    -- Desecrated Sandals
    [22372] = {22516, 22500, 22508},
    -- Desecrated Boots
    [22365] = {22430, 22440, 22468, 22492},
    -- Desecrated Sabatons
    [22358] = {22420, 22480},
    -- Desecrated Robe
    [22351] = {22512, 22496, 22504},
    -- Desecrated Tunic
    [22350] = {22425, 22436, 22464, 22488},
    -- Desecrated Breastplate
    [22349] = {22416, 22476},
    -- Desecrated Shoulderpads
    [22368] = {22515, 22499, 22507},
    -- Desecrated Spaulders
    [22361] = {22429, 22439, 22467, 22491},
    -- Desecrated Pauldrons
    [22354] = {22419, 22479},
    -- Desecrated Circlet
    [22367] = {22514, 22498, 22506},
    -- Desecrated Headpiece
    [22360] = {22428, 22438, 22466, 22490},
    -- Desecrated Helmet
    [22353] = {22418, 22478},
    
    
    
    -- Kara
    
    -- Gloves of the Fallen Champion
    [29757] = ConcatenateIf({29065, 29067, 29072, 29048, 29032, 29034, 29039}, EXPANSION_PHASE >= 2.2, {31614, 27703, 27880, 25834, 27470, 31397, 26000}),
    -- Gloves of the Fallen Defender
    [29758] = ConcatenateIf({29017, 29020, 29055, 29057, 29090, 29092, 29097}, EXPANSION_PHASE >= 2.2, {24549, 31409, 27707, 31375, 28136, 28126}),
    -- Gloves of the Fallen Hero
    [29756] = ConcatenateIf({29085, 29080, 28968}, EXPANSION_PHASE >= 2.2, {28335, 25857, 24556, 30188}),
    -- Helm of the Fallen Champion
    [29760] = ConcatenateIf({29061, 29068, 29073, 29044, 29028, 29035, 29040}, EXPANSION_PHASE >= 2.2, {31616, 27704, 27881, 25830, 27471, 31400, 25998}),
    -- Helm of the Fallen Defender
    [29761] = ConcatenateIf({29011, 29021, 29049, 29058, 29086, 29093, 29098}, EXPANSION_PHASE >= 2.2, {24545, 31410, 27708, 31376, 28137, 28127}),
    -- Helm of the Fallen Hero
    [29759] = ConcatenateIf({29081, 29076, 28963}, EXPANSION_PHASE >= 2.2, {28331, 25855, 24553, 30187}),
    
    
    -- Gruul
    
    -- Pauldrons of the Fallen Champion
    [29763] = ConcatenateIf({29064, 29070, 29075, 29047, 29037, 29031, 29043}, EXPANSION_PHASE >= 2.2, {31619, 27706, 27883, 25832, 27473, 31407, 25999}),
    -- Pauldrons of the Fallen Defender
    [29764] = ConcatenateIf({29016, 29023, 29054, 29060, 29100, 29095, 29089}, EXPANSION_PHASE >= 2.2, {24546, 31412, 27710, 31378, 28139, 28129}),
    -- Pauldrons of the Fallen Hero
    [29762] = ConcatenateIf({29084, 29079, 28967}, EXPANSION_PHASE >= 2.2, {28333, 25854, 24554, 30186}),
    -- Leggings of the Fallen Champion
    [29766] = ConcatenateIf({29074, 29063, 29069, 29046, 29030, 29036, 29042}, EXPANSION_PHASE >= 2.2, {31618, 27705, 27882, 25833, 27472, 31406, 26001}),
    -- Leggings of the Fallen Defender
    [29767] = ConcatenateIf({29022, 29015, 29059, 29053, 29094, 29099, 29088}, EXPANSION_PHASE >= 2.2, {24547, 31411, 27709, 31377, 28138, 28128}),
    -- Leggings of the Fallen Hero
    [29765] = ConcatenateIf({29083, 29078, 28966}, EXPANSION_PHASE >= 2.2, {28332, 25858, 24555, 30201}),
    
    
    -- Mag
    
    -- Magtheridon's Head
    [32385] = UnitFactionGroup("player") == "Alliance" and {28791, 28790, 28793, 28792} or nil,
    [32386] = UnitFactionGroup("player") == "Horde"    and {28791, 28790, 28793, 28792} or nil,
    
    -- Chestguard of the Fallen Champion
    [29754] = ConcatenateIf({29071, 29066, 29062, 29045, 29038, 29033, 29029}, EXPANSION_PHASE >= 2.2, {31613, 27702, 27879, 25831, 27469, 31396, 25997}),
    -- Chestguard of the Fallen Defender
    [29753] = ConcatenateIf({29012, 29019, 29050, 29056, 29087, 29091, 29096}, EXPANSION_PHASE >= 2.2, {24544, 31413, 27711, 31379, 28140, 28130}),
    -- Chestguard of the Fallen Hero
    [29755] = ConcatenateIf({29082, 29077, 28964}, EXPANSION_PHASE >= 2.2, {28334, 25856, 24552, 30200}),
    
    
    -- SSC
    
    -- Gloves of the Vanquished Champion
    [30239] = ConcatenateIf({30130, 30135, 30124, 30145, 30189, 30165, 30170}, EXPANSION_PHASE >= 2.3, {32021, 31993, 32040, 31998, 32010, 32030, 32005}),
    -- Gloves of the Vanquished Defender
    [30240] = ConcatenateIf({30114, 30119, 30160, 30151, 30223, 30217, 30232}, EXPANSION_PHASE >= 2.3, {30487, 32015, 32034, 31987, 32056, 31967}),
    -- Gloves of the Vanquished Hero
    [30241] = ConcatenateIf({30140, 30205, 30211}, EXPANSION_PHASE >= 2.3, {31961, 32049, 31973, 31981}),
    -- Leggings of the Vanquished Champion
    [30245] = ConcatenateIf({30132, 30137, 30126, 30148, 30172, 30167, 30192}, EXPANSION_PHASE >= 2.3, {32023, 31995, 32042, 32000, 32012, 32032, 32007}),
    -- Leggings of the Vanquished Defender
    [30246] = ConcatenateIf({30121, 30116, 30153, 30162, 30229, 30220, 30234}, EXPANSION_PHASE >= 2.3, {30489, 32017, 32036, 31989, 32058, 31969}),
    -- Leggings of the Vanquished Hero
    [30247] = ConcatenateIf({30142, 30207, 30213}, EXPANSION_PHASE >= 2.3, {31963, 32051, 31975, 31983}),
    -- Helm of the Vanquished Champion
    [30242] = ConcatenateIf({30125, 30136, 30131, 30146, 30166, 30171, 30190}, EXPANSION_PHASE >= 2.3, {32022, 31997, 32041, 31999, 32011, 32031, 32006}),
    -- Helm of the Vanquished Defender
    [30243] = ConcatenateIf({30120, 30115, 30161, 30152, 30228, 30219, 30233}, EXPANSION_PHASE >= 2.3, {30488, 32016, 32035, 31988, 32057, 31968}),
    -- Helm of the Vanquished Hero
    [30244] = ConcatenateIf({30141, 30206, 30212}, EXPANSION_PHASE >= 2.3, {31962, 32048, 31974, 31980}),
    
    
    -- TK
    
    -- Verdant Sphere
    [32405] = {30018, 30017, 30007, 30015},
    -- Pauldrons of the Vanquished Champion
    [30248] = ConcatenateIf({30127, 30133, 30138, 30149, 30168, 30173, 30194}, EXPANSION_PHASE >= 2.3, {32024, 31996, 32043, 32001, 32013, 32033, 32008}),
    -- Pauldrons of the Vanquished Defender
    [30249] = ConcatenateIf({30117, 30122, 30154, 30163, 30221, 30230, 30235}, EXPANSION_PHASE >= 2.3, {30490, 32018, 32037, 31990, 32059, 31971}),
    -- Pauldrons of the Vanquished Hero
    [30250] = ConcatenateIf({30143, 30210, 30215}, EXPANSION_PHASE >= 2.3, {31964, 32047, 31976, 31979}),
    -- Chestguard of the Vanquished Champion
    [30236] = ConcatenateIf({30123, 30129, 30134, 30144, 30164, 30169, 30185}, EXPANSION_PHASE >= 2.3, {32020, 31992, 32039, 32002, 32009, 32029, 32004}),
    -- Chestguard of the Vanquished Defender
    [30237] = ConcatenateIf({30113, 30118, 30150, 30159, 30216, 30222, 30231}, EXPANSION_PHASE >= 2.3, {30486, 32019, 32038, 31991, 32060, 31972}),
    -- Chestguard of the Vanquished Hero
    [30238] = ConcatenateIf({30139, 30196, 30214}, EXPANSION_PHASE >= 2.3, {31960, 32050, 31977, 31982}),
    
    
    -- Hyjal
    
    -- Gloves of the Forgotten Conqueror
    [31092] = ConcatenateIf({30982, 30983, 30985, 31060, 31061, 31050}, EXPANSION_PHASE >= 2.5, {33723, 33696, 33750, 33717, 33744, 33676, 33684}),
    -- Gloves of the Forgotten Protector
    [31094] = ConcatenateIf({30969, 30970, 31001, 31007, 31008, 31011}, EXPANSION_PHASE >= 2.5, {33729, 33665, 33712, 33739, 33707}),
    -- Gloves of the Forgotten Vanquisher
    [31093] = ConcatenateIf({31026, 31055, 31032, 31034, 31035}, EXPANSION_PHASE >= 2.5, {33700, 33759, 33690, 33767, 33671}),
    -- Helm of the Forgotten Conqueror
    [31097] = ConcatenateIf({30987, 30988, 30989, 31063, 31064, 31051}, EXPANSION_PHASE >= 2.5, {33724, 33697, 33751, 33718, 33745, 33677, 33683}),
    -- Helm of the Forgotten Protector
    [31095] = ConcatenateIf({30972, 30974, 31003, 31012, 31014, 31015}, EXPANSION_PHASE >= 2.5, {33730, 33666, 33713, 33740, 33708}),
    -- Helm of the Forgotten Vanquisher
    [31096] = ConcatenateIf({31027, 31056, 31037, 31040, 31039}, EXPANSION_PHASE >= 2.5, {33701, 33758, 33691, 33768, 33672}),
    
    
    -- BT
    
    -- Pauldrons of the Forgotten Conqueror
    [31101] = ConcatenateIf({30996, 30997, 30998, 31069, 31070, 31054}, EXPANSION_PHASE >= 2.5, {33726, 33699, 33753, 33720, 33747, 33679, 33682}),
    -- Pauldrons of the Forgotten Protector
    [31103] = ConcatenateIf({30979, 30980, 31006, 31022, 31023, 31024}, EXPANSION_PHASE >= 2.5, {33732, 33668, 33715, 33742, 33710}),
    -- Pauldrons of the Forgotten Vanquisher
    [31102] = ConcatenateIf({31030, 31059, 31047, 31048, 31049}, EXPANSION_PHASE >= 2.5, {33703, 33757, 33693, 33770, 33674}),
    -- Leggings of the Forgotten Conqueror
    [31098] = ConcatenateIf({30993, 30994, 30995, 31067, 31068, 31053}, EXPANSION_PHASE >= 2.5, {33725, 33698, 33752, 33719, 33746, 33678, 33686}),
    -- Leggings of the Forgotten Protector
    [31100] = ConcatenateIf({30977, 30978, 31005, 31019, 31020, 31021}, EXPANSION_PHASE >= 2.5, {33731, 33667, 33714, 33741, 33709}),
    -- Leggings of the Forgotten Vanquisher
    [31099] = ConcatenateIf({31029, 31058, 31044, 31045, 31046}, EXPANSION_PHASE >= 2.5, {33702, 33761, 33692, 33769, 33673}),
    -- Chestguard of the Forgotten Conqueror
    [31089] = ConcatenateIf({30990, 30991, 30992, 31065, 31066, 31052}, EXPANSION_PHASE >= 2.5, {33722, 33695, 33749, 33721, 33748, 33680, 33685}),
    -- Chestguard of the Forgotten Protector
    [31091] = ConcatenateIf({30975, 30976, 31004, 31016, 31017, 31018}, EXPANSION_PHASE >= 2.5, {33664, 33711, 33738, 33706}),
    -- Chestguard of the Forgotten Vanquisher
    [31090] = ConcatenateIf({31028, 31057, 31041, 31042, 31043}, EXPANSION_PHASE >= 2.5, {33704, 33760, 33694, 33771, 33675}),
    
    
    -- ZA
    
    [33865] = {33993}, -- Mojo
    
    
    -- SWP
    
    -- Bracers of the Forgotten Conqueror
    [34848] = {34431, 34432, 34433, 34434, 34435, 34436},
    -- Bracers of the Forgotten Protector
    [34851] = {34441, 34442, 34443, 34437, 34438, 34439},
    -- Bracers of the Forgotten Vanquisher
    [34852] = {34448, 34447, 34444, 34445, 34446},
    -- Belt of the Forgotten Conqueror
    [34853] = {34485, 34487, 34488, 34527, 34528, 34541},
    -- Belt of the Forgotten Protector
    [34854] = {34546, 34547, 34549, 34542, 34543, 34545},
    -- Belt of the Forgotten Vanquisher
    [34855] = {34558, 34557, 34554, 34555, 34556},
    -- Boots of the Forgotten Conqueror
    [34856] = {34559, 34560, 34561, 34562, 34563, 34564},
    -- Boots of the Forgotten Protector
    [34857] = {34568, 34569, 34570, 34565, 34566, 34567},
    -- Boots of the Forgotten Vanquisher
    [34858] = {34575, 34574, 34571, 34572, 34573},
    
    -- Cloth Sunmote Exchanges
    [34339] = {34405}, -- Helm of Arcane Purity
    [34202] = {34393}, -- Shoulderpads of Knowledge's Pursuit
    [34233] = {34399}, -- Robes of Ghostly Hatred
    [34342] = {34406}, -- Gloves of Tyri's Power
    [34170] = {34386}, -- Pantaloons of Growing Strife
    
    -- Leather Sunmote Exchanges
    [34245] = {34403}, -- Cover of Ursoc the Mighty
    [34209] = {34391}, -- Spaulders of Devastation
    [34212] = {34398}, -- Utopian Tunic of Elune
    [34351] = {34407}, -- Tranquil Moonlight Wraps
    [34169] = {34384}, -- Breeches of Natural Splendor
    [34244] = {34404}, -- Mask of the Fury Hunter
    [34211] = {34397}, -- Bladed Chaos Tunic
    [34195] = {34392}, -- Demontooth Shoulderpads
    [34234] = {34408}, -- Gloves of the Forest Drifter
    [34188] = {34385}, -- Leggings of the Immortal Beast
    
    -- Mail Sunmote Exchanges
    [34332] = {34402}, -- Shroud of Chieftain Ner'zhul
    [34229] = {34396}, -- Garments of Crashing Shores
    [34208] = {34390}, -- Erupting Epaulets
    [34350] = {34409}, -- Gauntlets of the Ancient Frostwolf
    [34186] = {34383}, -- Kilt of Spiritual Reconstruction
    
    -- Plate Sunmote Exchanges
    [34243] = {34401}, -- Helm of Uther's Resolve
    [34193] = {34389}, -- Spaulders of the Thalassian Defender
    [34216] = {34395}, -- Noble Judicator's Chestguard
    [34167] = {34382}, -- Judicator's Legguards
    [34345] = {34400}, -- Crown of Dath'Remar
    [34192] = {34388}, -- Pauldrons of Berserking
    [34215] = {34394}, -- Breastplate of Agony's Aversion
    [34180] = {34381}, -- Felstrength Legplates
    
    
    -- Naxx 10
    
    -- Key to the Focusing Iris
    [44569] = {44658, 44657, 44659, 44660},
    
    -- Spaulders of the Lost Conqueror
    [40622] = {39631, 39637, 39642, 39518, 39529, 39499},
    -- Spaulders of the Lost Protector
    [40623] = {39608, 39613, 39581, 39590, 39596, 39604},
    -- Spaulders of the Lost Vanquisher
    [40624] = {39565, 39621, 39627, 39494, 39542, 39548, 39556},
    -- Chestguard of the Lost Conqueror
    [40610] = {39629, 39633, 39638, 39515, 39523, 39497},
    -- Chestguard of the Lost Protector
    [40611] = {39606, 39611, 39579, 39588, 39592, 39597},
    -- Chestguard of the Lost Vanquisher
    [40612] = {39558, 39617, 39623, 39492, 39538, 39547, 39554},
    -- Leggings of the Lost Conqueror
    [40619] = {39630, 39636, 39641, 39517, 39528, 39498},
    -- Leggings of the Lost Protector
    [40620] = {39607, 39612, 39580, 39589, 39595, 39603},
    -- Leggings of the Lost Vanquisher
    [40621] = {39564, 39620, 39626, 39493, 39539, 39546, 39555},
    -- Helm of the Lost Conqueror
    [40616] = {39628, 39635, 39640, 39514, 39521, 39496},
    -- Helm of the Lost Protector
    [40617] = {39605, 39610, 39578, 39583, 39594, 39602},
    -- Helm of the Lost Vanquisher
    [40618] = {39561, 39619, 39625, 39491, 39531, 39545, 39553},
    
    
    -- Naxx 25
    
    -- Heroic Key to the Focusing Iris
    [44577] = {44661, 44662, 44664, 44665},
    
    -- Mantle of the Lost Conqueror
    [40637] = {40573, 40578, 40584, 40450, 40459, 40424},
    -- Mantle of the Lost Protector
    [40638] = {40530, 40548, 40507, 40513, 40518, 40524},
    -- Mantle of the Lost Vanquisher
    [40639] = {40502, 40557, 40568, 40419, 40465, 40470, 40494},
    -- Breastplate of the Lost Conqueror
    [40625] = {40569, 40574, 40579, 40449, 40458, 40423},
    -- Breastplate of the Lost Protector
    [40626] = {40525, 40544, 40503, 40508, 40514, 40523},
    -- Breastplate of the Lost Vanquisher
    [40627] = {40495, 40550, 40559, 40418, 40463, 40469, 40471},
    -- Legplates of the Lost Conqueror
    [40634] = {40572, 40577, 40583, 40448, 40457, 40422},
    -- Legplates of the Lost Protector
    [40635] = {40529, 40547, 40506, 40512, 40517, 40522},
    -- Legplates of the Lost Vanquisher
    [40636] = {40500, 40556, 40567, 40417, 40462, 40468, 40493},
    -- Crown of the Lost Conqueror
    [40631] = {40571, 40576, 40581, 40447, 40456, 40421},
    -- Valorous Dreadnaught Helmet
    [40528] = {40546, 40505, 40510, 40516, 40521},
    -- Crown of the Lost Vanquisher
    [40633] = {40499, 40554, 40565, 40416, 40461, 40467, 40473},
    
    
    -- OS 10
    
    -- Gloves of the Lost Conqueror
    [40613] = {39632, 39634, 39639, 39519, 39530, 39500},
    -- Gloves of the Lost Protector
    [40614] = {39609, 39622, 39582, 39591, 39593, 39601},
    -- Gloves of the Lost Vanquisher
    [40615] = {39560, 39618, 39624, 39495, 39543, 39544, 39557},
    
    
    -- OS 25
    
    -- Gauntlets of the Lost Conqueror
    [40628] = {40570, 40575, 40580, 40445, 40454, 40420},
    -- Gauntlets of the Lost Protector
    [40629] = {40527, 40545, 40504, 40509, 40515, 40520},
    -- Gauntlets of the Lost Vanquisher
    [40630] = {40496, 40552, 40563, 40415, 40460, 40466, 40472},
    
    
    -- Ulduar 10
    
    -- Reply-Code Alpha
    [46052] = {46320, 46321, 46322, 46323},
    -- Leggings of the Wayward Conqueror
    [45650] = {45371, 45379, 45384, 45388, 45394, 45420},
    -- Leggings of the Wayward Protector
    [45651] = {45427, 45432, 45362, 45403, 45409, 45416},
    -- Leggings of the Wayward Vanquisher
    [45652] = {45399, 45338, 45343, 45367, 45347, 45353, 45357},
    -- Spaulders of the Wayward Conqueror
    [45659] = {45373, 45380, 45385, 45390, 45393, 45422},
    -- Spaulders of the Wayward Protector
    [45660] = {45428, 45433, 45363, 45404, 45410, 45415},
    -- Spaulders of the Wayward Vanquisher
    [45661] = {45400, 45339, 45344, 45369, 45349, 45352, 45359},
    -- Gloves of the Wayward Conqueror
    [45644] = {45370, 45376, 45383, 45387, 45392, 45419},
    -- Gloves of the Wayward Protector
    [45645] = {45426, 45430, 45360, 45401, 45406, 45414},
    -- Gloves of the Wayward Vanquisher
    [45646] = {45397, 45337, 45341, 46131, 45345, 45351, 45355},
    -- Helm of the Wayward Conqueror
    [45647] = {45372, 45377, 45382, 45386, 45391, 45417},
    -- Helm of the Wayward Protector
    [45648] = {45425, 45431, 45361, 45402, 45408, 45412},
    -- Helm of the Wayward Vanquisher
    [45649] = {45398, 45336, 45342, 45365, 45346, 45356, 46313},
    -- Chestguard of the Wayward Conqueror
    [45635] = {45374, 45375, 45381, 45389, 45395, 45421},
    -- Chestguard of the Wayward Protector
    [45636] = {45424, 45429, 45364, 45405, 45411, 45413},
    -- Chestguard of the Wayward Vanquisher
    [45637] = {45396, 45335, 45340, 45368, 45348, 45354, 45358},
    
    
    -- Ulduar 25
    
    -- Fragment of Val'anyr
    [45038] = {45039, 45896, 46017},
    -- Reply-Code Alpha
    [46053] = {45588, 45618, 45608, 45614},
    -- Breastplate of the Wayward Conqueror
    [45632] = {46154, 46173, 46178, 46168, 46193, 46137},
    -- Breastplate of the Wayward Protector
    [45633] = {46146, 46162, 46141, 46198, 46205, 46206},
    -- Breastplate of the Wayward Vanquisher
    [45634] = {46123, 46111, 46118, 46130, 46159, 46186, 46194},
    -- Crown of the Wayward Conqueror
    [45638] = {46156, 46175, 46180, 46172, 46197, 46140},
    -- Crown of the Wayward Protector
    [45639] = {46151, 46166, 46143, 46201, 46209, 46212},
    -- Crown of the Wayward Vanquisher
    [45640] = {46125, 46115, 46120, 46129, 46161, 46184, 46191},
    -- Legplates of the Wayward Conqueror
    [45653] = {46153, 46176, 46181, 46170, 46195, 46139},
    -- Legplates of the Wayward Protector
    [45654] = {46150, 46169, 46144, 46202, 46208, 46210},
    -- Legplates of the Wayward Vanquisher
    [45655] = {46126, 46116, 46121, 46133, 46160, 46185, 46192},
    -- Gauntlets of the Wayward Conqueror
    [45641] = {46155, 46174, 46179, 46163, 46188, 46135},
    -- Gauntlets of the Wayward Protector
    [45642] = {46148, 46164, 46142, 46199, 46200, 46207},
    -- Gauntlets of the Wayward Vanquisher
    [45643] = {46124, 46113, 46119, 46132, 46158, 46183, 46189},
    -- Mantle of the Wayward Conqueror
    [45656] = {46152, 46177, 46182, 46165, 46190, 46136},
    -- Mantle of the Wayward Protector
    [45657] = {46149, 46167, 46145, 46203, 46204, 46211},
    -- Mantle of the Wayward Vanquisher
    [45658] = {46127, 46117, 46122, 46134, 46157, 46187, 46196},
    
    
    -- ToC 10/25
    
    -- Trophy of the Crusade
    [47242] = {
        -- Alliance
        47778, 47781, 47779, 47782, 47780,
        47984, 47987, 47986, 47983, 47985, 48078, 48081, 48080, 48077, 48079,
        48225, 48227, 48223, 48224, 48226,
        48257, 48259, 48255, 48256, 48258,
        48430, 48454, 48450, 48452, 48446, 48378, 48380, 48376, 48377, 48379,
        48540, 48542, 48538, 48539, 48541, 48483, 48485, 48481, 48482, 48484,
        47754, 47757, 47756, 47753, 47755,
        48134, 48137, 48136, 48133, 48135, 48164, 48167, 48166, 48163, 48165, 48211, 48208, 48209, 48212, 48210,
        48287, 48289, 48285, 48286, 48288, 48318, 48320, 48316, 48317, 48319, 48348, 48350, 48346, 48347, 48349,
        48577, 48579, 48575, 48576, 48578, 48639, 48637, 48641, 48640, 48638, 48609, 48611, 48607, 48608, 48610,
        
        -- Horde
        47804, 47807, 47806, 47803, 47805,
        48065, 48062, 48063, 48066, 48064, 48095, 48092, 48093, 48096, 48094,
        48240, 48238, 48242, 48241, 48239,
        48272, 48270, 48274, 48273, 48271,
        48463, 48465, 48461, 48462, 48464, 48393, 48395, 48391, 48392, 48394,
        48555, 48553, 48557, 48556, 48554, 48498, 48496, 48500, 48499, 48497,
        47771, 47768, 47769, 47772, 47770,
        48151, 48148, 48149, 48152, 48150, 48181, 48178, 48179, 48182, 48180, 48194, 48197, 48196, 48193, 48195,
        48302, 48304, 48300, 48301, 48303, 48333, 48331, 48335, 48334, 48332, 48363, 48361, 48365, 48364, 48362,
        48592, 48590, 48594, 48593, 48591, 48659, 48661, 48657, 48658, 48660, 48624, 48622, 48626, 48625, 48623,
    },
    
    -- Regalia of the Grand Conqueror
    [47557] = {
        -- Alliance
        47789, 47792, 47791, 47788, 47790,
        48035, 48029, 48031, 48037, 48033, 48085, 48082, 48083, 48086, 48084,
        48582, 48580, 48584, 48583, 48581, 48644, 48646, 48642, 48643, 48645, 48614, 48612, 48616, 48615, 48613,
        
        -- Horde
        47796, 47793, 47794, 47797, 47795,
        48058, 48061, 48060, 48057, 48059, 48088, 48091, 48090, 48087, 48089,
        48587, 48585, 48589, 48588, 48586, 48649, 48647, 48651, 48650, 48648, 48619, 48621, 48617, 48618, 48620,
    },
    
    -- Regalia of the Grand Protector
    [47558] = {
        -- Alliance
        48262, 48260, 48264, 48263, 48261,
        48433, 48455, 48451, 48453, 48447, 48383, 48381, 48385, 48384, 48382,
        48292, 48290, 48294, 48293, 48291, 48323, 48321, 48325, 48324, 48322, 48353, 48351, 48355, 48354, 48352,
        
        -- Horde
        48267, 48269, 48265, 48266, 48268,
        48468, 48470, 48466, 48467, 48469, 48398, 48400, 48396, 48397, 48399,
        48307, 48309, 48305, 48306, 48308, 48328, 48330, 48326, 48327, 48329, 48358, 48360, 48356, 48357, 48359,
    },
    
    -- Regalia of the Grand Vanquisher
    [47559] = {
        -- Alliance
        48230, 48228, 48232, 48231, 48229,
        48545, 48543, 48547, 48546, 48544, 48488, 48486, 48490, 48489, 48487,
        47761, 47758, 47759, 47762, 47760,
        48141, 48138, 48139, 48142, 48140, 48171, 48168, 48169, 48172, 48170, 48204, 48207, 48206, 48203, 48205,
        
        -- Horde
        48235, 48237, 48233, 48234, 48236,
        48550, 48552, 48548, 48549, 48551, 48493, 48495, 48491, 48492, 48494,
        47764, 47767, 47766, 47763, 47765,
        48144, 48147, 48146, 48143, 48145, 48174, 48177, 48176, 48173, 48175, 48201, 48198, 48199, 48202, 48200,
    },
    
    
    -- Onyxia 10/25
    
    [49644] = {49485, 49486, 49487}, -- Head of Onyxia
    
    [49294] = {36919, 36922, 36931, 36928, 36934, 36925}, -- Ashen Sack of Gems
    
    
    -- ICC 10/25
    
    -- Conqueror's Mark of Sanctification (Normal)
    [52027] = {
        51208, 51205, 51206, 51209, 51207,
        51178, 51175, 51176, 51179, 51177, 51184, 51182, 51180, 51183, 51181,
        51167, 51166, 51165, 51169, 51168, 51173, 51170, 51174, 51172, 51171, 51162, 51160, 51164, 51163, 51161,
    },
    
    -- Protector's Mark of Sanctification (Normal)
    [52026] = {
        51153, 51151, 51150, 51154, 51152,
        51218, 51215, 51219, 51217, 51216, 51212, 51210, 51214, 51213, 51211,
        51192, 51194, 51190, 51191, 51193, 51202, 51204, 51200, 51201, 51203, 51197, 51199, 51195, 51196, 51198,
    },
    
    -- Vanquisher's Mark of Sanctification (Normal)
    [52025] = {
        51187, 51185, 51189, 51188, 51186,
        51133, 51130, 51134, 51132, 51131, 51127, 51125, 51129, 51128, 51126,
        51158, 51155, 51156, 51159, 51157,
        51137, 51135, 51139, 51138, 51136, 51149, 51147, 51145, 51148, 51146, 51143, 51140, 51141, 51144, 51142,
    },
    
    
    -- Conqueror's Mark of Sanctification (Heroic)
    [52030] = {
        51231, 51234, 51233, 51230, 51232,
        51261, 51264, 51263, 51260, 51262, 51255, 51257, 51259, 51256, 51258,
        51272, 51273, 51274, 51270, 51271, 51266, 51269, 51265, 51267, 51268, 51277, 51279, 51275, 51276, 51278,
    },
    
    -- Protector's Mark of Sanctification (Heroic)
    [52029] = {
        51286, 51288, 51289, 51285, 51287,
        51221, 51224, 51220, 51222, 51223, 51227, 51229, 51225, 51226, 51228,
        51247, 51245, 51249, 51248, 51246, 51237, 51235, 51239, 51238, 51236, 51242, 51240, 51244, 51243, 51241,
    },
    
    -- Vanquisher's Mark of Sanctification (Heroic)
    [52028] = {
        51252, 51254, 51250, 51251, 51253,
        51306, 51309, 51305, 51307, 51308, 51312, 51314, 51310, 51311, 51313,
        51281, 51284, 51283, 51280, 51282,
        51302, 51304, 51300, 51301, 51303, 51290, 51292, 51294, 51291, 51293, 51296, 51299, 51298, 51295, 51297,
    },
    
    
    -- T11
    
    -- Gauntlets of the Forlorn Conqueror
    [67429] = {65259, 65234, 65229, 65220, 65225, 65215},
    -- Gauntlets of the Forlorn Protector
    [67430] = {65255, 65245, 65250, 65205, 65265, 65270},
    -- Gauntlets of the Forlorn Vanquisher
    [67431] = {65209, 65199, 65194, 65189, 65240, 65180, 65185},
    -- Leggings of the Forlorn Conqueror
    [67428] = {65261, 65236, 65231, 65222, 65217, 65227},
    -- Leggings of the Forlorn Protector
    [67427] = {65257, 65247, 65252, 65207, 65267, 65272},
    -- Leggings of the Forlorn Vanquisher
    [67426] = {65211, 65201, 65196, 65191, 65242, 65182, 65187},
    -- Crown of the Forlorn Conqueror (+Helm of the Forlorn Conqueror)
    [65001] = {60249, 60256, 60258, 60359, 60346, 60356, 65260, 65235, 65230, 65221, 65216, 65226},
    -- Crown of the Forlorn Protector (+Helm of the Forlorn Protector)
    [65000] = {60315, 60308, 60320, 60303, 60325, 60328, 65256, 65246, 65251, 65206, 65266, 65271},
    -- Crown of the Forlorn Vanquisher (+Helm of the Forlorn Vanquisher)
    [65002] = {60243, 60282, 60277, 60286, 60299, 60341, 60351, 65210, 65200, 65195, 65190, 65241, 65181, 65186},
    -- Chest of the Forlorn Conqueror
    [67423] = {65262, 65237, 65232, 65219, 65214, 65224},
    -- Chest of the Forlorn Protector
    [67424] = {65254, 65244, 65249, 65204, 65264, 65269},
    -- Chest of the Forlorn Vanquisher
    [67425] = {65212, 65202, 65197, 65192, 65239, 65179, 65184},
    -- Shoulders of the Forlorn Conqueror (+Mantle of the Forlorn Conqueror)
    [65088] = {60252, 60253, 60262, 60362, 60348, 60358, 65263, 65238, 65233, 65223, 65218, 65228},
    -- Shoulders of the Forlorn Protector (+Mantle of the Forlorn Protector)
    [65087] = {60317, 60322, 60311, 60306, 60327, 60331, 65258, 65248, 65253, 65208, 65268, 65273},
    -- Shoulders of the Forlorn Vanquisher (+Mantle of the Forlorn Vanquisher)
    [65089] = {60246, 60284, 60279, 60289, 60302, 60343, 60353, 65213, 65203, 65198, 65193, 65243, 65183, 65188},
};

for token, rewards in pairs(tokenMap) do
    if LootReserve.Data.TokenMap.Rewards[token] then
        geterrorhandler()("[LootReserve] Duplicate token detected: " .. token);
    end
    LootReserve.Data.TokenMap.Rewards[token] = rewards;
    
    for _, reward in ipairs(rewards) do
        if LootReserve.Data.TokenMap.Tokens[reward] then
            geterrorhandler()("[LootReserve] Duplicate reward detected: " .. reward);
        end
        LootReserve.Data.TokenMap.Tokens[reward] = token;
    end
end


local heroicMirrors = {
    -- Season of Discovery
    
    -- Molten
    [228508] = 228128, -- Hammer of The Black Anvil
    [229374] = 228139, -- Fist of the Firesworn
    [229378] = 228145, -- Magmadar's Right Claw
    [229377] = 228146, -- Magmadar's Left Claw
    [229373] = 228160, -- Faithbringer
    [228459] = 228229, -- Obsidian Edged Blade
    [228463] = 228248, -- Earthshaker
    [228519] = 228252, -- Striker's Mark
    [229376] = 228263, -- Sorcerous Dagger
    [228462] = 228264, -- Aurastone Hammer
    [228506] = 228265, -- Brutality Blade
    [228702] = 228266, -- Drillborer Disk
    [229372] = 228267, -- Gutgore Ripper
    [228517] = 228269, -- Azuresong Mageblade
    [228922] = 228271, -- Staff of Dominance
    [229380] = 228272, -- Shadowstrike
    [228701] = 228277, -- Core Hound Tooth
    [229382] = 228278, -- Hyperthermically Insulated Lava Dredger
    [228461] = 228288, -- Bonereaver's Edge
    [228511] = 228296, -- Perdition's Blade
    [228460] = 228299, -- Spinal Reaper
    [229379] = 228350, -- Eskhandar's Right Claw
    
    -- Shadowflame
    [232566] = 230242, -- The Untamed Blade
    [232567] = 230241, -- Spineshatter
    [232565] = 230247, -- Dragonfang Blade
    [232557] = 230794, -- Claw of Chromaggus
    [232564] = 230254, -- Maladath, Runed Blade of the Black Flight
    [232558] = 230747, -- Chromatically Tempered Sword
    [232562] = 230271, -- Drake Talon Cleaver
    [232563] = 230270, -- Shadow Wing Focus Staff
    [232556] = 230813, -- Staff of the Shadow Flame
    [232559] = 230738, -- Herald of Woe
    [232551] = 230844, -- Draconic Maul
    [232552] = 230838, -- Lok'amir il Romathis
    [232555] = 230837, -- Crul'shorukh, Edge of Chaos
    [232550] = 230818, -- Ashkandi, Greatsword of the Brotherhood
    [232561] = 230276, -- Claw of the Black Drake
    
    -- Bloodied
    [231856] = 231293, -- Ancient Hakkari Manslayer
    [231852] = 231302, -- Gurubashi Dwarf Destroyer
    [231854] = 231315, -- Zin'rokh, Destroyer of Worlds
    [231855] = 231301, -- Fang of the Faceless
    [231857] = 231308, -- Touch of Chaos
    [231858] = 231296, -- Bloodcaller
    [231853] = 231309, -- Warblade of the Hakkari
    [231869] = 230992, -- Warblade of the Hakkari
    [231867] = 230989, -- Bloodlord's Defender
    [231870] = 230991, -- Halberd of Smiting
    [231860] = 231004, -- Jin'do's Judgement
    [231859] = 231002, -- Jin'do's Hexxer
    [231875] = 230925, -- Thekal's Grasp
    [231873] = 230868, -- Zulian Stone Axe
    [231876] = 230930, -- Zulian Slicer
    [231874] = 230865, -- Fang of Venoxis
    [231850] = 230939, -- Will of Arlokk
    [231851] = 230934, -- Arlokk's Grasp
    [231861] = 230911, -- Jeklik's Crusher
    [231866] = 230918, -- Mar'li's Touch
    [231848] = 231016, -- Nat Pagle's Fish Terminator
    [231849] = 231272, -- Tigule's Harpoon
    [231847] = 231274, -- Gri'lek's Grinder
    [231846] = 231273, -- Gri'lek's Carver
    [231863] = 231276, -- Thoughtblighter
    [231862] = 231275, -- Blazefury Retributer
    [231864] = 231277, -- Pitchfork of Madness
    [232310] = 232309, -- Renataki's Soul Conduit
    [231871] = 231279, -- Wushoolay's Poker
    [231872] = 231278, -- Hoodoo Hunting Bow
    [231868] = 230993, -- Mandokir's Sting
    [231865] = 230863, -- Zulian Scepter of Rites
    
    
    -- ToC 10 Alliance
    [47617] = 47921, -- Icehowl Cinch
    [47613] = 47923, -- Shoulderpads of the Glacial Wilds
    [47608] = 47919, -- Acidmaw Boots
    [47616] = 47926, -- Shoulderguards of the Spirit Walker
    [47610] = 47916, -- Armbands of the Northern Stalker
    [47611] = 47918, -- Dreadscale Armguards
    [47609] = 47917, -- Gauntlets of Rising Anger
    [47615] = 47924, -- Belt of the Frozen Reach
    [47614] = 47925, -- Girdle of the Impaler
    [47607] = 47915, -- Collar of Ceaseless Torment
    [47578] = 47920, -- Carnivorous Band
    [47612] = 47922, -- Rod of Imprisoned Souls
    [47663] = 47927, -- Felspark Bindings
    [47620] = 47931, -- Leggings of the Demonic Messenger
    [47669] = 47929, -- Belt of the Winter Solstice
    [47621] = 47932, -- Girdle of the Farseer
    [49235] = 49238, -- Boots of Tortured Space
    [47683] = 47933, -- Sentinel Scouting Greaves
    [47680] = 47935, -- Armguards of the Nether Lord
    [47711] = 47937, -- Girdle of the Nether Champion
    [47619] = 47930, -- Amulet of Binding Elements
    [47679] = 47939, -- Endurance of the Infernal
    [47618] = 47928, -- Firestorm Ring
    [47703] = 47934, -- Planestalker Signet
    [47676] = 47938, -- Dirk of the Night Watch
    [47721] = 47940, -- Sandals of the Silver Magus
    [47719] = 47945, -- Gloves of the Silver Assassin
    [47718] = 47942, -- Helm of the Silver Ranger
    [47717] = 47943, -- Faceplate of the Silver Champion
    [47720] = 47944, -- Pauldrons of the Silver Defender
    [47728] = 47947, -- Binding Light
    [47727] = 47949, -- Fervor of the Frostborn
    [47726] = 47946, -- Talisman of Volatile Power
    [47725] = 47948, -- Victor's Call
    [47724] = 47941, -- Blade of the Silver Disciple
    [47745] = 47956, -- Gloves of Looming Shadow
    [49231] = 49234, -- Boots of the Grieving Soul
    [47746] = 47959, -- Helm of the Snowy Grotto
    [47739] = 47954, -- Armor of Shifting Shadows
    [47744] = 47961, -- Gloves of the Azure Prophet
    [47738] = 47952, -- Sabatons of the Lingering Vortex
    [47747] = 47957, -- Darkbane Pendant
    [47700] = 47955, -- Loop of the Twin Val'kyr
    [47742] = 47958, -- Chalice of Benedictus
    [47736] = 47953, -- Icefall Blade
    [47737] = 47951, -- Reckoning
    [47743] = 47960, -- Enlightenment
    [47740] = 47950, -- The Diplomat
    [47838] = 47974, -- Vestments of the Sleepless
    [47837] = 47977, -- Cinch of the Undying
    [47832] = 47972, -- Spaulders of the Snow Bandit
    [47813] = 47965, -- Helmet of the Crypt Lord
    [47829] = 47969, -- Pauldrons of the Timeless Hunter
    [47811] = 47964, -- Chestguard of the Warden
    [47836] = 47976, -- Legplates of the Immortal Spider
    [47830] = 47970, -- Legplates of the Silver Hand
    [47810] = 47967, -- Crusader's Glory
    [47814] = 47971, -- Westfall Saber
    [47808] = 47966, -- The Lion's Maw
    [47809] = 47962, -- Argent Resolve
    [47816] = 47973, -- The Grinder
    [47834] = 47979, -- Fordragon Blades
    [47815] = 47968, -- Cold Convergence
    [47835] = 47978, -- Bulwark of the Royal Guard
    [47812] = 47963, -- Vigilant Ward
    [47741] = 47975, -- Baelgun's Heavy Crossbow
    
    -- ToC 10 Horde
    [47855] = 47994, -- Icehowl Binding
    [47857] = 47996, -- Pauldrons of the Glacial Wilds
    [47853] = 47992, -- Acidmaw Treads
    [47860] = 47999, -- Pauldrons of the Spirit Walker
    [47850] = 47989, -- Bracers of the Northern Stalker
    [47852] = 47991, -- Dreadscale Bracers
    [47851] = 47990, -- Gauntlets of Mounting Anger
    [47859] = 47998, -- Belt of the Impaler
    [47858] = 47997, -- Girdle of the Frozen Reach
    [47849] = 47988, -- Collar of Unending Torment
    [47854] = 47993, -- Gormok's Band
    [47856] = 47995, -- Scepter of Imprisoned Souls
    [47861] = 48000, -- Felspark Bracers
    [47865] = 48004, -- Legwraps of the Demonic Messenger
    [47863] = 48002, -- Belt of the Bloodhoof Emissary
    [47866] = 48005, -- Darkspear Ritual Binding
    [49236] = 49237, -- Sabatons of Tortured Space
    [47867] = 48006, -- Warsong Poacher's Greaves
    [47869] = 48008, -- Armplates of the Nether Lord
    [47870] = 48009, -- Belt of the Nether Champion
    [47872] = 48011, -- Fortitude of the Infernal
    [47864] = 48003, -- Pendant of Binding Elements
    [47862] = 48001, -- Firestorm Band
    [47868] = 48007, -- Planestalker Band
    [47871] = 48010, -- Orcish Deathblade
    [47873] = 48012, -- Sunreaver Magus' Sandals
    [47878] = 48017, -- Sunreaver Assassin's Gloves
    [47875] = 48014, -- Sunreaver Ranger's Helm
    [47876] = 48015, -- Sunreaver Champion's Faceplate
    [47877] = 48016, -- Sunreaver Defender's Pauldrons
    [47880] = 48019, -- Binding Stone
    [47882] = 48021, -- Eitrigg's Oath
    [47879] = 48018, -- Fetish of Volatile Power
    [47881] = 48020, -- Vengeance of the Forsaken
    [47874] = 48013, -- Sunreaver Disciple's Blade
    [47889] = 48028, -- Looming Shadow Wraps
    [49232] = 49233, -- Sandals of the Grieving Soul
    [47891] = 48034, -- Helm of the High Mesa
    [47887] = 48026, -- Vest of Shifting Shadows
    [47893] = 48038, -- Sen'jin Ritualist Gloves
    [47885] = 48024, -- Greaves of the Lingering Vortex
    [47890] = 48030, -- Darkbane Amulet
    [47888] = 48027, -- Band of the Twin Val'kyr
    [47913] = 48032, -- Lightbane Focus
    [47886] = 48025, -- Nemesis Blade
    [47884] = 48023, -- Edge of Agony
    [47892] = 48036, -- Illumination
    [47883] = 48022, -- Widebarrel Flintlock
    [47906] = 48051, -- Robes of the Sleepless
    [47909] = 48054, -- Belt of the Eternal
    [47904] = 48049, -- Shoulderpads of the Snow Bandit
    [47897] = 48042, -- Helm of the Crypt Lord
    [47901] = 48046, -- Pauldrons of the Shadow Hunter
    [47896] = 48041, -- Stoneskin Chestplate
    [47902] = 48047, -- Legplates of Redeemed Blood | Legplates of the Redeemed Blood Knight
    [47908] = 48053, -- Sunwalker Legguards
    [47899] = 48044, -- Ardent Guard
    [47903] = 48048, -- Forsaken Bonecarver
    [47898] = 48043, -- Frostblade Hatchet
    [47894] = 48039, -- Mace of the Earthborn Chieftain
    [47905] = 48050, -- Blackhorn Bludgeon
    [47911] = 48056, -- Anguish
    [47900] = 48045, -- Perdition
    [47910] = 48055, -- Aegis of the Coliseum
    [47895] = 48040, -- Pride of the Kor'kron
    [47907] = 48052, -- Darkmaw Crossbow
    
    -- ToC 25 Alliance
    [46992] = 46993, -- Flowing Vestments of Ascent
    [46972] = 46973, -- Cord of the Tenebrous Mist
    [46974] = 46975, -- Leggings of the Broken Beast
    [46988] = 46989, -- Boots of the Unrelenting Storm
    [46960] = 46965, -- Breastplate of Cruel Intent
    [46990] = 46991, -- Belt of the Ice Burrower
    [46962] = 46968, -- Chestplate of the Towering Monstrosity
    [46961] = 46967, -- Boneshatter Armplates
    [46985] = 46986, -- Boots of the Courageous
    [46970] = 46971, -- Drape of the Untamed Predator
    [46976] = 46977, -- Shawl of the Refreshing Winds
    [46959] = 46966, -- Band of the Violent Temperment
    [46979] = 46980, -- Blade of Tarasque
    [46958] = 46969, -- Steel Bladebreaker
    [46963] = 46964, -- Crystal Plated Vanguard
    [47051] = 47062, -- Leggings of the Soothing Touch
    [47000] = 47004, -- Cuirass of Calamitous Fate
    [47055] = 47066, -- Bracers of the Autumn Willow
    [47056] = 47068, -- Bracers of Cloudy Omen
    [46999] = 47002, -- Bloodbath Belt
    [47057] = 47067, -- Legplates of Failing Light
    [47052] = 47061, -- Legguards of Feverish Dedication
    [46997] = 47003, -- Dawnbreaker Greaves
    [47042] = 47063, -- Pride of the Eredar
    [47043] = 47060, -- Charge of the Demon Lord
    [47223] = 47224, -- Ring of the Darkmender
    [47041] = 47059, -- Solace of the Defeated
    [47053] = 47064, -- Symbol of Transgression
    [46996] = 47001, -- Lionhead Slasher
    [46994] = 46995, -- Talonstrike
    [47081] = 47084, -- Cord of Biting Cold
    [47092] = 47097, -- Boots of the Mourning Widow
    [47094] = 47096, -- Vestments of the Shattered Fellowship
    [47071] = 47077, -- Treads of the Icewalker
    [47073] = 47074, -- Bracers of the Untold Massacre
    [47083] = 47087, -- Legguards of Concealed Hatred
    [47090] = 47099, -- Boots of Tremoring Earth
    [47082] = 47086, -- Chestplate of the Frostborn Hero
    [47093] = 47098, -- Vambraces of the Broken Bond
    [47072] = 47076, -- Girdle of Bloodied Scars
    [47089] = 47095, -- Cloak of Displacement
    [47070] = 47075, -- Ring of Callous Aggression
    [47080] = 47088, -- Satrina's Impeding Scarab
    [47069] = 47078, -- Justicebringer
    [47079] = 47085, -- Bastion of Purity
    [47126] = 47129, -- Skyweaver Robes
    [47141] = 47143, -- Bindings of Dark Essence
    [47107] = 47112, -- Belt of the Merciless Killer
    [47140] = 47145, -- Cord of Pale Thorns
    [47106] = 47109, -- Sabatons of Ruthless Judgment
    [47142] = 47147, -- Breastplate of the Frozen Lake
    [47108] = 47111, -- Bracers of the Shieldmaiden
    [47121] = 47132, -- Legguards of Ascension
    [47116] = 47133, -- The Arbiter's Muse
    [47105] = 47110, -- The Executioner's Malice
    [47139] = 47144, -- Wail of the Val'kyr
    [47115] = 47131, -- Death's Verdict
    [47138] = 47146, -- Chalice of Searing Light
    [47104] = 47113, -- Twin Spike
    [47114] = 47130, -- Lupine Longstaff
    [47203] = 47208, -- Armbands of the Ashen Saint
    [47235] = 47236, -- Gloves of the Lifeless Touch
    [47187] = 47189, -- Leggings of the Deepening Void
    [47194] = 47205, -- Footpads of the Icy Floe
    [47151] = 47155, -- Bracers of Dark Determination
    [47186] = 47190, -- Legwraps of the Awakening
    [47204] = 47209, -- Chestguard of Flowing Elements
    [47152] = 47153, -- Belt of Deathly Dominion
    [47184] = 47191, -- Legguards of the Lurking Threat
    [47234] = 47240, -- Gloves of Bitter Reprisal
    [47195] = 47207, -- Belt of the Forgotten Martyr
    [47150] = 47154, -- Greaves of the 7th Legion
    [47225] = 47238, -- Maiden's Favor
    [47183] = 47192, -- Strength of the Nerub
    [47054] = 47237, -- Band of Deplorable Violence
    [47149] = 47157, -- Signet of the Traitor King
    [47182] = 47188, -- Reign of the Unliving
    [47148] = 47156, -- Stormpike Cleaver
    [47193] = 47206, -- Misery's End
    [47233] = 47239, -- Archon Glaive
    
    -- ToC 25 Horde
    [47264] = 47425, -- Flowing Robes of Ascent
    [47258] = 47419, -- Belt of the Tenebrous Mist
    [47259] = 47420, -- Legwraps of the Broken Beast
    [47262] = 47423, -- Boots of the Harsh Winter
    [47251] = 47412, -- Cuirass of Cruel Intent
    [47265] = 47426, -- Binding of the Ice Burrower
    [47254] = 47415, -- Hauberk of the Towering Monstrosity
    [47253] = 47414, -- Boneshatter Vambraces
    [47263] = 47424, -- Sabatons of the Courageous
    [47257] = 47418, -- Cloak of the Untamed Predator
    [47256] = 47417, -- Drape of the Refreshing Winds
    [47252] = 47413, -- Ring of the Violent Temperament
    [47261] = 47422, -- Barb of Tarasque
    [47255] = 47416, -- Stygian Bladebreaker
    [47260] = 47421, -- Forlorn Barrier
    [47274] = 47435, -- Pants of the Soothing Touch
    [47270] = 47431, -- Vest of Calamitous Fate
    [47277] = 47438, -- Bindings of the Autumn Willow
    [47280] = 47441, -- Wristwraps of Cloudy Omen
    [47268] = 47429, -- Bloodbath Girdle
    [47279] = 47440, -- Leggings of Failing Light
    [47273] = 47434, -- Legplates of Feverish Dedication
    [47269] = 47430, -- Dawnbreaker Sabatons
    [47275] = 47436, -- Pride of the Demon Lord
    [47272] = 47433, -- Charge of the Eredar
    [47278] = 47439, -- Circle of the Darkmender
    [47271] = 47432, -- Solace of the Fallen
    [47276] = 47437, -- Talisman of Heedless Sins
    [47266] = 47427, -- Blood Fury
    [47267] = 47428, -- Death's Head Crossbow
    [47286] = 47447, -- Belt of Biting Cold
    [47293] = 47454, -- Sandals of the Mourning Widow
    [47292] = 47453, -- Robes of the Shattered Fellowship
    [47284] = 47445, -- Icewalker Treads
    [47281] = 47442, -- Bracers of the Silent Massacre
    [47289] = 47450, -- Leggings of Concealed Hatred
    [47295] = 47456, -- Sabatons of Tremoring Earth
    [47288] = 47449, -- Chestplate of the Frostwolf Hero
    [47294] = 47455, -- Bracers of the Broken Bond
    [47283] = 47444, -- Belt of Bloodied Scars
    [47291] = 47452, -- Shroud of Displacement
    [47282] = 47443, -- Band of Callous Aggression
    [47290] = 47451, -- Juggernaut's Vitality
    [47285] = 47446, -- Dual-blade Butcher
    [47287] = 47448, -- Bastion of Resolve
    [47301] = 47462, -- Skyweaver Vestments
    [47306] = 47467, -- Dark Essence Bindings
    [47308] = 47469, -- Belt of Pale Thorns
    [47299] = 47460, -- Belt of the Pitiless Killer
    [47296] = 47457, -- Greaves of Ruthless Judgment
    [47310] = 47471, -- Chestplate of the Frozen Lake
    [47298] = 47459, -- Armguards of the Shieldmaiden
    [47304] = 47465, -- Legplates of Ascension
    [47307] = 47468, -- Cry of the Val'kyr
    [47305] = 47466, -- Legionnaire's Gorget
    [47297] = 47458, -- The Executioner's Vice
    [47303] = 47464, -- Death's Choice
    [47309] = 47470, -- Mystifying Charm
    [47300] = 47461, -- Gouge of the Frigid Heart
    [47302] = 47463, -- Twin's Pact
    [47324] = 47485, -- Bindings of the Ashen Saint
    [47326] = 47487, -- Handwraps of the Lifeless Touch
    [47317] = 47478, -- Breeches of the Deepening Void
    [47321] = 47482, -- Boots of the Icy Floe
    [47313] = 47474, -- Armbands of Dark Determination
    [47318] = 47479, -- Leggings of the Awakening
    [47325] = 47486, -- Cuirass of Flowing Elements
    [47311] = 47472, -- Waistguard of Deathly Dominion
    [47319] = 47480, -- Leggings of the Lurking Threat
    [47330] = 47492, -- Gauntlets of Bitter Reprisal
    [47323] = 47484, -- Girdle of the Forgotten Martyr
    [47312] = 47473, -- Greaves of the Saronite Citadel
    [47328] = 47490, -- Maiden's Adoration
    [47320] = 47481, -- Might of the Nerub
    [47315] = 47476, -- Band of the Traitor King
    [47327] = 47489, -- Lurid Manifestation
    [47316] = 47477, -- Reign of the Dead
    [47314] = 47475, -- Hellscream Slicer
    [47322] = 47483, -- Suffering's End
    [47329] = 47491, -- Hellion Glaive
    
    -- ICC 10
    [50773] = 51930, -- Cord of the Patronizing Practitioner
    [50774] = 51929, -- Coldwraith Bracers
    [50762] = 51935, -- Linked Scourge Vertebrae
    [50775] = 51928, -- Corrupted Silverplate Leggings
    [50772] = 51931, -- Ancient Skeletal Boots
    [50764] = 51933, -- Shawl of Nerubian Silk
    [50763] = 51934, -- Marrowgar's Scratching Choker
    [50339] = 50346, -- Sliver of Pure Ice
    [50771] = 51932, -- Frost Needle
    [50761] = 51936, -- Citadel Enforcer's Claymore
    [50759] = 51938, -- Bone Warden's Splitter
    [50760] = 51937, -- Bonebreaker Scepter
    [50785] = 51918, -- Bracers of Dark Blessings
    [50782] = 51921, -- Sister's Handshrouds
    [50780] = 51923, -- Chestguard of the Frigid Noose
    [50778] = 51925, -- Soulthief's Braided Belt
    [50783] = 51920, -- Boots of the Frozen Seed
    [50777] = 51926, -- Handgrips of Frost and Sleet
    [50784] = 51919, -- Deathspeaker Disciple's Belt
    [50779] = 51924, -- Deathspeaker Zealot's Helm
    [50786] = 51917, -- Ghoul Commander's Cuirass
    [50342] = 50343, -- Whispering Fanged Skull
    [50781] = 51922, -- Scourgelord's Baton
    [50776] = 51927, -- Njorndar Bone Bow
    [50795] = 51908, -- Cord of Dark Suffering
    [50797] = 51906, -- Ice-Reinforced Vrykul Helm
    [50792] = 51911, -- Pauldrons of Lost Hope
    [50789] = 51914, -- Icecrown Rampart Bracers
    [50796] = 51907, -- Bracers of Pale Illumination
    [50788] = 51915, -- Bone Drake's Enameled Boots
    [50791] = 51912, -- Saronite Gargoyle Cloak
    [50790] = 51913, -- Abomination's Bloody Ring
    [50340] = 50345, -- Muradin's Spyglass
    [50793] = 51910, -- Midnight Sun
    [50787] = 51916, -- Frost Giant's Cleaver
    [50794] = 51909, -- Neverending Winter
    [50807] = 51896, -- Thaumaturge's Crackling Cowl
    [50804] = 51899, -- Icecrown Spire Sandals
    [50799] = 51904, -- Scourge Stranglers
    [50806] = 51897, -- Leggings of Unrelenting Blood
    [50800] = 51903, -- Hauberk of a Thousand Cuts
    [50801] = 51902, -- Blade-Scored Carapace
    [50802] = 51901, -- Gargoyle Spit Bracers
    [50808] = 51895, -- Deathforged Legplates
    [50809] = 51894, -- Soulcleave Pendant
    [50803] = 51900, -- Saurfang's Cold-Forged Band
    [50798] = 51905, -- Ramaladni's Blade of Culling
    [50805] = 51898, -- Mag'hari Chieftain's Staff
    [50988] = 51883, -- Bloodstained Surgeon's Shoulderguards
    [50990] = 51882, -- Kilt of Untreated Wounds
    [50985] = 51885, -- Wrists of Septic Shock
    [50858] = 51889, -- Plague-Soaked Leather Leggings
    [50812] = 51891, -- Taldron's Long Neglected Boots
    [50967] = 51886, -- Festergut's Gaseous Gloves
    [50811] = 51892, -- Festering Fingerguards
    [50859] = 51888, -- Cloak of Many Skins
    [50852] = 51890, -- Precious's Putrid Collar
    [50986] = 51884, -- Signet of Putrefaction
    [50810] = 51893, -- Gutbuster
    [50966] = 51887, -- Abracadaver
    [51007] = 51872, -- Ether-Soaked Bracers
    [51005] = 51874, -- Gloves of Broken Fingers
    [51009] = 51870, -- Chestguard of the Failed Experiment
    [51002] = 51877, -- Taldron's Short-Sighted Helm
    [51006] = 51873, -- Shuffling Shoes
    [51000] = 51879, -- Flesh-Shaper's Gurney Strap
    [51008] = 51871, -- Choker of Filthy Diamonds
    [51001] = 51878, -- Rotface's Rupturing Ring
    [51003] = 51876, -- Abomination Knuckles
    [51004] = 51875, -- Lockjaw
    [50998] = 51881, -- Shaft of Glacial Ice
    [51020] = 51859, -- Shoulders of Ruinous Senility
    [51017] = 51862, -- Cauterized Cord
    [51013] = 51866, -- Discarded Bag of Entrails
    [51015] = 51864, -- Shoulderpads of the Morbid Ritual
    [51019] = 51860, -- Rippling Flesh Kilt
    [51014] = 51865, -- Scalpel-Sharpening Shoulderguards
    [51018] = 51861, -- Chestplate of Septic Stitches
    [51012] = 51867, -- Infected Choker
    [51016] = 51863, -- Pendant of Split Veins
    [50341] = 50344, -- Unidentifiable Organ
    [51011] = 51868, -- Flesh-Carving Scalpel
    [51010] = 51869, -- The Facelifter
    [51379] = 51851, -- Bloodsoul Raiment
    [51380] = 51850, -- Pale Corpse Boots
    [51023] = 51856, -- Taldaram's Soft Slippers
    [51325] = 51853, -- Blood-Drinker's Girdle
    [51383] = 51847, -- Spaulders of the Blood Princes
    [51025] = 51854, -- Battle-Maiden's Legguards
    [51382] = 51848, -- Heartsick Mender's Cape
    [51381] = 51849, -- Cerise Coiled Ring
    [51024] = 51855, -- Thrice Fanged Signet
    [51021] = 51858, -- Soulbreaker
    [51022] = 51857, -- Hersir's Greatspear
    [51326] = 51852, -- Wand of Ruby Claret
    [51554] = 51837, -- Cowl of Malefic Repose
    [51552] = 51839, -- Shoulderpads of the Searing Kiss
    [51550] = 51841, -- Ivory-Inlaid Leggings
    [51551] = 51840, -- Chestguard of Siphoned Elements
    [51386] = 51844, -- Throatrender Handguards
    [51556] = 51835, -- Veincrusher Gauntlets
    [51555] = 51836, -- Tightening Waistband
    [51548] = 51842, -- Collar of Haughty Disdain
    [51387] = 51843, -- Seal of the Twilight Queen
    [51384] = 51846, -- Bloodsipper
    [51385] = 51845, -- Stakethrower
    [51553] = 51838, -- Lana'thel's Bloody Nail
    [51777] = 51823, -- Leggings of the Refracted Mind
    [51585] = 51825, -- Sister Svalna's Spangenhelm
    [51565] = 51830, -- Skinned Whelp Shoulders
    [51583] = 51827, -- Stormbringer Gloves
    [51566] = 51829, -- Legguards of the Twisted Dream
    [51586] = 51824, -- Emerald Saint's Spaulders
    [51563] = 51832, -- Taiga Bindings
    [51564] = 51831, -- Ironrope Belt of Ymirjar
    [51584] = 51826, -- Lich Wrappings
    [51562] = 51833, -- Oxheart
    [51582] = 51828, -- Sister Svalna's Aether Staff
    [51561] = 51834, -- Dreamhunter's Carbine
    [51790] = 51813, -- Robes of Azure Downfall
    [51783] = 51820, -- Vambraces of the Frost Wyrm Queen
    [51789] = 51814, -- Icicle Shapers
    [51792] = 51811, -- Shoulderguards of Crystalline Bone
    [51785] = 51818, -- Wyrmwing Treads
    [51782] = 51821, -- Etched Dragonbone Girdle
    [51786] = 51817, -- Legplates of Aetheric Strife
    [51787] = 51816, -- Scourge Fanged Stompers
    [51779] = 51822, -- Rimetooth Pendant
    [51784] = 51819, -- Splintershard
    [51788] = 51815, -- Bleak Coldarra Carver
    [51791] = 51812, -- Lost Pavise of the Blue Flight
    [51801] = 51941, -- Pugius, Fist of Defiance
    [51803] = 51939, -- Tel'thas, Dagger of the Blood King
    [51800] = 51942, -- Stormfury, Black Blade of the Betrayer
    [51795] = 51947, -- Troggbane, Axe of the Frostborne King
    [51798] = 51944, -- Valius, Gavel of the Lightbringer
    [51796] = 51946, -- Warmace of Menethil
    [51799] = 51943, -- Halion, Staff of Forgotten Love
    [51797] = 51945, -- Tainted Twig of Nordrassil
    [51802] = 51940, -- Windrunner's Heartseeker
    
    -- ICC 25
    [49978] = 50613, -- Crushing Coldwraith Belt
    [49979] = 50615, -- Handguards of Winter's Respite
    [49950] = 50607, -- Frostbitten Fur Boots
    [49952] = 50605, -- Snowserpent Mail Helm
    [49980] = 50617, -- Rusted Bonespike Pauldrons
    [49951] = 50606, -- Gendarme's Cuirass
    [49960] = 50611, -- Bracers of Dark Reckoning
    [49964] = 50612, -- Legguards of Lost Hope
    [49975] = 50609, -- Bone Sentinel's Amulet
    [49949] = 50604, -- Band of the Bone Colossus
    [49977] = 50614, -- Loop of the Endless Labyrinth
    [49967] = 50610, -- Marrowgar's Frigid Eye
    [49968] = 50608, -- Frozen Bonespike
    [50415] = 50709, -- Bryntroll, the Bone Arbiter
    [49976] = 50616, -- Bulwark of Smouldering Steel
    [49991] = 50643, -- Shoulders of Mercy Killing
    [49994] = 50651, -- The Lady's Brittle Bracers
    [49987] = 50646, -- Cultist's Bloodsoaked Spaulders
    [49996] = 50649, -- Deathwhisper Raiment
    [49988] = 50645, -- Leggings of Northern Lights
    [49993] = 50652, -- Necrophotic Greaves
    [49986] = 50640, -- Broken Ram Skull Helm
    [49995] = 50650, -- Fallen Lord's Handguards
    [49983] = 50639, -- Blood-Soaked Saronite Stompers
    [49989] = 50647, -- Ahn'kahar Onyx Neckguard
    [49985] = 50642, -- Juggernaut Band
    [49990] = 50644, -- Ring of Maddening Whispers
    [49982] = 50641, -- Heartpierce
    [49992] = 50648, -- Nibelung
    [50034] = 50638, -- Zod's Repeating Longbow
    [50006] = 50661, -- Corp'rethar Ceremonial Crown
    [50011] = 50663, -- Gunship Captain's Mittens
    [50001] = 50656, -- Ikfirus's Sack of Wonder
    [50009] = 50665, -- Boots of Unnatural Growth
    [50000] = 50655, -- Scourge Hunter's Vambraces
    [50003] = 50660, -- Boneguard Commander's Pauldrons
    [50002] = 50659, -- Polar Bear Claw Bracers
    [50010] = 50667, -- Waistband of Righteous Fury
    [49998] = 50653, -- Shadowvault Slayer's Cloak
    [50005] = 50658, -- Amulet of the Silent Eulogy
    [50008] = 50664, -- Ring of Rapid Ascent
    [49999] = 50657, -- Skeleton Lord's Circle
    [50359] = 50366, -- Althor's Abacus
    [50352] = 50349, -- Corpse Tongue Coin
    [50411] = 50654, -- Scourgeborne Waraxe
    [50333] = 50670, -- Toskk's Maximized Wristguards
    [50015] = 50671, -- Belt of the Blood Nova
    [50014] = 50668, -- Greatcloak of the Turned Champion
    [50362] = 50363, -- Deathbringer's Will
    [50412] = 50672, -- Bloodvenom Blade
    [50063] = 50702, -- Lingering Illness
    [50056] = 50694, -- Plaguebringer's Stained Pants
    [50062] = 50699, -- Plague Scientist's Boots
    [50042] = 50697, -- Gangrenous Leggings
    [50041] = 50696, -- Leather of Stitched Scourge Parts
    [50059] = 50698, -- Horrific Flesh Epaulets
    [50038] = 50689, -- Carapace of Forgotten Kings
    [50064] = 50703, -- Unclean Surgical Gloves
    [50413] = 50688, -- Nerub'ar Stalker's Cord
    [50060] = 50701, -- Faceplate of the Forgotten
    [50037] = 50690, -- Fleshrending Gauntlets
    [50036] = 50691, -- Belt of Broken Bones
    [50061] = 50700, -- Holiday's Grace
    [50414] = 50693, -- Might of Blight
    [50035] = 50692, -- Black Bruise
    [50040] = 50695, -- Distant Land
    [50032] = 50686, -- Death Surgeon's Sleeves
    [50026] = 50679, -- Helm of the Elder Moon
    [50021] = 50675, -- Aldriana's Gloves of Secrecy
    [50022] = 50673, -- Dual-Bladed Pauldrons
    [50030] = 50687, -- Bloodsunder's Bracers
    [50020] = 50674, -- Raging Behemoth's Shoulderplates
    [50024] = 50681, -- Blightborne Warplate
    [50027] = 50680, -- Rot-Resistant Breastplate
    [50019] = 50677, -- Winding Sheet
    [50023] = 50682, -- Bile-Encrusted Medallion
    [50025] = 50678, -- Seal of Many Mouths
    [50353] = 50348, -- Dislodged Foreign Object
    [50028] = 50685, -- Trauma
    [50016] = 50676, -- Rib Spreader
    [50033] = 50684, -- Corpse-Impaling Spike
    [50067] = 50707, -- Astrylian's Sutured Cinch
    [50069] = 50705, -- Professor's Bloodied Smock
    [50351] = 50706, -- Tiny Abomination in a Jar
    [50179] = 50708, -- Last Word
    [50068] = 50704, -- Rigormortis
    [50172] = 50717, -- Sanguine Silk Robes
    [50176] = 50722, -- San'layn Ritualist Gloves
    [50073] = 50713, -- Geistlord's Punishment Sack
    [50171] = 50715, -- Shoulders of Frost-Tipped Thorns
    [50177] = 50723, -- Mail of Crimson Coins
    [50071] = 50711, -- Treads of the Wasteland
    [50072] = 50712, -- Landsoul's Horned Greathelm
    [50175] = 50721, -- Crypt Keeper's Bracers
    [50075] = 50716, -- Taldaram's Plated Fists
    [50074] = 50718, -- Royal Crimson Cloak
    [50174] = 50720, -- Incarnadine Band of Mending
    [50170] = 50714, -- Valanar's Other Signet Ring
    [50173] = 50719, -- Shadow Silk Spindle
    [50184] = 50710, -- Keleseth's Seducer
    [49919] = 50603, -- Cryptmaker
    [50182] = 50724, -- Blood Queen's Crimson Choker
    [50180] = 50728, -- Lana'thel's Chain of Flagellation
    [50354] = 50726, -- Bauble of True Blood
    [50178] = 50727, -- Bloodfall
    [50181] = 50725, -- Dying Light
    [50065] = 50729, -- Icecrown Glacial Wall
    [50418] = 50629, -- Robe of the Waking Nightmare
    [50417] = 50630, -- Bracers of Eternal Dreaming
    [50202] = 50626, -- Snowstorm Helm
    [50188] = 50619, -- Anub'ar Stalker's Gloves
    [50187] = 50620, -- Coldwraith Links
    [50199] = 50623, -- Leggings of Dying Candles
    [50192] = 50624, -- Scourge Reaver's Legplates
    [50416] = 50632, -- Boots of the Funeral March
    [50190] = 50625, -- Grinning Skull Greatboots
    [50205] = 50628, -- Frostbinder's Shredded Cape
    [50195] = 50627, -- Noose of Malachite
    [50185] = 50622, -- Devium's Eternally Cold Ring
    [50186] = 50618, -- Frostbrood Sapphire Ring
    [50183] = 50621, -- Lungbreaker
    [50472] = 50631, -- Nightmare Ender
    [50421] = 50633, -- Sindragosa's Cruel Claw
    [50424] = 50636, -- Memory of Malygos
    [50360] = 50365, -- Phylactery of the Nameless Lich
    [50361] = 50364, -- Sindragosa's Flawless Fang
    [50423] = 50635, -- Sundial of Eternal Dusk
    [50426] = 50736, -- Heaven's Fall, Kryss of a Thousand Lies
    [50427] = 50732, -- Bloodsurge, Kel'Thuzad's Blade of Agony
    [50070] = 50730, -- Glorenzelg, High-Blade of the Silver Hand
    [50012] = 50737, -- Havoc's Call, Blade of Lordaeron Kings
    [50428] = 50734, -- Royal Scepter of Terenas II
    [49997] = 50738, -- Mithrios, Bronzebeard's Legacy
    [50425] = 50735, -- Oathbinder, Charge of the Ranger-General
    [50429] = 50731, -- Archus, Greatstaff of Antonidas
    [49981] = 50733, -- Fal'inrush, Defender of Quel'thalas
    
    -- RS 10
    [53118] = 54562, -- Misbegotten Belt
    [53114] = 54561, -- Gloaming Sark
    [53117] = 54560, -- Changeling Gloves
    [53113] = 54566, -- Twilight Scale Shoulders
    [53119] = 54558, -- Boots of Divided Being
    [53112] = 54559, -- Bracers of the Heir
    [53121] = 54565, -- Surrogate Belt
    [53111] = 54564, -- Scion's Treads
    [53115] = 54556, -- Abduction's Cover
    [53103] = 54557, -- Baltharus' Gift
    [53116] = 54563, -- Saviana's Tribute
    [53110] = 54567, -- Zarithrian's Offering
    
    -- RS 25
    [53486] = 54582, -- Bracers of Fiery Night
    [53134] = 54584, -- Phaseshifter's Bracers
    [53126] = 54580, -- Umbrage Armbands
    [53488] = 54587, -- Split Shape Belt
    [53127] = 54577, -- Returning Footfalls
    [53125] = 54578, -- Apocalypse's Advance
    [53487] = 54586, -- Foreshadow Steps
    [53129] = 54579, -- Treads of Impending Resurrection
    [53489] = 54583, -- Cloak of Burning Dusk
    [53132] = 54581, -- Penumbra Pendant
    [53490] = 54585, -- Ring of Phased Regeneration
    [53133] = 54576, -- Signet of Twilight
    [54572] = 54588, -- Charred Twilight Scale
    [54573] = 54589, -- Glowing Twilight Scale
    [54571] = 54591, -- Petrified Twilight Scale
    [54569] = 54590, -- Sharpened Twilight Scale
    
    
    -- T11 tokens
    [63683] = 65001, -- Helm of the Forlorn Conqueror | Crown of the Forlorn Conqueror
    [63684] = 65000, -- Helm of the Forlorn Protector | Crown of the Forlorn Protector
    [63682] = 65002, -- Helm of the Forlorn Vanquisher | Crown of the Forlorn Vanquisher
    [64315] = 65088, -- Mantle of the Forlorn Conqueror | Shoulders of the Forlorn Conqueror
    [64316] = 65087, -- Mantle of the Forlorn Protector | Shoulders of the Forlorn Protector
    [64314] = 65089, -- Mantle of the Forlorn Vanquisher | Shoulders of the Forlorn Vanquisher
    
    -- Blackwing Descent
    [59219] = 65077, -- Power Generator Hood
    [59217] = 65079, -- X-Tron Duct Tape
    [59218] = 65078, -- Passive Resistor Spaulders
    [59120] = 65083, -- Poison Protocol Pauldrons
    [63540] = 65004, -- Circuit Design Breastplate
    [59119] = 65084, -- Voltage Source Chestguard
    [59216] = 65080, -- Life Force Chargers
    [59118] = 65085, -- Electron Inductor Coils
    [59117] = 65086, -- Jumbotron Power Belt
    [59220] = 65076, -- Security Measure Alpha
    [59121] = 65082, -- Lightning Conductor Band
    [59122] = 65081, -- Organic Lifeform Inverter
    [59336] = 65044, -- Flame Pillar Leggings
    [59452] = 65020, -- Crown of Burning Waters
    [59335] = 65045, -- Scorched Wormling Vest
    [59329] = 65050, -- Parasitic Bands
    [59334] = 65046, -- Lifecycle Waistguard
    [59331] = 65049, -- Leggings of Lethal Force
    [59340] = 65042, -- Breastplate of Avenging Flame
    [59328] = 65051, -- Molten Tantrum Boots
    [59332] = 65048, -- Symbiotic Worm
    [59341] = 65041, -- Incineratus
    [59333] = 65047, -- Lava Spine
    [59492] = 65007, -- Akirus the Worm-Breaker
    [59325] = 65054, -- Mantle of Roaring Flames
    [59322] = 65056, -- Bracers of the Burningeye
    [59312] = 65066, -- Helm of the Blind Seer
    [59318] = 65060, -- Sark of the Unwatched
    [59324] = 65055, -- Gloves of Cacophony
    [59315] = 65063, -- Boots of Vertigo
    [59316] = 65062, -- Battleplate of Ancient Kings
    [59317] = 65061, -- Legguards of the Unseeing
    [59326] = 65053, -- Bell of Enraging Resonance
    [59319] = 65059, -- Ironstar Amulet
    [59327] = 65052, -- Kingdom's Heart
    [59320] = 65058, -- Themios the Darkbringer
    [59234] = 65069, -- Einhorn's Galoshes
    [59313] = 65065, -- Brackish Gloves
    [59451] = 65021, -- Manacles of the Sleeping Beast
    [59223] = 65073, -- Double Attack Handguards
    [59310] = 65068, -- Chaos Beast Bracers
    [59355] = 65028, -- Chimaeron Armguards
    [59311] = 65067, -- Burden of Mortality
    [59225] = 65071, -- Plated Fists of Provocation
    [59221] = 65075, -- Massacre Treads
    [59224] = 65072, -- Heart of Rage
    [59233] = 65070, -- Bile-O-Tron Nut
    [59314] = 65064, -- Finkle's Mixer Upper
    [59349] = 65034, -- Belt of Arcane Storms
    [59351] = 65032, -- Legwraps of the Greatest Son
    [59353] = 65030, -- Leggings of Consuming Flames
    [59343] = 65039, -- Aberration's Leggings
    [59350] = 65033, -- Treads of Flawless Creation
    [59346] = 65037, -- Tunic of Failed Experiments
    [59352] = 65031, -- Flash Freeze Gauntlets
    [59342] = 65040, -- Belt of Absolute Zero
    [59344] = 65038, -- Dragon Bone Warhelm
    [59348] = 65035, -- Cloak of Biting Chill
    [59354] = 65029, -- Jar of Ancient Remedies
    [59347] = 65036, -- Mace of Acrid Death
    [59454] = 65019, -- Shadowblaze Robes
    [59337] = 65043, -- Mantle of Nefarius
    [59321] = 65057, -- Belt of the Nightmare
    [59222] = 65074, -- Spaulders of the Scarred Lady
    [59450] = 65022, -- Belt of the Blackhand
    [59356] = 65027, -- Pauldrons of the Apocalypse
    [59457] = 65018, -- Shadow of Dread
    [59442] = 65025, -- Rage of Ages
    [59441] = 65026, -- Prestor's Talisman of Machination
    [59459] = 65017, -- Andoros, Fist of the Dragon King
    [59443] = 65024, -- Crul'korak, the Lightning's Arc
    [63679] = 65003, -- Reclaimed Ashkandi, Greatsword of the Brotherhood
    [59444] = 65023, -- Akmin-Kurai, Dominion's Shield
    
    -- Bastion of Twilight
    [59475] = 65138, -- Bracers of the Bronze Flight
    [59482] = 65135, -- Robes of the Burning Acolyte
    [59469] = 65144, -- Storm Rider's Boots
    [59481] = 65136, -- Helm of the Nether Scion
    [59472] = 65141, -- Proto-Handler's Gauntlets
    [59476] = 65137, -- Legguards of the Emerald Brood
    [59471] = 65142, -- Pauldrons of the Great Ettin
    [59470] = 65143, -- Bracers of Impossible Strength
    [59483] = 65134, -- Wyrmbreaker's Amulet
    [59473] = 65140, -- Essence of the Cyclone
    [59484] = 65133, -- Book of Binding Will
    [59474] = 65139, -- Malevolence
    [63534] = 65093, -- Helm of Eldritch Authority
    [63535] = 65092, -- Waistguard of Hatred
    [63531] = 65096, -- Daybreaker Helm
    [59516] = 65108, -- Drape of the Twins
    [59512] = 65112, -- Valiona's Medallion
    [59517] = 65107, -- Necklace of Strife
    [59518] = 65106, -- Ring of Rivalry
    [59519] = 65105, -- Theralion's Mirror
    [59515] = 65109, -- Vial of Stolen Memories
    [63536] = 65091, -- Blade of the Witching Hour
    [63533] = 65094, -- Fang of Twilight
    [63532] = 65095, -- Dragonheart Piercer
    [59508] = 65116, -- Treads of Liquid Ice
    [59511] = 65113, -- Hydrolance Gloves
    [59502] = 65122, -- Dispersing Belt
    [59510] = 65114, -- Feludius' Mantle
    [59504] = 65120, -- Arion's Crown
    [59509] = 65115, -- Glaciated Helm
    [59503] = 65121, -- Terrastra's Legguards
    [59505] = 65119, -- Gravitational Pull
    [59507] = 65117, -- Glittering Epidermis
    [59514] = 65110, -- Heart of Ignacious
    [59506] = 65118, -- Crushing Weight
    [59513] = 65111, -- Scepter of Ice
    [59498] = 65126, -- Hands of the Twilight Council
    [59495] = 65128, -- Treads of Hideous Transformation
    [59490] = 65129, -- Membrane of C'Thun
    [59499] = 65125, -- Kilt of the Forgotten Battle
    [59485] = 65132, -- Coil of Ten-Thousand Screams
    [59497] = 65127, -- Shackles of the End of Days
    [59487] = 65130, -- Helm of Maddening Whispers
    [59486] = 65131, -- Battleplate of the Apocalypse
    [59501] = 65123, -- Signet of the Fifth Circle
    [59500] = 65124, -- Fall of Mortality
    [63680] = 65090, -- Twilight's Hammer
    [59494] = 68600, -- Uhn'agh Fash, the Darkest Betrayal
    [59330] = 65145, -- Shalug'doom, the Axe of Unmaking
    
    -- Throne Of The Four Winds
    [63498] = 65376, -- Soul Breath Belt
    [63497] = 65374, -- Gale Rouser Belt
    [63493] = 65371, -- Wind Stalker Belt
    [63496] = 65377, -- Lightning Well Belt
    [63492] = 65368, -- Star Chaser Belt
    [63495] = 65375, -- Tempest Keeper Belt
    [63490] = 65369, -- Sky Strider Belt
    [63491] = 65370, -- Thunder Wall Belt
    [63494] = 65373, -- Planetary Band
    [63488] = 65367, -- Mistral Circle
    [63489] = 65372, -- Permafrost Signet
    [63507] = 65383, -- Soul Breath Leggings
    [63506] = 65384, -- Gale Rouser Leggings
    [63503] = 65381, -- Wind Stalker Leggings
    [63505] = 65386, -- Lightning Well Legguards
    [63502] = 65378, -- Star Chaser Legguards
    [63504] = 65385, -- Tempest Keeper Leggings
    [63500] = 65379, -- Sky Strider Greaves
    [63501] = 65380, -- Thunder Wall Greaves
    [69835] = 69881, -- Planetary Drape
    [69831] = 69884, -- Mistral Drape
    [69834] = 69879, -- Cloudburst Cloak
    [69833] = 69878, -- Permafrost Cape
    [69830] = 69882, -- Planetary Amulet
    [69827] = 69880, -- Mistral Pendant
    [69829] = 69885, -- Cloudburst Necklace
    [69828] = 69883, -- Permafrost Choker
    [63499] = 65382, -- Cloudburst Ring
    [68127] = 68132, -- Stormwake, the Tempest's Reach
    [68129] = 68130, -- Stormwake, the Tempest's Reach
    [68128] = 68131, -- Stormwake, the Tempest's Reach
};

for normal, heroic in pairs(heroicMirrors) do
    LootReserve.Data.TokenMap.HeroicMirrors[normal] = true;
    
    if LootReserve.Data.TokenMap.Tokens[normal] then
        geterrorhandler()("[LootReserve] Duplicate normal item detected: " .. normal);
    end
    LootReserve.Data.TokenMap.Tokens[normal]  = heroic;
    
    
    if LootReserve.Data.TokenMap.Rewards[heroic] then
        tinsert(LootReserve.Data.TokenMap.Rewards[heroic], normal);
    else
        LootReserve.Data.TokenMap.Rewards[heroic] = {normal};
    end
end


-- ItemLevelOverrides
do
    local _, MY_CLASS = UnitClassBase("player");
    local function TableMax(t)
        local key, val = next(t);
        local max = val;
        repeat
            max = math.max(max, val);
            key, val = next(t, key);
        until not val
        return max;
    end
    local function GetItemLevelByClass(classLevels)
        return classLevels[MY_CLASS] or TableMax(classLevels);
    end
    
    for ids, ilvl in pairs({
        [{215390, 215417, 215386, 215388, 215419, 215392}] = 30, -- Waylaid Supplies
        [{215398, 215402, 215408, 215411}] = 35, -- Waylaid Supplies
        [{215415, 215403}] = 40, -- Waylaid Supplies
        [{217337}] = 30, -- Supply Shipment
        [{217338}] = 35, -- Supply Shipment
        [{281008, 281009, 281010}] = 45, -- Supply Shipment
        
        [{209693, 211452}] = 33, -- Perfect Blackfathom Pearl
        
        [{18665, 18646}] = 75, -- Benediction / Anathema
        [{18703, 18704, 18705}] = 75, -- Lok'delar, Rhok'delar, Lamina
        [{17204, 227728}] = 80, -- Sulfuras
        [{18563, 18564}] = 80, -- Thunderfury
        
        [{18422, 18423}] = 74, -- Head of Onyxia
        
        [{19002, 19003}] = 83, -- Head of Nefarian
        
        [{19721}] = 61, -- Primal Hakkari Shawl
        [{19724}] = GetItemLevelByClass({
        [3] = 68,
        [4] = 65,
        [5] = 68,
        }), -- Primal Hakkari Aegis
        [{19723}] = 65, -- Primal Hakkari Kossack
        [{19722}] = 65, -- Primal Hakkari Tabard
        [{19717}] = 61, -- Primal Hakkari Armsplint
        [{19716}] = 61, -- Primal Hakkari Bindings
        [{19718}] = 61, -- Primal Hakkari Stanchion
        [{19719}] = 61, -- Primal Hakkari Girdle
        [{19720}] = 61, -- Primal Hakkari Sash
        
        [{19939, 19940, 19941, 19942, 19819, 19820, 19818, 19814, 19821, 19816, 19817, 19813, 19815}] = 65, -- ZG Trinkets
        
        [{19802}] = 68, -- Heart of Hakkar
        
        [{20888}] = 65, -- Qiraji Ceremonial Ring
        [{20884}] = 65, -- Qiraji Magisterial Ring
        [{20885}] = 67, -- Qiraji Martial Drape
        [{20889}] = 67, -- Qiraji Regal Drape
        [{20890}] = 70, -- Qiraji Ornate Hilt
        [{20886}] = 70, -- Qiraji Spiked Hilt
        
        [{20220}] = 70, -- Head of Ossirian the Unscarred
        
        [{21237}] = 79, -- Imperial Qiraji Regalia
        [{21232}] = 79, -- Imperial Qiraji Armaments
        [{20928}] = GetItemLevelByClass({
        [1] = 78,
        [3] = 81,
        [4] = 78,
        [5] = 78,
        }), -- Qiraji Bindings of Command
        [{20932}] = 78, -- Qiraji Bindings of Dominance
        
        [{20930, 20926}] = 81, -- Vek'lor's Diadem, Vek'nilash's Circlet
        [{20927, 20931}] = 81, -- Ouro's Intact Hide, Skin of the Great Sandworm
        [{20929, 20933}] = 88, -- Carapace of the Old God, Husk of the Old God
        
        [{21221}] = 88, -- Eye of C'Thun
        
        [{22726, 22727, 22724, 22733}] = 90, -- Atiesh
        
        [{22369, 22362, 22355}] = 88, -- T3 Bracers
        [{22371, 22364, 22357}] = 88, -- T3 Gloves
        [{22370, 22363, 22356}] = 88, -- T3 Belts
        [{22366, 22359, 22352}] = 88, -- T3 Legs
        [{22372, 22365, 22358}] = 86, -- T3 Shoes
        [{22351, 22350, 22349}] = 92, -- T3 Chests
        [{22368, 22361, 22354}] = 86, -- T3 Shoulders
        [{22367, 22360, 22353}] = 88, -- T3 Heads
        
        [{22520}] = 90, -- The Phylactery of Kel'Thuzad
        
        
        
        [{29757, 29758, 29756, 29760, 29761, 29759, 29763, 29764, 29762, 29766, 29767, 29765, 29754, 29753, 29755}] = 120, -- T4
        
        [{32385, 32386}] = 125, -- Magtheridon's Head
        
        [{30239, 30240, 30241, 30245, 30246, 30247, 30242, 30243, 30244, 30248, 30249, 30250, 30236, 30237, 30238}] = 133, -- T5
        
        [{32405}] = 138, -- Verdant Sphere
        
        [{31092, 31094, 31093, 31097, 31095, 31096, 31101, 31103, 31102, 31098, 31100, 31099, 31089, 31091, 31090}] = 146, -- T6 BT/Hyjal
        [{34848, 34851, 34852, 34853, 34854, 34855, 34856, 34857, 34858}] = 154, -- T6 SWP
        
        
        
        [{40610, 40611, 40612, 40613, 40614, 40615, 40616, 40617, 40618, 40619, 40620, 40621, 40622, 40623, 40624}] = 200, -- T7 10
        [{40625, 40626, 40627, 40628, 40629, 40630, 40631, 40632, 40633, 40634, 40635, 40636, 40637, 40638, 40639}] = 213, -- T7 25
        [{44569}] = 213, -- Key to the Focusing Iris 10
        [{44581}] = 226, -- Key to the Focusing Iris 25
        
        [{45635, 45636, 45637, 45644, 45645, 45646, 45647, 45648, 45649, 45650, 45651, 45652, 45659, 45660, 45661}] = 225, -- T8 10
        [{45632, 45633, 45634, 45638, 45639, 45640, 45653, 45654, 45655, 45641, 45642, 45643, 45656, 45657, 45658}] = 232, -- T8 25
        [{46052}] = 239, -- Reply-Code Alpha 10
        [{46053}] = 252, -- Reply-Code Alpha 25
        [{45038}] = 258, -- Fragment of Val'anyr
        
        [{47242}] = 245, -- T9 10H / 25 / 25H
        [{47557, 47558, 47559}] = 258, -- T9 25H
        
        [{49643, 49644}] = 245, -- Head of Onyxia
        
        [{52025, 52026, 52027}] = 264, -- T10 10H / 25 / 25H
        [{52028, 52029, 52030}] = 277, -- T10 25H
        [{50274, 49869, 50226, 50231}] = 284, -- Shadowmourne
        
        [{63683, 63684, 63682, 64315, 64316, 64314}] = 359, -- T11 N
        [{67429, 67430, 67431, 67428, 67427, 67426, 65001, 65000, 65002, 67423, 67424, 67425, 65088, 65087, 65089, 66998}] = 372, -- T11 H
    }) do
        for _, id in ipairs(ids) do
            LootReserve.Data.ItemLevelOverrides[id] = ilvl
        end
    end
end

--- Returns a boolean that queries if a given item is in the master categories list.
function LootReserve.Data:IsItemInCategories(itemID, categories)
    if itemID == 0 then return false; end
    for _, category in ipairs(categories) do
        if category <= 0 then return false; end

        category = self.Categories[category];
        if category and category.Children and self:IsCategoryVisible(category) then
            for _, child in ipairs(category.Children) do
                if child.Loot then
                    for _, lootItem in ipairs(child.Loot) do
                        if LootReserve.ItemCache(lootItem):GetID() == itemID then
                            return true;
                        end
                    end
                end
            end
        end
    end

    return false;
end

--- Gets the categories an item is in by item ID.
function LootReserve.Data:GetItemCategories(itemID)
    local categories = { };
    for category in pairs(self.Categories) do
        if self:IsItemInCategories(itemID, {category}) then
            table.insert(categories, category);
        end
    end
    return categories;
end

--- Checks if a category is visible on the local client.
function LootReserve.Data:IsCategoryVisible(category)
    return not category.Expansion or category.Expansion <= LootReserve:GetCurrentExpansion();
end

--- Sorts the categories.
--- Boy do I not love nondescript variable names :(
function LootReserve.Data.CategorySorter(a, b, aID, bID)
    if a.Sort then aID = a.Sort end
    if b.Sort then bID = b.Sort end
    if aID > 0 and bID > 0 and a.Expansion ~= b.Expansion then
        return a.Expansion > b.Expansion;
    end
    return aID < bID;
end

--- Checks if an item is one that begins a quest.
function LootReserve.Data:GetQuestStarted(itemID)
    return self.QuestStarters[itemID];
end

--- Checks the requirements for a drop to be looted by a given player.
function LootReserve.Data:GetQuestDropRequirement(itemID)
    return self.QuestDrops[itemID];
end

--- Gets the token id for an item, such as "Scorched Core Chest" for "Cenarion Armor" 
function LootReserve.Data:GetToken(itemID)
    return self.TokenMap.Tokens[itemID];
end

--- Gets the available items for a given token itemID.
--- Basically the opposite of the above function.
function LootReserve.Data:GetTokenRewards(itemID)
    return self.TokenMap.Rewards[itemID];
end

--- Checks if an item ID is a token.
function LootReserve.Data:IsToken(itemID)
    return self:GetTokenRewards(itemID) ~= nil;
end

--- Checks if the item ID is a reward from a token.
function LootReserve.Data:IsTokenReward(itemID)
    return self:GetToken(itemID) ~= nil;
end

--- Checks if a token is a "heroic" version (?)
--- Shouldn't need a bunch of fussing with for BrB's specific purposes.
function LootReserve.Data:IsHeroicMirror(itemID)
    return self.TokenMap.HeroicMirrors[itemID] or false;
end

--- Checks if an item has an override that modifies the item level.
--- Not sure what this would be for, but once again shouldn't be an issue I need to worry about.
function LootReserve.Data:GetItemLevelOverride(itemID)
    return self.ItemLevelOverrides[itemID];
end

--- Gets the actual item ID the player wants.
--- eg. if a player reserves "Cenarion Armor" (SoD T1 Druid Tank Chest) it will return the ID of "Scorched Core Chest"
function LootReserve.Data:GetIntendedItem(itemID)
    local intendedItem = self.OtherFactionItems[itemID] or self.IntendedItems[itemID];
    if intendedItem then
        if intendedItem == itemID then
            return intendedItem;
        else
            return self:GetIntendedItem(intendedItem);
        end
    else
        return itemID;
    end
end
