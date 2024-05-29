*-------------------------------------------------------------------------------
* Global scalars
* The definitions are from MAGICC 6
*-------------------------------------------------------------------------------

Scalars
* PPM to GTC ACCORDING to MAGICC 6
    PPM2GTC                                                          /2.123/
* OSCAR 2.0 
* 0.1765 * 12.0
* PPM2GTC                                                          /2.118/

*Joos 2001
* ocean area in square meters   3D-model
    OCEAN_EREA                                                       /3.55E14/
*Unit convert factor umol m3 ppm-1 kg-1
    OCEAN_UNIT_CONVERT_FACTOR                                        /1.722E17/
*Ocean mixed layer depth [in meters]
*    MIXEDLAYER_DEPTH /75.0/

*from HILDA and other models comparison [Joos et al., 1996]: 3D-model
*    MIXEDLAYER_DEPTH                                                 /50.9/
*from MAGICC 6.0
    MIXEDLAYER_DEPTH                                                 /60.0000000000000/


* XAtmosBio is the amount of CO2 returned to the atmosphere as a result
* of decay of the enhanced plant growth resulting from higher CO2.

*    XAtmosBio / 0.0  /
* kg m^-2 year^-1
*Joos 2001
*     AirSeaGasExchYears                                               /9.06/

*MAGICC 6
    AirSeaGasExchYears                                               /7.66/

* GtC/year. MAGICC 6
*    CO2_NPP_INITIAL                                                  /66.2716/
*Joos 1996
*    CO2_NPP_INITIAL                                                  /60.0 /
*Hector 1.0
*     CO2_NPP_INITIAL                                                  /50.0 /
* 0.287 balances LUC emission of 1.1 PgC/yr in 1980s (Joos et al, 1996)
* 0.380  balances LUC emission of 1.6 PgC/yr in 1980s (IPCC 1994)
* MAGICC 6
*    CO2_FERTILIZATION_FACTOR                                         /0.6485981/
*Joos 1996
*    CO2_FERTILIZATION_FACTOR                                         /0.287 /
*Hector 1.0
*    CO2_FERTILIZATION_FACTOR                                         /0.36/
*calibrated value 20160128
*     CO2_FERTILIZATION_FACTOR                                         /0.6888/


*    temp_c1                                                          /0.05435646/
*    temp_c3                                                          /0.40244894/
*    temp_c4                                                          /0.00214573/

*updated to be consistent with 1.5 degree in 20170208

    CORE_DELQ2XCO2   Forcings of equilibrium CO2 doubling (Wm-2)             /3.71/

$ifthen not set mgcfit

$endif
    CORE_CLIMATESENSITIVITY   Equilibrium temp impact (oC per doubling CO2)  / 3.0/

    temp_c1                                                          /0.06353045/
    temp_c3                                                          /0.46686706/
    temp_c4                                                          /0.00332110/

*ppm
*    co2_conc_1765                                                    /278.05158/
   co2_conc_1765                                                    /278.0/

*IPCC AR5
*   co2_conc_1850                                                    /286.80/
*CMIP5
*   co2_conc_1850                                                    /284.725/
   co2_conc_1850                                                    /284./



*MAGICC6
*    co2_conc_1900                                                    /295.95/
*20160518
*    co2_conc_1900                                                    /299.7145784014/
    co2_conc_1900                                                    /293/
*    co2_sea_conc_1765                                                /278.002162067452/
    co2_sea_conc_1765                                                /278.1606/

*CH4 loss to soil (years)
    tau_soil                                                         /160/
*CH4 loss to stratosphere (years)
    tau_strat                                                        /120/

*OH parameters
*inital OH lifetime (years)
    TOH0                                                             /6.6/
*coefficent for NOX
    CNOX                                                             /0.0042/
*coefficent for CO
    CCO                                                              /-0.000105/
*coefficent for NMVOC
    CNMVOC                                                           /-0.000315/

