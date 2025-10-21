library(here)
library(dplyr)
library(tidyverse)
library(foreach)

path = "../../data/raw/"

# phs002568: 2 subprojects
proj43_dict <- read.csv(paste0(path,"/phs002568/project43_DICT_transformcopy_v3.csv")) %>% 
  add_column(ph4_datsource = "phs002568_1", .after = "Id")
projS8_dict <- read.csv(paste0(path,"/phs002568/projectS8_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002568_2", .after = "Id")

#phs002575
proj35_dict <- read.csv(paste0(path,"/phs002575/project35_DICT_transformcopy_v3.csv")) %>% 
  add_column(ph4_datsource = "phs002575", .after = "Id")

#phs002584: 2 subprojects
proj9_dict <- read.csv(paste0(path,"/phs002584/project9_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002584_1", .after = "Id")
projS13_dict <- read.csv(paste0(path,"/phs002584/projectS13_DICT_transformcopy.csv")) %>% 
  add_column(ph4_datsource = "phs002584_2", .after = "Id")

#phs002649
proj21_dict <- read.csv(paste0(path,"/phs002649/project21_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002649", .after = "Id")

#phs002660
proj14_dict <- read.csv(paste0(path,"/phs002660/project14_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002660", .after = "Id")

#phs002704
proj15_dict <- read.csv(paste0(path,"/phs002704/project15_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002704", .after = "Id")

#phs002708
proj7_dict <- read.csv(paste0(path,"/phs002708/project7_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002708", .after = "Id")

#phs002777
proj62_dict <- read.csv(paste0(path,"/phs002777/project62_DICT_transformcopy_v3.csv")) %>% 
  add_column(ph4_datsource = "phs002777", .after = "Id") 

#phs002878
proj84_dict <- read.csv(paste0(path,"/phs002878/project84_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002878", .after = "Id")

#phs002946
proj103_dict <- read.csv(paste0(path,"/phs002946/project103_DICT_transformcopy_v2.csv")) %>% 
  add_column(ph4_datsource = "phs002946", .after = "Id")

#phs003127
proj77_dict <- read.csv(paste0(path,"/phs003127/project77_DICT_transformcopy_v3.csv")) %>% 
  add_column(ph4_datsource = "phs003127", .after = "Id")

# merge all
phase4_all_dict <- rbind(proj43_dict, projS8_dict, proj35_dict, proj9_dict, projS13_dict, proj21_dict, proj14_dict, proj15_dict, proj7_dict, proj62_dict, proj84_dict, proj103_dict, proj77_dict)

# Check of all of the columns are the same for each data source
foreach(a = unique(phase4_all_dict$Id)) %do%
  dim(unique(phase4_all_dict[which(phase4_all_dict$Id == a),-2])) # Take away data source column, check if that column name returns only 1 set of dictionary
# [1]  1 15
# Expected result: a list of [1]  1 15

phase4_dict_clean <- phase4_all_dict[,-2] %>% unique()

# proj15 has "fi_afford_balanced_meals", which was not included in the transformcopy DICT
# However, "fi_afford_balanced_meals" can be found in origcopy DICT


fi_afford <- read.csv(paste0(path,"/phs002704/project15_DICT_origcopy_v2.csv")) %>% 
  filter(Id == "fi_afford_balanced_meals")

phase4_dict_clean_fi <- bind_rows(phase4_dict_clean, fi_afford) 
phase4_dict_clean_fi %>% 
  write.csv(paste0("../../data/staged/","phase4_DICT_transformcopy_20240530.csv"), row.names=FALSE)
