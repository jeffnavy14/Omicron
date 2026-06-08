---------------------------------------------------
--  Desiccation
--  Family: Sandworm
--  Description: Removes most if not all equipment and resets job ability timers. Additional effect: Knockback
--  Type: Enfeebling
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single
--  Notes:
---------------------------------------------------
local mobskillObject = {}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    for i = xi.slot.MAIN, xi.slot.BACK do
        target:unequipItem(i)
    end

    local mJob = target:getMainJob()
    local sJob = target:getSubJob()

    local abilities =
    {
        {ability = {16, 31, 32, 33, 34, 35, 149, 150, 226, 252, 267, 323},                                               recastID = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 11, 254}}, -- WAR
        {ability = {17, 36, 37, 38, 39, 40, 82, 151, 152, 227, 253, 269, 324},                                           recastID = {0, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 31, 254}}, -- MNK
        {ability = {18, 74, 153, 154, 245, 246, 270, 271, 325},                                                          recastID = {0, 26, 27, 28, 29, 30, 32, 33, 254}}, -- WHM
        {ability = {19, 75, 254, 272, 273, 326, 388},                                                                    recastID = {0, 38, 39, 34, 35, 254, 12}}, -- BLM
        {ability = {20, 83, 247, 274, 275, 327},                                                                         recastID = {0, 49, 50, 36, 37, 254}}, -- RDM
        {ability = {21, 41, 42, 43, 44, 45, 76, 84, 155, 156, 228, 236, 276, 321, 328},                                  recastID = {0, 60, 62, 63, 64, 65, 66, 69, 67, 68, 61, 69, 40, 240, 254}}, -- THF
        {ability = {22, 46, 47, 48, 79, 92, 157, 158, 255, 277, 278, 329, 394},                                          recastID = {0, 73, 74, 75, 76, 77, 78, 79, 80, 41, 42, 254, 378}}, -- PLD
        {ability = {23, 49, 50, 51, 77, 159, 160, 256, 279, 280, 330, 389},                                              recastID = {0, 85, 86, 87, 88, 89, 90, 91, 43, 44, 254, 373}}, -- DRK
        {ability = {24, 52, 53, 54, 69, 70, 71, 72, 73, 78, 85, 161, 162, 225, 251, 281, 282, 331, 387},                 recastID = {0, 97, 98, 99, 100, 101, 101, 102, 101, 103, 104, 105, 106, 107, 102, 45, 46, 254, 94}}, -- BST
        {ability = {25, 163, 164, 229, 283, 284, 332},                                                                   recastID = {0, 109, 110, 112, 47, 48, 254}}, -- BRD
        {ability = {26, 56, 57, 58, 59, 60, 86, 165, 166, 224, 257, 285, 286, 333},                                      recastID = {0, 121, 122, 123, 124, 125, 126, 127, 128, 129, 126, 51, 52, 254}}, -- RNG
        {ability = {27, 62, 63, 64, 167, 168, 173, 174, 230, 258, 287, 288, 320, 334},                                   recastID = {0, 133, 134, 135, 1356, 137, 138, 139, 140, 141, 53, 54, 132, 254}}, -- SAM
        {ability = {28, 171, 248, 249, 259, 291, 335},                                                                   recastID = {0, 145, 146, 147, 148, 57, 254}}, -- NIN
        {ability = {29, 61, 65, 66, 67, 68, 80, 87, 169, 170, 260, 292, 293, 295, 318, 319, 336},                        recastID = {0, 163, 157, 158, 159, 160, 162, 161, 164, 165, 166, 58, 167, 70, 238, 239, 254}}, -- DRG
        {ability = {30, 88, 89, 90, 91, 172, 232, 250, 296, 337, 385},                                                   recastID = {0, 170, 171, 172, 173, 174, 175, 176, 71, 254, 108}}, -- SMN
        {ability = {93, 94, 95, 175, 176, 297, 298, 338},                                                                recastID = {0, 181, 182, 183, 184, 185, 81, 254}}, -- BLU
        {ability = {96, 97, 123, 125, 133, 177, 178, 301, 392},                                                          recastID = {0, 193, 194, 195, 196, 197, 198, 84, 96}}, -- COR
        {ability = {135, 136, 137, 138, 139, 140, 141, 179, 180, 266, 309, 310, 322, 340},                               recastID = {0, 205, 206, 207, 208, 209, 210, 211, 212, 213, 114, 115, 214, 254}}, -- PUP
        {ability = {181, 184, 190, 191, 192, 193, 194, 195, 196, 201, 204, 206, 237, 238, 239, 261, 264, 311, 341, 384}, recastID = {0, 216, 217, 186, 187, 188, 215, 225, 218, 220, 221, 222, 219, 224, 223, 236, 226, 189, 254, 229}}, -- DNC
        {ability = {210, 211, 212, 214, 215, 223, 233, 244, 265, 342},                                                   recastID = {0, 228, 232, 230, 231, 233, 234, 235, 237, 254}}, -- SCH
        {ability = {343, 345, 346, 348, 349, 350, 351, 352, 353, 354, 355, 377, 386},                                    recastID = {0, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 130, 93}}, -- GEO
        {ability = {344, 356, 358, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 378, 383},                     recastID = {241, 0, 10, 23, 24, 25, 59, 72, 113, 116, 117, 118, 119, 120, 131, 242}}, -- RUN
    }

    for i = 1, #abilities[mJob].ability do
        local abilityRecast = GetAbility(abilities[mJob].ability[i]):getRecast()
        -- printf("test.lua onTrigger ABILITY: [%i]  RECAST: [%i]", abilities[mJob].ability[i], getAbility(abilities[mJob].ability[i]):getRecast())
        target:addRecast(xi.recast.ABILITY, abilities[mJob].recastID[i], abilityRecast)
    end

    for i = 1, #abilities[sJob].ability do
        local abilityRecast = GetAbility(abilities[sJob].ability[i]):getRecast()
        -- printf("test.lua onTrigger ABILITY: [%i]  RECAST: [%i]", abilities[sJob].ability[i], getAbility(abilities[sJob].ability[i]):getRecast())
        target:addRecast(xi.recast.ABILITY, abilities[sJob].recastID[i], abilityRecast)
    end

    skill:setMsg(xi.msg.basic.NONE)

    return
end

return mobskillObject