*coefficent for CH4
    CCH4                                                             /-0.32/
*
    CH4_TAUINIT                                                      /9.6/
    N2O_TAUINIT                                                      /120.0/

    s_ch4                                                            /-0.32/
    s_n2o                                                            /-0.05/

    CH4_FOSSFUELFRACTION                                             /0.18/
*MAGICC53
*    CH4_OXIDATION_COEFF                                              /0.0020625/
*Calibrated based on MAGICC6
*    CH4_OXIDATION_COEFF                                              /0.00633364133779803/
*Adjust in 20190514
    CH4_OXIDATION_COEFF                                              /0.003/
    CH4_CONC_2K                                                      /1750.7400/

    TROPOZ_CONC_1765                                                 /19.9480588059701/
    TROPOZ_CONC_2K                                                   /31.1/


*20151225 updated to MAGICC6
    CH4_ADDEDSTRATH2O_PERCENT                                        /0.150/
    CH4_RADEFF_WM2PERPPB                                             /0.036/
    CH4_SCALEOHSENS                                                  /1.0/
    CH4_TAUTEMPSENSITIVITY                                           /0.0316/

    ESNAT                                                            /14.0/

    AtmosDryAirConst                                                 /1.8/

*calibrated based on MAGICC 6
    CLOUD_WEIGHT_NOX                                                 /0.6749857768437/
    CLOUD_WEIGHT_BC                                                  /4.081632653061225E-002/
    CLOUD_WEIGHT_OC                                                  /0.584150746179823/
    CLOUD_WEIGHT_SOX                                                 /0.592067329788859/

    CLOUD_WEIGHT_SS                                                  /0.13/
    CLOUD_BCI2BCB_SOLUBLE_RATIO                                      /0.75/  //! source: hansen et al. 2005 efficacies bci to bcb: 0.6/0.8

    N2O_RADEFF_WM2PERPPB                                             /0.12/
*20151225 updated to MAGICC6


    
    RF_MINERALDUST_DIR_WM2                                           /-0.1/
    RF_LANDUSE_ALBEDO_WM2                                            /-0.2/
    RF_BCSNOW_ALBEDO_WM2                                             /0.1/
    RF_CLOUD_ALBEDO_AER_WM2                                          /-0.7/
    RF_CLOUD_COVER_AER_WM2                                           /0.0/


    RF_SOXI_DIR_WM2                                                  /-0.4/
    RF_NOXI_DIR_WM2                                                  /-0.1/
    RF_BCI_DIR_WM2                                                   /0.2/
    RF_OCI_DIR_WM2                                                   /-0.05/

    RF_BCB_DIR_WM2                                                   /0.38/
    RF_OCB_DIR_WM2                                                   /-0.15/
    RF_NOXB_DIR_WM2                                                  /-0.1/
    RF_SOXB_DIR_WM2                                                  /-0.1/

    SOXI_SCALE_2005                                                  /0.961/
    NOXI_SCALE_2005                                                  /0.833/
    OCI_SCALE_2005                                                   /0.565/
    BCI_SCALE_2005                                                   /0.654/

    RF_VOLCANIC_SCALE                                                /1.0/
    RF_SOLAR_SCALE                                                   /1.0/

    AERCONC_1765                                                     /4.77931577411487/
    CLOUD_ALBEDO_SCALE_FACTOR                                        /0.538296089635535/

    RF_FGASSUM_SCALE                                                 /1.0/
    RF_MHALOSUM_SCALE                                                /1.0/

    STRATOZ_BR_VS_CL_SCALE                                           /45.0/
    STRATOZ_CLEXPON                                                  /1.7/
    STRATOZ_O3SCALE                                                  /-0.00106/  //Updated from -0.0009 (MAGICC 6) to be consistent with strat oz forcing output
    EESC_SCALE_FACTOR                                                /0.771065149668813/
    EESC_CONVERT_FACTOR                                              /0.01/
