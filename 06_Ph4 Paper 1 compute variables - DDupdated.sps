* Encoding: UTF-8.


.*********************************************************************
***************
*************** 9/4/24 Phase4 4 Analysis Variables Syntax
***************
*********************************************************************



.*****Latine 
 
COMPUTE Latine=nih_ethnicity.
EXECUTE.

RECODE Latine (-9960=SYSMIS) (1=1) (0,97=0)(98,99=SYSMIS).
VARIABLE LABELS Latine 'Latine 1 else 0'.
EXECUTE.

.***Origin

COMPUTE MexOrig= race_ethn_hispanic_detail_2___1.
EXECUTE.

RECODE MexOrig (-9960=SYSMIS) (1=1) (0=0).
VARIABLE LABELS MexOrig 'MexOrig 1 else 0'.
EXECUTE.

COMPUTE PuertoOrig= race_ethn_hispanic_detail_2___2.
EXECUTE.

RECODE PuertoOrig (-9960=SYSMIS) (1=1) (0=0).
VARIABLE LABELS MexOrig 'MexOrig 1 else 0'.
EXECUTE.

COMPUTE OthOrig= race_ethn_hispanic_detail_2___4.
EXECUTE.

RECODE OthOrig (-9960=SYSMIS) (1=1) (0=0).
VARIABLE LABELS OthOrig 'Other Latine 1 else 0'.
EXECUTE.


.*****sex 

 
COMPUTE female=nih_sex.
EXECUTE.

COMPUTE male=nih_sex.
EXECUTE.

RECODE female (-9960=SYSMIS) (0=1) (1,2,3=0)(96,99=SYSMIS).
VARIABLE LABELS female 'female 1 else 0'.
EXECUTE.

RECODE male (-9960=SYSMIS) (1=1) (0,2,3=0)(96,99=SYSMIS).
VARIABLE LABELS male 'female 1 else 0'.
EXECUTE.


.*****gender identity

 
COMPUTE id_female= gender_identity_term_2.
EXECUTE.

COMPUTE id_male= gender_identity_term_2.
EXECUTE.

RECODE id_female (-9960=SYSMIS) (1,4=1) (0,3,5,6,7,96=0)(99=SYSMIS).
VARIABLE LABELS id_female 'id as female 1 else 0'.
EXECUTE.

RECODE id_male (-9960=SYSMIS) (0,3=1) (1,4,5,6,7,96=0)(99=SYSMIS).
VARIABLE LABELS id_female 'id as male 1 else 0'.
EXECUTE.

  
.*****VACCINE CONCERN SCALE
 
RECODE vaccine_concerns_3___1 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco1.
VARIABLE LABELS  vaxco1 'vax concern allergic'.
EXECUTE.
RECODE vaccine_concerns_3___2 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco2.
VARIABLE LABELS  vaxco2 'vax concern needles'.
EXECUTE.
RECODE vaccine_concerns_3___3 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco3.
VARIABLE LABELS  vaxco3 'vax concern not get really sick'.
EXECUTE.
RECODE vaccine_concerns_3___4 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco4.
VARIABLE LABELS  vaxco4 'vax concern side effects'.
EXECUTE.
RECODE vaccine_concerns_3___5 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco5.
VARIABLE LABELS  vaxco5 'vax concern not work'.
EXECUTE.
RECODE vaccine_concerns_3___6 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco6.
VARIABLE LABELS  vaxco6 'vax concern not trust'.
EXECUTE.
RECODE vaccine_concerns_3___7 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco7.
VARIABLE LABELS  vaxco7 'vax concern covid not bad'.
EXECUTE.
RECODE vaccine_concerns_3___8 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco8.
VARIABLE LABELS  vaxco8 'vax concern cost'.
EXECUTE.
RECODE vaccine_concerns_3___9 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco9.
VARIABLE LABELS  vaxco9 'vax not enough info'.
EXECUTE.
RECODE vaccine_concerns_3___10 (-9960=SYSMIS)(0=0)(1=1) INTO vaxco10.
VARIABLE LABELS  vaxco10 'vax othert'.
EXECUTE.


COMPUTE VAXCO=sum(vaxco1,vaxco2,vaxco3,vaxco4,vaxco5,vaxco6,vaxco7,vaxco8,vaxco9,vaxco10).
VARIABLE LABELS  VAXCO 'sum 10 vax concern items'.
EXECUTE.


