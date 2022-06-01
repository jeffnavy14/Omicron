---------------------------
-- Domain Invasion Rewards
---------------------------
local prizes =
{
    [1] =
    {
        ["price"] = 100,
        ["items"] =
        {
            8930, --snowslit_stone
            8939, --snowtip_stone
            8948, --snowdim_stone 
            8957, --snoworb_stone 
			4033, --verdigris_stone 
			3951, --wailing_stone
        },
    },

    [5] =
    {
        ["price"] = 150,
        ["items"] =
        {
            8931, --snowslit_stone_+1
            8940, --snowtip_stone_+1
            8949, --snowdim_stone_+1
            8958, --snoworb_stone_+1
			4034, --verdigris_stone_+1
			3952, --wailing_stone_+1
        },
    },

    [9] =
    {
        ["price"] = 200,
        ["items"] =
        {
            8932, --snowslit_stone_+2
            8941, --snowtip_stone_+2
            8950, --snowdim_stone_+2
            8959, --snoworb_stone_+2
			4035, --verdigris_stone_+2
			3953, --wailing_stone_+2
			22293, --hauksbok-arrow
        },
    },

    [13] =
    {
        ["price"] = 500,
        ["items"] =
        {
			20530, --ohrmazd
			20616, --ipetam
            20759, --macbain
            20901, --inanna
            20809, --kumbhakarna
			20857, --svarga
            20718, --claidheamh_soluis
            21169, --keraunos
            21105, --nehushtan
            20946, --olyndicus
            21224, --phaosphaelia
            21476, --doomsday
            21037, --nenekirimaru
            20989, --izuna
            21404, --linos
			27627, --svalinn
        },
    },

    [17] =
    {
        ["price"] = 1500,
        ["items"] =
        {
		    27731,  --gende._caubeen_+1 
            27877,  --gende._bilaut_+1  
            28021,  --gende._gages_+1   
            28163,  --gende._spats_+1   
            28300,  --gende._galosh._+1 
            27728,  --cizin_helm_+1     
            27874,  --cizin_mail_+1     
            28018,  --cizin_mufflers_+1 
            28160,  --cizin_breeches_+1 
            28297,  --cizin_greaves_+1 
		26108,  --odr-earring
		26107,  --thrud-earring
        },

    },

    [21] =
    {
        ["price"] = 1500,
        ["items"] =
        {
            27729,  --otronif_mask_+1 
            27875,  --otro-harness-1
            28019,  --otronif_gloves_+1 
            28161,  --otronif_brais_+1  
            28298,  --otronif_boots_+1
		    27730,  --iuitl_headgear_+1 
            27876,  --iuitl_vest_+1     
            28020,  --iuitl_wristbands_+1
            28162,  --iuitl_tights_+1   
            28299,  --iuitl_gaiters_+1
		    27732,  --hagondes_hat_+1   
            27878,  --hagondes_coat_+1  
            28022,  --hagondes_cuffs_+1 
            28164,  --hagondes_pants_+1
            28301,  --hag-sabots-1
        },
    },

    [25] =
    {
        ["price"] = 2500,
        ["items"] =
        {
            26733, --yorium_barbuta
            26891, --yorium_cuirass
            27045, --yorium_gauntlet
            27232, --yorium_cuisses
            27402, --yorium_sabatons
            26734, --acro_helm
            26892, --acro_surcoat
            27046, --acro_gauntlets
            27233, --acro_breeches
            27403, --acro_leggings
            26735, --taeon_chapeau
            26893, --taeon_tabard
            27047, --taeon_gloves
            27234, --taeon_tights
            27404, --taeon_boots
        },
    },

    [29] =
    {
        ["price"] = 2500,
        ["items"] =
        {
            26736, --telchine_cap
            26894, --telchine_chas 
            27048, --telchine_gloves
            27235, --telchine_braconi
            27405, --telchine_pigaches
            26737, --helios_band
            26895, --helios_jacket
            27049, --helios_gloves
            27236, --helios_spats
            27406, --helios_boots
        },
    },
}
return prizes