*    EESC_REFERENCE_1765                                              /600.2/
    EESC_REFERENCE_1850                                              /600.2/
    EESC_REFERENCE_1980                                              /1581/


    OT_BCB_2000                                                      /7.45490597e-001/
    OT_BCI_2000                                                      /9.79786414e-001/
    OT_OCB_2000                                                      /1.07788518e+000/
    OT_OCI_2000                                                      /9.52003629e-001/
    OT_OCN_2000                                                      /1.12399127e-001/
    OT_SOXI_2000                                                     /1.20748451e+000/
    OT_SOXNB_2000                                                    /2.42729367e-001/
    OT_SS_2000                                                       /9.60444672e-001/
    OT_NOXB_2000                                                     /3.18146255e+000/
    OT_NOXI_2000                                                     /1.92459856e+001/

$ifthen not set cali_rf

*Adjusted in 20160107
    RF_EFFICACY_CO2                                                  /1.000001/
*Adjusted in 20160107 ! ca. 1.1   |   1.0-1.20  (LLGHG) / Text: around 1 (+-10%)
   RF_EFFICACY_CH4                                                  /1.012385/
*    RF_EFFICACY_CH4                                                  /0.8/
*! ca. 0.9*-0.3 inferred from Es, |   "roughly one"
    RF_EFFICACY_CH4OXSTRATH2O                                        /1.0/
*    RF_EFFICACY_CH4OXSTRATH2O                                        /0.8/
*Adjusted in 20160107 ! 1.1 for 6x N2O: 1.04  |  1.0-1.20  (LLGHG) / Text: around 1 (+-10%)
    RF_EFFICACY_N2O                                                  /1.004492/
*!  0.82   | 0.5-2.0 /  Text: 0.5-2.0
    RF_EFFICACY_STRATOZ                                              /1.25/
*! 0.82 |    0.5-2.0 /  Text: 0.6-1.1
    RF_EFFICACY_TROPOZ                                               /0.85/
*Adjusted in 20160107 ! 1.7 all trop. 1.56-1.7 |   0.7-1.1 (SOx) / Text: 0.7-1.1 (only, scattering, not absorbing, i.e. not including BC.. )
*    RF_EFFICACY_AER_DIR                                              /0.8128932/
    RF_EFFICACY_AER_DIR                                              /0.9/
*Adjusted in 20160107 ! ca. 1.07 (Es) or higher  | 1.0-2.0 /Text: without cloud lifetime effect: 0.7-1.1; with: 1.0 - 2.0, ! 1.0-2.0 is the efficacy estimate, if the cloud lifetime effect is included. 0.7-1.1 is the effect, if the cloud lifetime effect is not included.
*    RF_EFFICACY_CLOUD_ALBEDO                                         /1.401715/
    RF_EFFICACY_CLOUD_ALBEDO                                         /1.1/
*! ca. 1.07 (Es) or higher  |  - / treated as feedback, not forcing.. see above..
    RF_EFFICACY_CLOUD_COVER                                          /0.9/
*! 0.97 (for +2%)     |    0.7 - 1.0  / Text 0.7-1.0 (not including indirect effects).
    RF_EFFICACY_SOLAR                                                /0.85/
*! 0.91 (for Pinatubo)  |   - / text: 0.7-1.1  (as for direct aerosols)
    RF_EFFICACY_VOLC                                                 /0.95/
*! 1.02 (+-0.6) from Es   |  - / "roughly 1.0"
    RF_EFFICACY_LANDUSE                                              /1.0/
*! 1.71   |   -   /  one study (Ponater et al. 2005): 1.7
    RF_EFFICACY_BCSNOW                                               /1.7/
*! 1.32 (CFC11 & CFC 12)|  1.0-1.2  (LLGHG)  / -
    RF_EFFICACY_FGAS                                                 /1.0/
