* Encoding: UTF-8.
*GET FILE='J:\radx_phase4\repo\data\processed\phase4_all_transformcopy.sav'.
GET FILE='path\data\processed\phase4_all_transformcopy.sav'.

* alcohol_date_mdy

COMPUTE DATE = alcohol_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_alc, AlphaWave_alc, DeltaWave_alc, OmicronWave_alc, OmicronBvarWave_alc).


* consentdt_mdy

COMPUTE DATE = consentdt_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_cons, AlphaWave_cons, DeltaWave_cons, OmicronWave_cons, OmicronBvarWave_cons).

* covid_test_date_mdy

COMPUTE DATE = covid_test_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_cov, AlphaWave_cov, DeltaWave_cov, OmicronWave_cov, OmicronBvarWave_cov).

* hlthstat_date_mdy

COMPUTE DATE = hlthstat_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_hlth, AlphaWave_hlth, DeltaWave_hlth, OmicronWave_hlth, OmicronBvarWave_hlth).

* housing_date_mdy

COMPUTE DATE = housing_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_hous, AlphaWave_hous, DeltaWave_hous, OmicronWave_hous, OmicronBvarWave_hous).

* iden_date_mdy

COMPUTE DATE = iden_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_iden, AlphaWave_iden, DeltaWave_iden, OmicronWave_iden, OmicronBvarWave_iden).

* med_hx_date_mdy

COMPUTE DATE = med_hx_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_med, AlphaWave_med, DeltaWave_med, OmicronWave_med, OmicronBvarWave_med).

* sociodem_date_mdy

COMPUTE DATE = sociodem_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_soc, AlphaWave_soc, DeltaWave_soc, OmicronWave_soc, OmicronBvarWave_soc).

* sym_date_mdy

COMPUTE DATE = sym_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_sym, AlphaWave_sym, DeltaWave_sym, OmicronWave_sym, OmicronBvarWave_sym).

* test_date_mdy

COMPUTE DATE = test_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_test, AlphaWave_test, DeltaWave_test, OmicronWave_test, OmicronBvarWave_test).


* vacc_date_mdy

COMPUTE DATE = vacc_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_vac, AlphaWave_vac, DeltaWave_vac, OmicronWave_vac, OmicronBvarWave_vac).

* work_ppe_date_mdy

COMPUTE DATE = work_ppe_date_mdy.
FORMATS DATE (ADATE10).
EXECUTE.

INSERT FILE='J:\radx_phase4\repo\src\functions\Pandemic Waves.sps'.
EXECUTE.

RENAME VARIABLES (VARIANT, AlphaWave, DeltaWave, OmicronWave, OmicronBvarWave = VARIANT_work, AlphaWave_work, DeltaWave_work, OmicronWave_work, OmicronBvarWave_work).

MISSING VALUES VARIANT_alc VARIANT_cons VARIANT_cov VARIANT_hlth VARIANT_hous VARIANT_iden VARIANT_med VARIANT_soc VARIANT_sym VARIANT_test VARIANT_vac VARIANT_work (-9).

COMPUTE VARIANT=RND(MEAN(VARIANT_alc,VARIANT_cons,VARIANT_cov,VARIANT_hlth,VARIANT_hous,VARIANT_iden,VARIANT_med,VARIANT_soc,VARIANT_sym,VARIANT_test,VARIANT_vac,VARIANT_work)).

VARIABLE LABELS
    VARIANT 'COVID Variant'.

VALUE LABELS
    VARIANT
0 'Epsilon'
1 'Alpha'
2 'Delta'
3 'Omicron'
4 'OmicronBvariant'
5 'OmicronBvarPlus'.
EXECUTE.

COMPUTE EpsilonWave=0.
COMPUTE AlphaWave=0.
COMPUTE DeltaWave=0.
COMPUTE OmicronWave=0.
COMPUTE OmicronBvarWave=0.
COMPUTE OmicronBvarPlusWave=0.
VARIABLE LABELS  EpsilonWave 'Before March 2021'.
VARIABLE LABELS  AlphaWave 'March 2021 to June 15 2021'.
VARIABLE LABELS  DeltaWave 'June 16 2021 to Dec 15 2021'.
VARIABLE LABELS  OmicronWave 'Dec 16 2021 to March 31 2022'.
VARIABLE LABELS  OmicronBvarWave 'April 1 2022 to Aug 31 2022'.
VARIABLE LABELS  OmicronBvarPlusWave 'After Aug 31 2022'.

DO IF (VARIANT = 0).
    RECODE EpsilonWave (0=1).
END IF.
EXECUTE.

DO IF (VARIANT = 1).
    RECODE AlphaWave (0=1).
END IF.
EXECUTE.

DO IF (VARIANT = 2).
    RECODE DeltaWave (0=1).
END IF.
EXECUTE.

DO IF (VARIANT = 3).
    RECODE OmicronWave (0=1).
END IF.
EXECUTE.

DO IF (VARIANT = 4).
    RECODE OmicronBvarWave (0=1).
END IF.
EXECUTE.

DO IF (VARIANT = 5).
    RECODE OmicronBvarPlusWave (0=1).
END IF.
EXECUTE.

*SAVE OUTFILE='J:\radx_phase4\repo\data\staged\comparewaves.sav'

*SAVE OUTFILE='J:\radx_phase4\repo\data\processed\comparewaves.sav'
    /KEEP = nih_record_id
    ph4_datsource
    alcohol_date_mdy
    consentdt_mdy
    covid_test_date_mdy
    hlthstat_date_mdy
    housing_date_mdy
    iden_date_mdy
    med_hx_date_mdy
    sociodem_date_mdy
    sym_date_mdy
    test_date_mdy
    vacc_date_mdy
    work_ppe_date_mdy
    VARIANT_alc
    VARIANT_cons
    VARIANT_cov
    VARIANT_hlth
    VARIANT_hous
    VARIANT_iden
    VARIANT_med
    VARIANT_soc
    VARIANT_sym
    VARIANT_test
    VARIANT_vac
    VARIANT_work
    VARIANT.

* SAVE OUTFILE='J:\radx_phase4\repo\data\processed\phase4_all_transformcopy_wave.sav'.
SAVE OUTFILE='path\data\processed\phase4_all_transformcopy_wave.sav'
    /DROP = 
    DATE
    VARIANT_alc to OmicronBvarWave_work
    .
