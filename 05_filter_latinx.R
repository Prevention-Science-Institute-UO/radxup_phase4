library(haven)
library(dplyr)

path = "../../data/processed/"

phase4 <- read_sav(paste0(path,"phase4_all_transformcopy_wave.sav")) %>% 
  filter(nih_ethnicity == 1) %>% 
  mutate(
    min_baselinedate = pmin(alcohol_date_mdy,
                                         consentdt_mdy,
                                         covid_test_date_mdy,
                                         hlthstat_date_mdy,
                                         housing_date_mdy,
                                         iden_date_mdy,
                                         med_hx_date_mdy,
                                         sociodem_date_mdy,
                                         sym_date_mdy,
                                         test_date_mdy,
                                         vacc_date_mdy,
                                         work_ppe_date_mdy
        , na.rm = TRUE)
  ) %>% 
  mutate(
    max_baselinedate = pmax(alcohol_date_mdy,
                            consentdt_mdy,
                            covid_test_date_mdy,
                            hlthstat_date_mdy,
                            housing_date_mdy,
                            iden_date_mdy,
                            med_hx_date_mdy,
                            sociodem_date_mdy,
                            sym_date_mdy,
                            test_date_mdy,
                            vacc_date_mdy,
                            work_ppe_date_mdy
                            , na.rm = TRUE)
  ) %>% 
  mutate(
    agreement = min_baselinedate == max_baselinedate
      ) 

phase4$vaccine_last_dte <- as.Date(phase4$vaccine_last_dte, "%Y-%m-%d")
phase4$vaccine_rec1_dte <- as.Date(phase4$vaccine_rec1_dte, "%Y-%m-%d")

expss::var_lab(phase4$vaccine_last_dte) <- "On what date did you receive your most recent shot of the vaccine?"
expss::var_lab(phase4$vaccine_rec1_dte) <- "On what date did you receive your first shot of the vaccine?"

write_sav(phase4, paste0(path,"phase4_all_latinxonly.sav"))
