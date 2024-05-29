$TITLE Simple Climate Model for OPTimization (SCM4OPT)
*Created since Apr., 2013, by Xuanming SU, suxuanming@gmail.com

$eolcom //

***********************************************************
***************Setting default values**********************

*Set default scenario to SSP2
$ifthen not set scen
$setglobal scen "contrib"
$endif

$ifthen not set psce
$setglobal psce "SSP1_19"
$endif

$ifthen not set lcov
$setglobal lcov "LUH"
$endif

$ifthen not set hsrc
$setglobal hsrc "EDGAR"
$endif

$ifthen not set psrc
$setglobal psrc "IAMC"
$endif

$ifthen not set csec
$setglobal csec "EMISS_IND"
$endif

$ifthen not set land
$setglobal land "LUC_GCP"
$endif

*by 2020, CO2 concentration is 414.214 ppm
$ifthen not set cm6mdl
$setglobal cm6mdl "NorESM2-MM"
*$setglobal cm6mdl "MIROC-ES2L"
$endif

$ifthen not set rgn 
$setglobal rgn "WORLD"
$endif

$ifthen not set ch4rfc 
$setglobal ch4rfc "etminan"
$endif

$ifthen set ch4_rfc 
$setglobal ch4rfc "%ch4_rfc%"
$endif



***************Setting default values**********************
***********************************************************

*Include the climate definition derived from MAGICC 6.0
$include ../trunk/gms/def_clim_mgc6.gms
scm_dt=1;

*Change climate sensitivity for uncertainty run if climsensi is set1                                                                    
$ifthen set climsensi
t2xco2=%climsensi%;
$endif


*Simulation period of time, yearly
set tAll /1700*2550/;


* GCM definitions
$include ../trunk/gms/def_gcm.gms



*Scenarios for emissions
set rcp  /"userdef","rcp26", "rcp45","rcp60", "rcp85"/ ;

parameter
*Pg C in CO2, from Murakami et al. (2010)
*    scm_atmos_c                                                             /588.071/
* From IPCC AR5
    scm_atmos_c                                                             /590.194/

*C0=276                                 ; another way to specify, in ppmv
;

parameter

scm_zero /0/;

*Include definitions of anthropogenic emissions
$include ../trunk/gms/def_gas.gms

*Include definitions of GWP100
$include ../trunk/gms/def_gwp.gms

*Parameter for storage GWP100
parameter
         def_gwp100_eind(gas)
         def_gwp100_elnd(gas);

def_gwp100_eind(gas) = def_gwp100_ar5_eind(gas);
def_gwp100_elnd(gas) = def_gwp100_ar5_elnd(gas);

*Include MAGICC 6.0's data/output
$include ../trunk/gms/dat_mgc_1yr.gms

$include ../trunk/gms/dat_def_forcing_1yr.gms

*Load socioeconomic module
$include ../trunk/gms/mdl_economic.gms


*Include some predefined parameters
$include ../trunk/gms/def_ini.gms

parameter nyr(tAll);
nyr(tAll)   =  ord(tAll);

*Varibale definitions
variables

    scm_atmoCO2(t)
    scm_atmo_pool(t)

    scm_D_CO2(t)

    scm_ftot(t)

    scm_deltem(t)
    scm_D_tatm(t)
    scm_D_sst(t)
    scm_sst(t)
    scm_delsst(t)

    scm_prec(t)
    scm_cca(t)
;

equations
    scm_ftot_EQ(t)

    scm_ATMOEQ(t)
    scm_ATMOCO2EQ(t)

    scm_D_CO2_EQ(t)

    scm_D_TATMEQ(t)
    scm_TATMEQ(t)
    scm_DELTEMEQ(t)


    scm_D_SSTEQ(t)
    scm_SSTEQ(t)
    scm_DELSSTEQ(t)


    scm_cca_EQ(t)
;



$include ../trunk/gms/mdl_FAIR.gms

$include ../trunk/gms/mdl_other.gms

$include ../trunk/gms/mdl_doeclim.gms


 scm_cca_EQ(t+1)..                          scm_cca(t+1)                       =E= scm_cca(t)+ dat_ems(t,"co2");                

* 
$ifthen set co2_only
scm_ftot_EQ(t)..                                                scm_ftot(t)                         =E= oth_eftotal(t);
$else


scm_ftot_EQ(t)..                                              scm_ftot(t)                         =E= oth_eftotal(t);
$endif


scm_D_TATMEQ(t)..                               scm_D_tatm(t)                =E= doe_tas(t);

scm_D_SSTEQ(t)..                                scm_D_sst(t)                 =E= doe_temp_sst(t);


scm_TATMEQ(t)..                                 scm_tatm(t)                  =E= doe_tas(t) + 0;//doe_T0

scm_SSTEQ(t)..                                  scm_sst(t)                   =E= doe_temp_sst(t) + 0;//doe_ST0



scm_DELTEMEQ(t)..                         scm_deltem(t)                =E= (2*scm_tatm(t-1)-scm_tatm(t-2)-def_deltT1850)$(not(tfirst(t) or tsecond(t)))
                                                                           + (scm_zero)$(tfirst(t) or tsecond(t)) ;
scm_DELSSTEQ(t)..                         scm_delsst(t)                =E= (2*scm_sst(t-1)-scm_sst(t-2))$(not(tfirst(t) or tsecond(t)))
                                                                           + (scm_zero)$(tfirst(t) or tsecond(t)) ;


scm_ATMOEQ(t)..                            scm_atmo_pool(t)                =E= fair_MAT(t);



scm_ATMOCO2EQ(t)..                           scm_atmoCO2(t)                =E= scm_atmo_pool(t) / PPM2GTC;


scm_D_CO2_EQ(t)..                               scm_D_CO2(t)               =E= scm_atmoCO2(t) - CO2_0;



scm_cca.fx(tfirst) =  0;

scm_tatm.lo(t)   = -2;
scm_tatm.up(t)   = 50;

scm_D_tatm.lo(t)   = -2;
scm_D_tatm.up(t)   = 50;


scm_sst.lo(t)   = -2;
scm_sst.up(t)   = 50;

scm_D_sst.lo(t)   = -2;
scm_D_sst.up(t)   = 50;

scm_atmo_pool.lo(t) = 1;


scm_atmoCO2.lo(t) = 1;
* scm_atmoCO2.up(t) = 1E5;

Scalar
*    tatm_lo /1E-1/
    tatm_lo /0/
; 


$ifthen set CLP
scm_tatm.lo(t) = 0;
$endif

$ifthen set limT 
scm_tatm.up(t) = %limT%;
$endIf

*Model definitions

$ifthen set CLP 
model scm4opt /all
             -price_path_EQ1
             -price_path_EQ2
             -price_path_EQ3
             -price_path_EQ4
            -price_path_EQ5
             -price_path_EQ6
             -price_path_EQ7
             -price_path_EQ8
             -price_path_EQ9
             -price_path_EQ10
            -price_objEQ/;
* model scm4opt /all/;
$else
model scm4opt /all/;
$endIf



option iterlim = 1000000;
option reslim = 1000000;
option PROFILE = 5;


option nlp = CONOPT4;



$include ../trunk/gms/econ_run.gms



*Save solving status
parameter
    modelStat
    Solvestat
;

    modelStat = scm4opt.modelStat;
    Solvestat = scm4opt.Solvestat;

Scalar modelTcomp, modelTexec, modelTelapsed;

modelTcomp    = TimeComp;
modelTexec    = TimeExec;
modelTelapsed = TimeElapsed;
