###
# Campaign mobs
###

# Forces
UPDATE `mob_groups` SET HP = 20000, MP = 12000, minLevel = 80, maxLevel = 80 WHERE name IN (
    'Royal_Guard',
	'Savage_Hound_Condottiere',
	'Scarlet_Boar_Esquire',
	'Norvallen_Knight',
	'Royal_Knight',
    'Steelhide_Protector',
	'Gutrender_Trooper',
	'Spinebeak_Neckchopper',
	'Clan_Reaper_Grunt',
	'Moonfang_Warrior',
	'Aquarian_Caster',
	'Scorpion_Caster',
	'Libran_Caster',
	'Python_Mercenary',
	'Wildcat_Volunteer',
	'1st_Iron_Musketeer',
	'1st_Legionnaire',
	'2nd_Legionnaire',
	'1st_Gold_Musketeer',
	'8th_Iron_Musketeer',
	'Divine_Templar',
	'Divine_Disseminator',
	'Divine_Assassin',
	'Divine_Ascetic',
	'Plenilune_Ronin',
	'DiDhas_Elite_Guard',
	'Waughroon_Heavyshell',
	'Beadeaux_Vanguard',
	'Qulun_Heavyshell',
	'GoBhus_Elite_Raider'
);

# Tower
UPDATE `mob_groups` SET HP = 45000, MP = 0, minLevel = 30, maxLevel = 45 WHERE name IN (
    'Bastion_Gate'
);

# Leaders
UPDATE `mob_groups` SET HP = 25000, MP = 25000, minLevel = 82, maxLevel = 82 WHERE name IN (
    'Valaineral_R_Davilles',
	'Leonoyne',
	'Ashmea_B_Greinner',
	'Feldrautte_I_Rouhent',
	'Yrvaulair_S_Cousseraux',
	'One-eyed_Gwajboj',
    'Conqueror_Bakgodek',
	'Deathlord_Rojgnoj',
	'Jagidbod_of_Clan_Reaper',
	'Alpha_Gnole_Anders',
	'Kayeel-Payeel',
	'Gariri',
	'Zolku-Azolku',
	'Lhu_Mhakaracca',
	'Haja_Zhwan',
	'Bartholomaus',
	'Maximilian',
	'Ludwig',
	'Elivira',
	'Kurt',
	'Vee_Qiqa_the_Decreer',
	'Moo_Ouzi_the_Swiftblade',
	'Muu_Buxu_the_Elusive',
	'Dee_Xalmo_the_Grim',
	'Kazan',
	'DiDha_Adamantfist',
	'BoDho_Hundredfist',
	'DeVyu',
	'BiGho',
	'GoBhu_Herohunter'
);

# spells / skills
UPDATE `mob_pools` SET spellList = 0, skill_list_id = 0 WHERE name IN (

     'Valaineral_R_Davilles'
);

# BGM Music
UPDATE `zone_settings` SET `battlesolo`=247, `battlemulti`=247 WHERE zoneid IN (
    80,
    81,
    82,
    83,
    84,
    85,
    175,
    87,
    88,
    89,
    90,
    91,
    92,
    171,
    94,
    95,
    96,
    97,
    98,
    99,
    164,
    136,
    137,
    138,
    155,
    156
);