*! 1.32 (CFC11 & CFC 12)|  1.0-1.2  (LLGHG) / two studies: "slightly less than one"
    RF_EFFICACY_MHALO                                                /1.0/
    RF_EFFICACY_QXTRA                                                /1.0/
    RF_EFFICACY_AIRH2O                                               /1.0/
    RF_EFFICACY_CONTRAIL                                             /1.0/
    RF_EFFICACY_CIRRUS                                               /1.0/

*Estimated according to MAGICC 6 RCP 6.0 for non_co2 estimation
    RF_EFFICACY_NON_CO2                                              /0.623660013463149/
$endif

*Joos 2001
*    OCEANCC_TEMPFEEDBACK                                             /0.0423/
*MAGICC 6
*    OCEANCC_TEMPFEEDBACK                                             /0.03717879/


    SST_SCALE_FACTOR                                                  /0.722173136/

    SST_SCALE_INTER                                                   /0.020553773/
    SST_SCALE_GRADI                                                   /0.71343138/

*from Hector 1.0

*    ATMO_POOL_1765_GTC /605.704/
*    PLNT_POOL_1765_GTC /503.114/
*    DETR_POOL_1765_GTC /55.9771/
*    SOIL_POOL_1765_GTC /1812.06/







$ifthen not set cali_lnd

CO2_FEEDBACKFACTOR_NPP                   /1.070037000000000E-002/
CO2_FEEDBACKFACTOR_RESPIRATION           /6.845893000000000E-002/
CO2_FEEDBACKFACTOR_DETRITUS              /-0.135781700000000/
CO2_FEEDBACKFACTOR_SOIL                  /0.154087900000000/
$endif

CO2_FERT_FACTOR_FOR_CALIBRATE            /0.62295908638692/
CO2_FERT_METHOD_FOR_CALIBRATE            /1.10048600000000/




*20161014



$ifthen not set cali_lnd
*MAGICC6
CO2_NPP_INITIAL                          /66.2716000000000/
CO2_RESPIRATION_INITIAL                  /12.2602500000000/
CO2_RESPIRATION_SCALE                    /0.185/
CO2_FERTILIZATION_FACTOR                 /0.62295908638692/
CO2_FERTILIZATION_METHOD                 /1.10048600000000/
$endif
CO2_FERTILIZATION_SCALE                  /1.0/

OCEANCC_SCALE_GASXCHANGE                 /0.1861/
OCEANCC_TEMPFEEDBACK                     /3.717879000000000E-002/






*MAGICC6


CO2_TEMPFEEDBACK_YRSTART                 /1900/
CO2_FERTILIZATION_YRSTART                /1900/
CO2_SWITCHFROMCONC2EMIS_YEAR             /2008/

OCEANCC_SCALE_IMPULSERESPONSE            /0.949286400000000/
*OCEANCC_SCALE_GASXCHANGE                 /1.83349200000000/
OCEANCC_CONVLTN2INT_YRSAGO               /10/

*from MAGICC 6
   ATMO_POOL_1765_GTC /590.53522/
   PLNT_POOL_1765_GTC /884.8584/
   DETR_POOL_1765_GTC /92.7738/
   SOIL_POOL_1765_GTC /1681.525/

$ifthen not set cali_lnd
* CO2_ATMOSPOOL_INITIAL                    /590.53522/
CO2_PLANTPOOL_INITIAL                    /884.858400000000/
CO2_DETRITUSPOOL_INITIAL                 /92.7738000000000/
CO2_SOILPOOL_INITIAL                     /1681.52500000000/
$endif

CO2_GIFFORD_CONC_FOR_ZERONPP             /80.0000000000000/
CO2_NORGRWTH_FRAC_DEFO                   /0.500000000000000/
CO2_PREINDCO2CONC                        /278.000000000000/
CO2_PREINDCO2CONC_APPLY                  /0/
CO2_GWP                                  /1.00000000000000/

********************************************************************************


$ifthen not set cali_lnd

