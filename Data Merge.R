


pacman::p_load(
  tidyverse,
  rio,                                     # to import data
  here,                                     # to locate files 
  readxl
)

  
  # Assign work directory for all three Financial Data
  # Set up work directory
  # Convert the path to a character string
  # Find the position of the word "Data"
  # Extract the substring up to and including the word "Data"
  # Append "Clean Data sets/State Type" after "Data"
  fp_str <- as.character(getwd())
  pos <- regexpr("SDoH Indicators", fp_str)
  fp.mod <- substr(fp_str, 1, pos + attr(pos, "match.length") - 1)
  
  fp.acs <- paste0(fp.mod, "/ACS Indicators/", paste("2022_poverty.csv", sep = ""))
  fp.acs2 <- paste0(fp.mod, "/ACS Indicators/", paste("ACS_2022.csv", sep = ""))
  fp.acs3 <- paste0(fp.mod, "/ACS Indicators/", paste("SAIPE2022red.csv", sep = ""))
  fp.acs4 <- paste0(fp.mod, "/ACS Indicators/", paste("SAHIE2021red.csv", sep = ""))
  fp.ahrf <- paste0(fp.mod, "/Area Health Resource File Indicators/", paste("AHRF_2021.csv", sep = ""))
  fp.ahrf2 <- paste0(fp.mod, "/Area Health Resource File Indicators/", paste("AHRF_2022.csv", sep = ""))
  fp.ahrf3 <- paste0(fp.mod, "/Area Health Resource File Indicators/", paste("ahrf2023.csv", sep = ""))
  fp.atlas <- paste0(fp.mod, "/Atlas Data/", paste("Atlas_SDOH_from EDAV_Oct302024.csv", sep = ""))
  fp.env <- paste0(fp.mod, "/Food Environment Atlas Indicators/", paste("FoodEnvironmentAtlas_2016.csv", sep = ""))
  fp.bls <- paste0(fp.mod, "/Bureau of Labor Statistics/2022/", paste("laucnty22SAS.csv", sep = ""))
  fp.diab <- paste0(fp.mod, "/Division of Diabetes/", paste("DDT_data_2021.csv", sep = ""))
  fp.neph <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Agriculture Land Usage/", paste("AgricultureLandUsage_2021.csv", sep = ""))
  fp.neph2 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Developed Land/", paste("DevelopedLand_2021.csv", sep = ""))
  fp.neph3 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Forest Coverage/", paste("ForestCoverage_2021.csv", sep = ""))
  fp.neph4 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Highway Proximity/", paste("HighwayProximity_2020.csv", sep = ""))
  fp.neph5 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Historical Drought/", paste("HistoricalDrought_2021.csv", sep = ""))
  fp.neph6 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Historical Temperature and Heat Index/Extreme Heat Days/", paste("ExtremeHeatDays_2022.csv", sep = ""))
  fp.neph7 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Historical Temperature and Heat Index/Extreme Heat Events/", paste("ExtremeHeatEvents_2022.csv", sep = ""))
  fp.neph8 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Impervious Surface/", paste("ImperviousSurface_2021.csv", sep = ""))
  fp.neph9 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Ozone/", paste("Ozone_2020.csv", sep = ""))
  fp.neph10 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Park Access/", paste("ParkAccessPCT_2020.csv", sep = ""))
  fp.neph11 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Water Coverage/", paste("WaterCoverage_2021.csv", sep = ""))
  fp.neph12 <- paste0(fp.mod, "/National Environmental Public Health Tracking Network Indicators/Air Quality/", paste("AirQuality_2020.csv", sep = ""))
  fp.oii <- paste0(fp.mod, "/Opportunity Insights Indicators/", paste("Opportunity Insights_2022.csv", sep = ""))
  fp.rwjf <- paste0(fp.mod, "/RWJF Indicators/RWJF 2024 (contains 2022 data)/", paste("RWJF_2024.csv", sep = ""))
  fp.vera <- paste0(fp.mod, "/Trends.Vera Indicators/", paste("Trends_Vera_2018.csv", sep = ""))
  
  # Merge CVD Data
  cvd_raw <- st_read(here("Data", "CVD", "allcvd_20_22.xlsx")) # State Boundary



  acs.pov <- read_csv(fp.acs, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  acs.dem <- read_csv(fp.acs2, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  acs.saipe <- read_csv(fp.acs3, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  acs.sahie <- read_csv(fp.acs4, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  ahrf.21 <- read_csv(fp.ahrf, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  ahrf.22 <- read_csv(fp.ahrf2, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  ahrf.23 <- read_csv(fp.ahrf3, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  atlas <- read_csv(fp.atlas, col_names = TRUE, trim_ws = FALSE) # Read the CSV file
  diab <- read_csv(fp.diab, col_names = TRUE, trim_ws = FALSE) # Read the CSV file
  env.food <- read_csv(fp.env, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  bls.unemp <- read_csv(fp.bls, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.agr <- read_csv(fp.neph, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.dev <- read_csv(fp.neph2, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.for <- read_csv(fp.neph3, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.hiw <- read_csv(fp.neph4, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.drout <- read_csv(fp.neph5, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.heatd <- read_csv(fp.neph6, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.heate <- read_csv(fp.neph7, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.imp <- read_csv(fp.neph8, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.ozon <- read_csv(fp.neph9, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.park <- read_csv(fp.neph10, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.wat <- read_csv(fp.neph11, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  neph.air <- read_csv(fp.neph12, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  oppii <- read_csv(fp.oii, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file  
  rwjf <- read_csv(fp.rwjf, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file
  vera <- read_csv(fp.vera, col_names = TRUE, trim_ws = FALSE)  # Read the CSV file  
  
  # Clean data by assigning numeric values of all necessary variables

    acs.pov <- acs.pov %>%
      separate(GEO_ID, into = c("part1", "FIPS"), sep = 9) %>%
      select(FIPS, NAME) %>%
      slice(-1)
        
    acs.dem <- acs.dem %>%
      rename(FIPS = GEOID) %>%
      select(-year)
    
    acs.saipe <- acs.saipe %>%
      rename(FIPS = stcty_fips) %>%
      mutate(FIPS = str_pad(FIPS, width = 5, pad = "0")) %>%
      mutate(FIPS = as.character(FIPS))
    
    acs.sahie <- acs.sahie %>%
      rename(FIPS = stcty_fips) %>%
      mutate(FIPS = str_pad(FIPS, width = 5, pad = "0")) %>%
      mutate(FIPS = as.character(FIPS))
    
    ahrf.21 <- ahrf.21 %>%
      rename(FIPS = fips) %>%
      select(FIPS, PatCarCardio_COUNT, PrimaryCarePhys_COUNT)
    
    ahrf.22 <- ahrf.22 %>%
      rename(FIPS = fips) %>%
      select(FIPS, APRNs_COUNT)
    
    ahrf.23 <- ahrf.23 %>%
      rename(FIPS = fips_st_cnty) %>%
      rename(StampSNAP_PCT = food_stamp_recpnt_snap_est_20) %>%
      mutate(FIPS = str_pad(FIPS, width = 5, pad = "0")) %>%
      mutate(FIPS = as.character(FIPS)) %>%
      select(FIPS, StampSNAP_PCT, food_stamp_recpnt_snap_est_19)
    
    atlas <- atlas %>%
      rename(FIPS = stcty_fips) %>%
      select(FIPS, stg_hosp, total_cost, prev_hd, pl_highchol) %>%
      mutate(
        FIPS = str_pad(FIPS, width = 5, pad = "0"),
        FIPS = as.character(FIPS),
        stg_hosp = replace(stg_hosp, stg_hosp == -9999, NA),
        total_cost = replace(total_cost, total_cost == -9999, NA),
        prev_hd = replace(prev_hd, prev_hd == -9999, NA),
        prev_hd = replace(prev_hd, prev_hd == -1, NA),
        pl_highchol = replace(pl_highchol, pl_highchol == -9999, NA),
        pl_highchol = replace(pl_highchol, pl_highchol == -1, NA)
      )
    
    diab <- diab %>%
      rename(FIPS = stcty_fips)  %>%
      mutate(FIPS = as.character(FIPS),
             dm_prev_adj = as.numeric(dm_prev_adj),
             LTPIA_prev_adj = as.numeric(LTPIA_prev_adj),
             ob_prev_adj = as.numeric(ob_prev_adj)) 
    
    env.food <- env.food %>%
      rename(FIPS = fips) %>%
      mutate(FoodSwamp_RATIO = ifelse(FoodSwamp_RATIO == "#DIV/0!", NA, FoodSwamp_RATIO),
             FoodSwamp_RATIO = as.numeric(FoodSwamp_RATIO)) %>%
      select(FIPS, FoodSwamp_RATIO)
    
    bls.unemp <- bls.unemp %>%
      mutate(
        StateFIPSCode = as.numeric(StateFIPSCode), # Ensure numeric
        CountyFIPSCode = as.numeric(CountyFIPSCode) # Ensure numeric
      ) %>%
      rename(Unemployment_RT = `Unemployment Rate`)%>%
      mutate(
        StateFIPSCode = sprintf("%02d", StateFIPSCode), # Format as two digits
        CountyFIPSCode = sprintf("%03d", CountyFIPSCode), # Format as three digits
        FIPS = as.character(paste0(StateFIPSCode, CountyFIPSCode)), # Combine into FIPS
        Unemployment_RT = as.numeric(Unemployment_RT)) %>%
      select(FIPS, Unemployment_RT) # Drop intermediate columns
    
    neph.agr <- neph.agr %>%
      rename(FIPS = fips) %>%
      mutate(AgLandUse_PCT = as.numeric(gsub("%", "", AgLandUse_PCT))) %>%
      select(FIPS, AgLandUse_PCT)
    
    neph.dev <- neph.dev %>%
      rename(FIPS = fips) %>%
      mutate(LandDev_PCT = as.numeric(gsub("%", "", LandDev_PCT))) %>%
      select(FIPS, LandDev_PCT)
    
    neph.for <- neph.for %>%
      rename(FIPS = fips) %>%
      mutate(ForestCover_PCT = as.numeric(gsub("%", "", ForestCover_PCT))) %>%
      select(FIPS, ForestCover_PCT)
    
    neph.hiw <- neph.hiw %>%
      rename(FIPS = fips) %>%
      mutate(HighwayProximity_PCT = as.numeric(gsub("%", "", HighwayProximity_PCT))) %>%
      select(FIPS, HighwayProximity_PCT)

    neph.drout <- neph.drout %>%
      rename(FIPS = fips) %>%
      mutate(WeeksModDrought_PCT = as.numeric(gsub("%", "", WeeksModDrought_PCT))) %>%
      select(FIPS, WeeksModDrought_PCT)
    
    neph.heatd <- neph.heatd %>%
      rename(FIPS = fips) %>%
      select(FIPS, ExtremeHeatDays_COUNT)
    
    neph.heate <- neph.heate %>%
      rename(FIPS = fips) %>%
      select(FIPS, ExtremeHeatEvents_COUNT)
    
    neph.imp <- neph.imp %>%
      rename(FIPS = fips) %>%
      mutate(ImpervSurface_PCT = as.numeric(gsub("%", "", ImpervSurface_PCT))) %>%
      select(FIPS, ImpervSurface_PCT)
    
    neph.ozon <- neph.ozon %>%
      rename(FIPS = fips) %>%
      select(FIPS, DaysOverStandard_COUNT)
    
    neph.park <- neph.park %>%
      rename(FIPS = fips) %>%
      mutate(FIPS = str_pad(FIPS, width = 5, pad = "0")) %>%
      mutate(
        FIPS = as.character(FIPS),
        ParkWithinOneMi_PCT = as.numeric(gsub("%", "", ParkWithinOneMi_PCT)),
        ParkWithinHalfMi_PCT = as.numeric(gsub("%", "", ParkWithinHalfMi_PCT))
      ) %>%
      select(FIPS, ParkWithinOneMi_PCT, ParkWithinHalfMi_PCT)
    
    neph.wat <- neph.wat %>%
      rename(FIPS = fips) %>%
      mutate(WaterCover_PCT = as.numeric(gsub("%", "", WaterCover_PCT))) %>%
      select(FIPS, WaterCover_PCT)
    
    neph.air <- neph.air %>%
      rename(FIPS = fips) %>%
      mutate(AirQuality_PM = as.numeric(gsub("%", "", AirQuality_PM ))) %>%
      select(FIPS, AirQuality_PM) %>%
      mutate(FIPS = as.character(FIPS))
    
    oppii <- oppii %>%
      rename(FIPS = fips) %>%
      select(FIPS, volunteer_PCT, civic_orgs_PER1K, clustering_PCT, support_RATIO, EconConnectedness) #%>%
      #mutate(across(c(volunteer_PCT, clustering_PCT), ~ . * 100))
    
    rwjf <- rwjf %>%
      slice(-c(1, 2)) %>%
      mutate(FIPS = str_pad(FIPS, width = 5, pad = "0")) %>%
      rename_with(~ trimws(.)) %>%  # Remove leading and trailing spaces
      mutate(across(everything(), ~ gsub("%", "", .))) %>%
      select(-Year, -State, -County, -starts_with("YLL_RT"), -starts_with("PreventHospStay"), -Youth_PCT) %>%
      mutate(across(-c(1), ~ as.numeric(.)))
    
    vera <- vera %>%
      rename(FIPS = fips) %>%
      select(FIPS, TotalJailPop_COUNT)
    
    # Lastly extract relevant columns from CVD
    
    cvd.all <- cvd_raw %>%
      select(stcty_fips, ALL_A_ALL, ALL_A_35UP) %>%
      rename(FIPS = stcty_fips) %>%
      rename(allcvd = ALL_A_ALL) %>%
      rename(allcvd35 = ALL_A_35UP)
    
    # List all the tables you want to join
    tables <- list(acs.pov, acs.dem, acs.saipe, acs.sahie, ahrf.21, ahrf.22, ahrf.23, atlas, 
                   diab, env.food, bls.unemp, neph.agr, neph.dev, neph.for, neph.hiw, 
                   neph.drout, neph.heatd, neph.heate, neph.imp, neph.ozon, neph.park, 
                   neph.wat, neph.air, oppii, vera, rwjf, cvd.all)
    
    # Perform a left join across all tables by FIPS
    final_data <- reduce(tables, ~ left_join(.x, .y, by = "FIPS"))
    
    final_data <- final_data %>%
      mutate(volunteer_PCT =volunteer_PCT*100) %>%
      mutate(civic_orgs_PER1K = civic_orgs_PER1K*100) %>%
      mutate(clustering_PCT = clustering_PCT*100)
      
    
    pos <- regexpr("Data Cleaning", fp_str)
    fp.mod <- substr(fp_str, 1, pos + attr(pos, "match.length") - 1)
    new_path <- paste0(fp.mod, "/merged_data.csv", sep="")
    
    write_csv(final_data, file = new_path)
  
  