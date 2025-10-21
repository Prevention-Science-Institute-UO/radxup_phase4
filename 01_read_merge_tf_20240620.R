# Exclude JHU non-research patients as they did not consent and complete CDEs, per meeting decision on 2024.05.20
# Exclude Utah (phs002575) as they do not have CDEs, per meeting decision on 2024.06.17

library(here)
library(dplyr)
library(tidyverse)

path = "../../data/raw/"

# phs002568: 2 subprojects
proj43 <- read.csv(paste0(path,"/phs002568/project43_DATA_transformcopy_v3.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002568_1", .after = "nih_record_id")
projS8 <- read.csv(paste0(path,"/phs002568/projectS8_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002568_2", .after = "nih_record_id")

#phs002575
# proj35 <- read.csv(paste0(path,"/phs002575/project35_DATA_transformcopy_v3.csv"), colClasses=c("nih_record_id"="character")) %>% 
#   add_column(ph4_datsource = "phs002575", .after = "nih_record_id")

#phs002584
proj9 <- read.csv(paste0(path,"/phs002584/project9_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002584_1", .after = "nih_record_id")
projS13 <- read.csv(paste0(path,"/phs002584/projectS13_DATA_transformcopy.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002584_2", .after = "nih_record_id")

#phs002649
proj21 <- read.csv(paste0(path,"/phs002649/project21_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002649", .after = "nih_record_id")

#phs002660
proj14 <- read.csv(paste0(path,"/phs002660/project14_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002660", .after = "nih_record_id")

proj14 <- proj14 %>% 
  filter(redcap_repeat_instance == -9960) %>% 
  write.csv("../../data/baseline/phs002660/project14_BASELINE_transformcopy.csv", row.names=FALSE)

proj14_research <- read.csv(paste0(path,"../baseline/phs002660/project14_BASELINE_transformcopy.csv"), colClasses=c("nih_record_id"="character"))

#phs002704
proj15 <- read.csv(paste0(path,"/phs002704/project15_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002704", .after = "nih_record_id")

#phs002708
proj7 <- read.csv(paste0(path,"/phs002708/project7_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002708", .after = "nih_record_id")
                          
#phs002777
proj62 <- read.csv(paste0(path,"/phs002777/project62_DATA_transformcopy_v3.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002777", .after = "nih_record_id")

#phs002878
proj84 <- read.csv(paste0(path,"/phs002878/project84_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002878", .after = "nih_record_id")

#phs002946
proj103 <- read.csv(paste0(path,"/phs002946/project103_DATA_transformcopy_v2.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs002946", .after = "nih_record_id")

#phs003127
proj77 <- read.csv(paste0(path,"/phs003127/project77_DATA_transformcopy_v3.csv"), colClasses=c("nih_record_id"="character")) %>% 
  add_column(ph4_datsource = "phs003127", .after = "nih_record_id")

# merge all
phase4_all <- merge(proj43, projS8, all.x=TRUE, all.y = TRUE) %>% 
  # merge(proj35, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj9, all.x=TRUE, all.y = TRUE) %>% 
  merge(projS13, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj21, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj14_research, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj15, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj7, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj62, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj84, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj103, all.x=TRUE, all.y = TRUE) %>% 
  merge(proj77, all.x=TRUE, all.y = TRUE)

phase4_all$nih_record_id <- as.character(phase4_all$nih_record_id)

phase4_all %>% 
  write.csv(paste0("../../data/processed/","phase4_all_transformcopy.csv"), row.names=FALSE)