//TAUP
CO2_FRACTION_PLANT_TAU
//TAUH
CO2_FRACTION_DETRITUS_TAU
//TAUS
CO2_FRACTION_SOIL_TAU

CO2_PLNT_DECAY_INITIAL
CO2_DETR_DECAY_INITIAL
CO2_SOIL_DECAY_INITIAL


CO2_REGROW_INTER                         /-0.0271/
CO2_REGROW_GRADI                         /0.0085/

CO2_PLNT_REGROW_INTER                    /19.923840/
CO2_PLNT_REGROW_GRADI                    /-0.393449/

CO2_DETR_REGROW_INTER                    /-0.52774/
CO2_DETR_REGROW_GRADI                    /0.25125/

CO2_SOIL_REGROW_INTER                    /10.07905693/
CO2_SOIL_REGROW_GRADI                    /-0.06073638/

$endif

CO2_FERT_LOG_NORM                        /0.98823425/
CO2_FERT_SIG_NORM                        /0.84729805/

CO2_NPP_ZERO_CONC                        /31.0/

*TROPOSPHERIC OZONE
TROPOZ_RADEFF_WM2PERDU                   /0.0335/        // Updated from 0.042 to match 0.35 best estimate of forcing in 2005 (IPCC-AR4).
TROPOZ_OZCH4                             /5.0/
TROPOZ_OZNOX                             /0.125/
TROPOZ_OZCO                              /0.0011/
TROPOZ_OZVOC                             /0.0033/
;

$ifthen not set cali_lnd

parameter

CO2_FRACTION_PLANT_2_DETRITUS            /0.998902100000000/
CO2_FRACTION_PLANT_2_SOIL
CO2_FRACTION_DETRITUS_2_SOIL             /1.007630000000000E-003/

CO2_FRACTION_NPP_2_PLANT                 /0.448261500000000/
CO2_FRACTION_NPP_2_DETRITUS              /0.399816500000000/
CO2_FRACTION_NPP_2_SOIL
;


parameter


CO2_FRACTION_DEFOREST_PLANT              /0.700000000000000/
CO2_FRACTION_DEFOREST_DETRITUS           /5.000000000000000E-002/
CO2_FRACTION_DEFOREST_SOIL
;

$endif

parameters
* Effective Ocean temperature for carbonate chemistry in deg C.
*    TC  /18.1716/
    TC  /17.7/
    sw_A1
    sw_A2
    sw_A3
    sw_A4
    sw_A5

    ocn_rsp_multi_factor
;

    sw_A1 = (1.5568-1.3993E-2*TC);
    sw_A2 = (7.4706-0.20207*TC)*1E-3;
    sw_A3 = -(1.2748-0.12015*TC)*1E-5;
    sw_A4 = (2.4491-0.12639*TC)*1E-7;
    sw_A5 = -(1.5468-0.15326*TC)*1E-10;



*param soc, SurfaceOcnDIC: Surface ocean dissolved inorganic carbon (DIC) [micromol/kg]
*returns: the change in sea water |CO2| [ppm]
*F. Joos 2001
$macro DeltaSeaWaterCO2FromOcnDIC1(soc) (sw_A1*(soc)+sw_A2*(soc)**2+sw_A3*(soc)**3+sw_A4*(soc)**4+sw_A5*(soc)**5)
$macro DeltaSeaWaterCO2FromOcnDIC(soc) (sw_A1*(soc)+sw_A2*power(soc,2)+sw_A3*power(soc,3)+sw_A4*power(soc,4)+sw_A5*power(soc,5))


ocn_rsp_multi_factor = OCEAN_UNIT_CONVERT_FACTOR/(MIXEDLAYER_DEPTH*OCEAN_EREA)/PPM2GTC;