.*****VACCINE REASONS SCALE
 
RECODE vaccine_reasons_3___1 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre1.
VARIABLE LABELS  vaxre1 'vax reason family safe'.
EXECUTE.
RECODE vaccine_reasons_3___2 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre2.
VARIABLE LABELS  vaxre2 'vax reasons community safe'.
EXECUTE.
RECODE vaccine_reasons_3___3 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre3.
VARIABLE LABELS  vaxre3 'vax reasons self safe'.
EXECUTE.
RECODE vaccine_reasons_3___4 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre4.
VARIABLE LABELS  vaxre4 'vax reason chronic health prob'.
EXECUTE.
RECODE vaccine_reasons_3___5 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre5.
VARIABLE LABELS  vaxre5 'vax reason doctor told '.
EXECUTE.
RECODE vaccine_reasons_3___6 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre6.
VARIABLE LABELS  vaxre6 'vax reasons not get sick'.
EXECUTE.
RECODE vaccine_reasons_3___7 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre7.
VARIABLE LABELS  vaxre7 'vax reason want to be safe around people '.
EXECUTE.
RECODE vaccine_reasons_3___8 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre8.
VARIABLE LABELS  vaxre8 'vax reason believe is needed '.
EXECUTE.
RECODE vaccine_reasons_3___9 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre9.
VARIABLE LABELS  vaxre9 'vax reason other '.
EXECUTE.
RECODE vaccine_reasons_3___10 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre10.
VARIABLE LABELS  vaxre10 'vax reason work '.
EXECUTE.
RECODE vaccine_reasons_3___11 (-9960=SYSMIS)(0=0)(1=1) INTO vaxre11.
VARIABLE LABELS  vaxre11 'vax reason travel '.
EXECUTE.

COMPUTE VAXRE=sum(vaxre1,vaxre2,vaxre3,vaxre4,vaxre5,vaxre6,vaxre7,vaxre8,vaxre9,vaxre10,vaxre11).
VARIABLE LABELS  VAXRE 'sum 11 pro vax reasons items'.
EXECUTE.

 
 
DESCRIPTIVES VARIABLES=vaxco1 vaxco2 vaxco3 vaxco4 vaxco5 
    vaxco6 vaxco7 vaxco8 vaxco9 vaxco10 VAXCO 
    vaxre1 vaxre2 vaxre3 vaxre4 vaxre5 vaxre6 
    vaxre7 vaxre8 vaxre9 vaxre10 vaxre11 VAXRE
  /STATISTICS=MEAN STDDEV MIN MAX.

 

.****FOOD INSECURITY
    
.****Only the challange items were asked of all studies

 
RECODE covid_pandemic_challenges_food_2 (-9960,99=SYSMIS)(0=0)(1=1)(2=2) INTO fi1.
VARIABLE LABELS  fi1 'food insecurity food challange  '.
EXECUTE.

RECODE covid_pandemic_challenges_wate_2 (-9960,99=SYSMIS)(0=0)(1=1)(2=2) INTO fi2.
VARIABLE LABELS  fi2 'food insecurity water challange  '.
EXECUTE.

RECODE fi_change_diet (-9960,98,99=SYSMIS)(1=1)(2=0)(2=2) INTO fi3.
VARIABLE LABELS  fi3 'food insecurity cut meals '.
EXECUTE.

RECODE fi_change_diet_frequency (-9960,98,99=SYSMIS)(1=1)(2=0)(3=0) INTO fi4.
VARIABLE LABELS  fi4 'food insecurity frequency cut meals '.
EXECUTE.

RECODE fi_afford_balanced_meals (-9960,98,99=SYSMIS)(1=2)(2=1)(3=0) INTO fi5.
VARIABLE LABELS  fi5 'food insecurity frequency not afford meals '.
EXECUTE.

RECODE fi_eat_less  (-9960,98,99=SYSMIS)(1=1)(2=0) INTO fi6.
VARIABLE LABELS  fi6 'food insecurity eat less yes '.
EXECUTE.

RECODE fi_food_money_frequency (-9960,98,99=SYSMIS)(1=2)(2=1)(3=0) INTO fi7.
VARIABLE LABELS  fi7 'food insecurity no money for meals '.
EXECUTE.

