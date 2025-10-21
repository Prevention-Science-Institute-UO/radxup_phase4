library(here)
library(dplyr)
library(tidyverse)
library(stringi)
library(haven)

source("../functions/split_label.r")

path = "../../data/staged/"


phase4_datadict_transform <- read.csv(paste0(path,"phase4_DICT_transformcopy_20240530.csv"))


phase4_data_transform <- read.csv(paste0("../../data/processed/","phase4_all_transformcopy.csv"), colClasses=c("nih_record_id"="character"))


# Transform -------
numcol_t <- dim(phase4_data_transform)[2]

phase4_datadict_transform$Enumeration <- stri_trim_right(
  gsub("\"", "", phase4_datadict_transform$Enumeration)
)

phase4_datadict_transform$Additional.Missing.Value.Codes <- stri_trim_right(
  gsub("\"", "", phase4_datadict_transform$Additional.Missing.Value.Codes)
)

phase4_datadict_transform$all_labels <- paste(phase4_datadict_transform$Enumeration,'|', phase4_datadict_transform$Additional.Missing.Value.Codes)

missinglabels <- c("Reason Unknown" = -9999, "This information was not provided by the originator (participant or sensor)" = -9960, "Data was invalid (wrong format, wrong or unknown units, not parseable, or impossible value)" = -9985, "This element (question or variable) was not presented to user for collection (reason unspecified)" = -9944)

phase4_data_transform$dob_mdy <- as.Date(phase4_data_transform$dob_mdy, "yyyy-mm-dd") #failed
phase4_data_transform$alcohol_date_mdy <- as.Date(phase4_data_transform$alcohol_date_mdy)
phase4_data_transform$consentdt_mdy <- as.Date(phase4_data_transform$consentdt_mdy, "yyyy-mm-dd") #failed
phase4_data_transform$covid_test_date_mdy <- as.Date(phase4_data_transform$covid_test_date_mdy, "yyyy-mm-dd") #failed
phase4_data_transform$hlthstat_date_mdy <- as.Date(phase4_data_transform$hlthstat_date_mdy)
phase4_data_transform$housing_date_mdy <- as.Date(phase4_data_transform$housing_date_mdy)
phase4_data_transform$iden_date_mdy <- as.Date(phase4_data_transform$iden_date_mdy, "yyyy-mm-dd") #failed
phase4_data_transform$med_hx_date_mdy <- as.Date(phase4_data_transform$med_hx_date_mdy)
phase4_data_transform$sociodem_date_mdy <- as.Date(phase4_data_transform$sociodem_date_mdy)
phase4_data_transform$sym_date_mdy <- as.Date(phase4_data_transform$sym_date_mdy)
phase4_data_transform$test_date_mdy <- as.Date(phase4_data_transform$test_date_mdy)
phase4_data_transform$vacc_date_mdy <- as.Date(phase4_data_transform$vacc_date_mdy)
phase4_data_transform$work_ppe_date_mdy <- as.Date(phase4_data_transform$work_ppe_date_mdy, "yyyy-mm-dd") #failed

for (i in 1:numcol_t) {
  
  # Skip _mdy columns
  if (!grepl("_mdy", colnames(phase4_data_transform)[i]) & class(phase4_data_transform[,i]) != "character"){
    # if (!(colnames(data_crisp)[i] %like% "%DOB%")){
    
    ind <- which(phase4_datadict_transform$Id == colnames(phase4_data_transform)[i])
  
    if (length(ind) != 0){
      print(ind)
      
      phase4_data_transform[, i] = haven::labelled(
        phase4_data_transform[, i],
        
        labels = split_label(phase4_datadict_transform$all_labels[ind]),
        label = phase4_datadict_transform$Label[ind]
      )
    # }
  }
  }
}

expss::var_lab(phase4_data_transform$ph4_datsource) <- "The phs number of the RADx project this record originally comes from"

expss::var_lab(phase4_data_transform$dob_mdy) <- phase4_datadict_transform$Label[37]
expss::var_lab(phase4_data_transform$alcohol_date_mdy) <- phase4_datadict_transform$Label[3]
expss::var_lab(phase4_data_transform$consentdt_mdy) <- phase4_datadict_transform$Label[26]
expss::var_lab(phase4_data_transform$covid_test_date_mdy) <- phase4_datadict_transform$Label[233]
expss::var_lab(phase4_data_transform$hlthstat_date_mdy) <- phase4_datadict_transform$Label[47]
expss::var_lab(phase4_data_transform$housing_date_mdy) <- phase4_datadict_transform$Label[51]
expss::var_lab(phase4_data_transform$iden_date_mdy) <- phase4_datadict_transform$Label[52]
expss::var_lab(phase4_data_transform$med_hx_date_mdy) <- phase4_datadict_transform$Label[67]
expss::var_lab(phase4_data_transform$sociodem_date_mdy) <- phase4_datadict_transform$Label[111]
expss::var_lab(phase4_data_transform$sym_date_mdy) <- phase4_datadict_transform$Label[243]
expss::var_lab(phase4_data_transform$test_date_mdy) <- phase4_datadict_transform$Label[114]
expss::var_lab(phase4_data_transform$vacc_date_mdy) <- phase4_datadict_transform$Label[140]
expss::var_lab(phase4_data_transform$work_ppe_date_mdy) <- phase4_datadict_transform$Label[163]

write_sav(phase4_data_transform, paste0("../../data/processed/","phase4_all_transformcopy.sav"))