*This function calculates the ocean mixed layer response function (HILDA model) as described in Joos et al., 1996.
*This function returns the amount of carbon remaining in the surface layer of the ocean after an input (pulse) from the atmosphere
*scaled to units of micromol/kg.
*Joos 2001
$macro rs1_hilda(yr) (0.12935 + 0.21898*exp(-(yr)/0.034569) + 0.17003*exp(-(yr)/0.26936) + 0.24071*exp(-(yr)/0.96083) + 0.24093*exp(-(yr)/4.9792))
$macro rs2_hilda(yr) (0.022936 + 0.24278*exp(-(yr)/1.2679) + 0.13963*exp(-(yr)/5.2528) + 0.089318*exp(-(yr)/18.601) + 0.037820*exp(-(yr)/68.736) + 0.035549*exp(-(yr)/232.30))
$macro ocn_rsp_coeff_hilda(yr) (ifthen((yr) le 2,rs1_hilda(yr) * ocn_rsp_multi_factor,rs2_hilda(yr) * ocn_rsp_multi_factor))

*$macro rs1_3d(yr) (1.0-2.2617*(yr) +14.002*(yr)**2-48.770*(yr)**3+82.986*(yr)**4-67.527*(yr)**5+21.037*(yr)**6)
$macro rs1_3d(yr) (1.0-2.2617*(yr) +14.002*power(yr,2)-48.770*power(yr,3)+82.986*power(yr,4)-67.527*power(yr,5)+21.037*power(yr,6))
$macro rs2_3d(yr) (0.014819+0.70367*exp(-(yr)/0.70177)+0.24966*exp(-(yr)/2.3488)+0.066485*exp(-(yr)/15.281)+0.038344*exp(-(yr)/65.359)+0.019439*exp(-(yr)/347.55))
$macro rs3d(yr) (ifthen((yr) le 1,rs1_3d(yr),rs2_3d(yr)))
$macro ocn_rsp_3d(yr) (rs3d(yr-1)-rs3d(yr))

set yrs /1*1000/;
parameter
ocn_rsp_coeff_3d(yrs)
;
ocn_rsp_coeff_3d(yrs) = ocn_rsp_3d(yrs.val);

$macro ocn_rsp(yr) (ocn_rsp_coeff_3d(yrs)$(yrs.val=yr))

*$macro ocn_rsp_coeff_3d(yr) ((rs3d(yr)) * ocn_rsp_multi_factor)

*surfaceOcnDIC(t)                =E= sum(t1$(nyr(t1) le nyr(t)), atmoSeaFlux(t1) * ocn_rsp_coeff_3d((nyr(t) - nyr(t1))));
*$macro calOcnDic(seaFlux,)


*This function calculates the decay response function for the biosphere.
$macro bio_rsp_coeff_4box(yr) (0.70211*exp(-0.35*(yr)) + 0.013414*exp(-(yr)/20.0) - 0.71846*exp(-55.0/120.0*(yr))+0.0029323*exp(-0.01*(yr)))
$macro bio_rsp_coeff_fbm(yr) (0.16288184E-01 * exp(-(yr)/0.72055005+01) +0.33925361E-01 * exp(-(yr)/0.14732705E+02) +0.97439329E-04 * exp(-(yr)/0.29538920E+02) + 0.51309690E-03 * exp(-(yr)/0.11750538+03))
*This function calculates the change in sea water |CO2| from equilibrium corresponding to change in ocean mixed layer carbon from
*equilibrium.

*The function f accounts for the overlap in CH4 and N2O
*$macro fmn1(MM,NN) (0.636*(((MM)*(NN))**0.75) + 0.007*(MM)*(((MM)*(NN))**1.52))
$macro fmn(MM,NN)  (0.47*log(1+0.6356*((MM)*(NN)/1E6)**0.75+0.007*(MM)/1E3*((MM)*(NN)/1E6)**1.52))




$ifthen not set cali_lnd
scalar
    scm_dt;
    
scm_dt = 1 / 6;


CO2_NPP_INITIAL          = CO2_NPP_INITIAL * scm_dt;
CO2_RESPIRATION_INITIAL  = CO2_RESPIRATION_INITIAL * scm_dt;
CO2_FERTILIZATION_METHOD = 1;