RECODE fi_high_quality_2 (-9960,98,99=SYSMIS)(1=2)(2=1)(3,4,5=0) INTO fi8.
VARIABLE LABELS  fi8 'food insecurity no money for meals '.
EXECUTE.

RECODE fi_hungry  (-9960,98,99=SYSMIS)(1=1)(2=0) INTO fi9.
VARIABLE LABELS  fi9 'food insecurity hungry yes '.
EXECUTE.

COMPUTE FOODINSEC=sum(fi1,fi2).
VARIABLE LABELS  FOODINSEC 'sum 2 food challange insecurity items'.
EXECUTE.
 

DESCRIPTIVES VARIABLES=fi1 fi2  FOODINSEC
  /STATISTICS=MEAN STDDEV MIN MAX.
 

.****HEALTH CARE CHALLANGE Scale
     
 
FREQUENCIES VARIABLES=cov_pan_chal_hlth_2 cov_pan_chal_med_2 hi_loss_covid  /ORDER=ANALYSIS.


RECODE cov_pan_chal_hlth_2  (-9960,98,99=SYSMIS)(0=0)(1=1)(2=2) INTO helthcarechall1.
VARIABLE LABELS  helthcarechall1 'healthcare insecurity challange '.
EXECUTE.

RECODE cov_pan_chal_med_2 (-9960,98,99=SYSMIS)(0=0)(1=1)(2=2) INTO medicinechall1.
VARIABLE LABELS  medicinechall1 'healthcare insecurity medicine '.
EXECUTE.
RECODE hi_loss_covid (-9960,98,99=SYSMIS)(0=0)(1=1)(2=2) INTO lostinsure1.
VARIABLE LABELS  lostinsure1 'healthcare insecurity lost coverage due to covid '.
EXECUTE.

COMPUTE HEALTHINSEC=sum(helthcarechall1,medicinechall1,lostinsure1).
VARIABLE LABELS  HEALTHINSEC 'sum 3 Health Care Insecurity items'.
EXECUTE.
  

DESCRIPTIVES VARIABLES=helthcarechall1 medicinechall1 lostinsure1  HEALTHINSEC
  /STATISTICS=MEAN STDDEV MIN MAX.
 

.****HOUSING CHALLANGE  

FREQUENCIES VARIABLES= cov_pan_chlng_trans_2 covid_pandemic_challenges_abod_2
 /ORDER=ANALYSIS.


RECODE covid_pandemic_challenges_abod_2  (-9960,98,99=SYSMIS)(0=0)(1=1)(2=2) INTO houschall1.
VARIABLE LABELS  houschall1 'housing challange '.
EXECUTE.

.****TRANSPORTATION CHALLANGE  

RECODE cov_pan_chlng_trans_2  (-9960,98,99=SYSMIS)(0=0)(1=1)(2=2) INTO transportchall1.
VARIABLE LABELS  transportchall1 'transportation challange '.
EXECUTE.


.*****TOTAL CHALLANGES
    

COMPUTE TOTALCHALL=sum(fi1, fi2, houschall1, transportchall1, helthcarechall1,medicinechall1, lostinsure1).
VARIABLE LABELS  HEALTHINSEC 'sum 7 SDOH items'.
EXECUTE.
  

DESCRIPTIVES VARIABLES=fi1 fi2 houschall1 transportchall1 helthcarechall1 medicinechall1 lostinsure1 FOODINSEC HEALTHINSEC TOTALCHALL
  /STATISTICS=MEAN STDDEV MIN MAX.
 


COUNT VAXCOtemp=vaxco1 vaxco2 vaxco3 vaxco4 vaxco5 vaxco6 vaxco7 vaxco8 vaxco9 vaxco10(1).
VARIABLE LABELS  VAXCOtemp 'count of 10 items = 1'.
EXECUTE.

COUNT VAXREtemp=vaxre1 vaxre2 vaxre3 vaxre4 vaxre5 vaxre6 vaxre7 vaxre8 vaxre9 vaxre10 vaxre11(1).
VARIABLE LABELS  VAXREtemp 'count of 11 items = 1'.
EXECUTE.

IF  (MISSING(VAXCO)) VAXCO=VAXCOtemp.
EXECUTE.

IF  (MISSING(VAXRE)) VAXRE=VAXREtemp.
EXECUTE.