CO2_PLNT_REGROW_INTER                    = 2.232639577;
CO2_PLNT_REGROW_GRADI                    = -0.007118357;

CO2_DETR_REGROW_INTER                    = -0.042113268;
CO2_DETR_REGROW_GRADI                    = 0.003201409;

CO2_SOIL_REGROW_INTER                    = 1.057490e-01;
CO2_SOIL_REGROW_GRADI                    = -8.746865e-05;
          

*CO2_NORGRWTH_FRAC_DEFO  = CO2_NORGRWTH_FRAC_DEFO * scm_dt;

*Adjusted to fit the RF (20180723)
RF_BCSNOW_ALBEDO_WM2 = RF_BCSNOW_ALBEDO_WM2 * 0.1 * 1.171394248870482;
*Adjusted to fit the RF (20170608)
CO2_FERT_FACTOR_FOR_CALIBRATE    = CO2_FERTILIZATION_FACTOR;


CO2_FRACTION_NPP_2_SOIL          = 1 - CO2_FRACTION_NPP_2_PLANT - CO2_FRACTION_NPP_2_DETRITUS;

CO2_FRACTION_PLANT_2_SOIL        = 1 - CO2_FRACTION_PLANT_2_DETRITUS;

CO2_FRACTION_DEFOREST_SOIL       = 1 - CO2_FRACTION_DEFOREST_PLANT - CO2_FRACTION_DEFOREST_DETRITUS;



*THPL           = CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL







*CO2_FRACTION_PLANT_TAU           = CO2_PLANTPOOL_INITIAL/(CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL);
CO2_FRACTION_PLANT_TAU           = CO2_PLANTPOOL_INITIAL/(CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL);


*CO2_FRACTION_DETRITUS_TAU        = CO2_DETRITUSPOOL_INITIAL/(CO2_FRACTION_NPP_2_DETRITUS*CO2_NPP_INITIAL+CO2_FRACTION_PLANT_2_DETRITUS*(CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL));
CO2_FRACTION_DETRITUS_TAU        = CO2_DETRITUSPOOL_INITIAL/(CO2_FRACTION_NPP_2_DETRITUS*CO2_NPP_INITIAL+CO2_FRACTION_PLANT_2_DETRITUS*(CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL));
*THH0=0.5/CO2_FRACTION_DETRITUS_TAU

*CO2_FRACTION_SOIL_TAU       = CO2_SOILPOOL_INITIAL/(CO2_NPP_INITIAL--(1.0-CO2_FRACTION_DETRITUS_2_SOIL)*CO2_DETRITUSPOOL_INITIAL/CO2_FRACTION_DETRITUS_TAU);
CO2_FRACTION_SOIL_TAU       = CO2_SOILPOOL_INITIAL/(CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL-(1.0-CO2_FRACTION_DETRITUS_2_SOIL)*CO2_DETRITUSPOOL_INITIAL/CO2_FRACTION_DETRITUS_TAU);
*                 THS0=0.5/TAUS

*THPL=G1*NPP0-RESP0
CO2_PLNT_DECAY_INITIAL=CO2_FRACTION_NPP_2_PLANT*CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL;
*(G2*NPP0+PHI*THPL)
CO2_DETR_DECAY_INITIAL=CO2_FRACTION_NPP_2_DETRITUS*CO2_NPP_INITIAL+CO2_FRACTION_PLANT_2_DETRITUS*CO2_PLNT_DECAY_INITIAL;
*(NPP0-RESP0-(1.0-XL)*HL0/TAUH)
CO2_SOIL_DECAY_INITIAL=CO2_NPP_INITIAL-CO2_RESPIRATION_INITIAL-(1-CO2_FRACTION_DETRITUS_2_SOIL)*CO2_DETRITUSPOOL_INITIAL/CO2_FRACTION_DETRITUS_TAU;


$endif