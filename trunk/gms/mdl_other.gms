$include ../trunk/gms/def_fgs.gms

set tstrat(t)                                           /1980*2048/;

parameter
    oth_conc_hist(tAll,oghg)
*Mineral dust forcing
    oth_fmindust(tAll)
*Solar forcing effect
    oth_fsolar(tAll)
*    fstratoz(tAll)
*Volcanic forcing effect
    oth_fvolcanic(tAll)
*Land use albedo forcing
    oth_flanduse(tAll)

    oth_fcloudc(tAll)
    oth_fclouda(tAll)

*BC forcing from biomass dource
    oth_fbcb_hist(tAll)
*BC forcing from industrial source
    oth_fbci_hist(tAll)

*Forcing effect from BC on snow
    oth_fbcsnow_hist(tAll)
;
oth_fmindust(tAll)      = 0;
oth_fsolar(tAll)        = dat_rf_solar(tAll);
loop(tAll$(tAll.val>=2300),
    oth_fsolar(tAll) = oth_fsolar(tAll-110);
);

oth_fvolcanic(tAll)     = dat_rf_volcanic(tAll);

oth_fcloudc(tAll)       = dat_rcp_CLOUD_COVER_RF(tAll,"rcp45");
oth_fclouda(tAll)       = dat_rcp_CLOUD_ALBEDO_RF(tAll,"rcp45");

oth_flanduse(tAll)      = dat_rcp_LANDUSE_RF(tAll,"rcp45");

oth_conc_hist(tAll,"ch4") = dat_rcp_ch4_conc_mgc(tAll,"rcp45");
oth_conc_hist(tAll,"n2o") = dat_rcp_n2o_conc_mgc(tAll,"rcp45");

oth_fbcb_hist(tAll)     = dat_rcp_BCB_RF(tAll,"rcp45");
oth_fbci_hist(tAll)     = dat_rcp_BCI_RF(tAll,"rcp45");

oth_fbcsnow_hist(tAll)  = dat_rcp_BCSNOW_RF(tAll,"rcp45");

parameter
deltT90
deltT2k
deltT1900

STRATH2O                                                         /0.150/

RF_SOXI_DIR_WM2_2020                                             /-0.4/
RF_NOXI_DIR_WM2_2020                                             /-0.1/
RF_BCI_DIR_WM2_2020                                              /0.2/
RF_OCI_DIR_WM2_2020                                              /-0.05/
RF_MINERALDUST_DIR_WM2_2020                                      /-0.1/
RF_LANDUSE_ALBEDO_WM2_2020                                       /-0.2/
RF_BCSNOW_ALBEDO_WM2_2020                                        /0.1/
RF_CLOUD_ALBEDO_AER_WM2_2020                                     /-0.7/
RF_CLOUD_COVER_AER_WM2_2020                                      /0.0/

RF_BCB_DIR_WM2_2020                                              /0.38/
RF_OCB_DIR_WM2_2020                                              /-0.15/
RF_NOXB_DIR_WM2_2020                                             /-0.1/
RF_SOXB_DIR_WM2_2020                                             /-0.1/

    t2xco2   Equilibrium temp impact (oC per doubling CO2)           / 3.0/
    fco22x   Forcings of equilibrium CO2 doubling (Wm-2)             /3.71/

CO2_init                                                            /275./
CO2_0                                                            /284/
;





*deltT(t,rcp) =  2*rcp_tatm(t-1,rcp)-rcp_tatm(t-2,rcp);
deltT90      =  2*dat_rcp_tatm("1989","rcp45")-dat_rcp_tatm("1988","rcp45");
deltT2k      =  2*dat_rcp_tatm("1999","rcp45")-dat_rcp_tatm("1998","rcp45");
deltT1900    =  2*dat_rcp_tatm("1899","rcp45")-dat_rcp_tatm("1898","rcp45");
;

Variables
    oth_fco2(t)
*Relative CH4 life time
    oth_tau_reloh(t)
*CH4 and N2O decay rates
    oth_decay(t,oghg)
*CH4 and N2O concentration
    oth_conc(t,ghg)
*CH4 forcing
    oth_fmeth(t)
*CH4 oxidation
    oth_emeth(t)
*N2O life time
    oth_tau_n2o(t)
*N2O forcing
    oth_fn(t)

*Stratospheric water vapor from CH4 oxidation
    oth_fh2o(t)

*Tropospheric concentration
    oth_coz(t)
*Tropospheric forcing
    oth_ftropoz(t)

*Sum of forcing from CO2, CH4 and N2O
    oth_fco2ch4n2o(t)
*GHG forcing
    oth_fghg(t)
*Kyoto gases forcing
*    oth_fkyoto(t)

*BC forcing from industrial source
    oth_fbci(t)
*BC forcing from biomass source
    oth_fbcb(t)
*Focring effect from BC on snow
    oth_fbcsnow(t)

*Sulfate forcing from industrial source
    oth_fsoxi(t)
*Sulfate forcing from biomass source
    oth_fsoxb(t)

*OC forcing from industrial source
    oth_foci(t)
*OC forcing from biomass source
    oth_focb(t)

*Nitrate forcing from industrial source
    oth_fnoxi(t)
*Nitrate forcing from biomass source
    oth_fnoxb(t)

*Sum of forcing from biomass source
    oth_fbio(t)
*Sum of forcing from direct aerosols
    oth_faerdir(t)

*Aerosol concentraion
    oth_aerconc(t)
*Cloud albedo forcing
    oth_fcloudabdo(t)
*Total cloud forcing
    oth_fcloudtot(t)

*Simulating forcing from halogenated gases
    oth_ha(t,fgs)
    oth_fhl(t,fgs)
    oth_fhalo(t)
*    oth_fkhalo(t)
*    oth_fmhalo(t)

*Equivalent effective stratospheric chlorine concentration
    oth_eesc(t)
*Stratospheric ozone forcing
    oth_fstratoz(t)

*Forcing from human behaviour
    oth_fanthro(t)
*Forcing from both human related sources and natural sources
    oth_ftot(t)

*Calculating effective radiative forcing
    oth_efco2(t)
    oth_efch4(t)
    oth_efh2o(t)
    oth_efn2o(t)

    oth_efstratoz(t)
    oth_eftropoz(t)
    oth_efaerdir(t)
    oth_efcloudabdo(t)
    oth_efcloudcover(t)
    oth_efsolar(t)
    oth_efvolcanic(t)
    oth_eflanduse(t)
    oth_efbcsnow(t)
    oth_efhalo(t)
*    oth_efkhalo(t)
*    oth_efmhalo(t)
    oth_efxtra(t)
    oth_efairh2o(t)
    oth_efcontrail(t)
    oth_efcirrus(t)

    oth_efco2ch4n2o(t)
    oth_efcloudtot(t)
*    oth_efkyoto(t)
    oth_efghg(t)
    oth_efanthro(t)
    oth_eftotal(t)

    oth_deltem(t)
;

Equations
    oth_CCO2EQ(t)
    oth_FCO2EQ(t)

*EQ(57), Relative CH4 life time
    oth_RELOHEQ(t)
*EQ(56), CH4 decay rates
    oth_DCYCH4EQ(t)
*EQ(55), CH4 concentration
    oth_CCH4EQ(t)
*Not reflected in the manual, CH4 oxidation
    oth_EMETHEQ(t)
*EQ(60, 62), CH4 forcing
    oth_FCH4EQ(t)

*EQ(58), N2O life time
    oth_TAU_N2OEQ(t)
*EQ(59), N2O decay rates
    oth_DCYN2OEQ(t)
*EQ(59), N2O concentration
    oth_CN2OEQ(t)
*EQ(61, 62), N2O forcing
    oth_FN2OEQ(t)

*EQ(75), Stratospheric water vapor from CH4 oxidation
    oth_FH2OEQ(t)

*EQ(73), Tropospheric concentration
    oth_COZEQ1(t)
    oth_COZEQ2(t)
*EQ(74), Tropospheric forcing
    oth_FTROPOZEQ(t)

*Not reflected in the manual, Sum of forcing from CO2, CH4 and N2O
    oth_FCO2CH4N2OEQ(t)
*Not reflected in the manual, GHG forcing
    oth_FGHGEQ(t)
*Not reflected in the manual, Kyoto gases forcing
*    oth_FKYOTOEQ(t)

*EQ(65), BC forcing from industrial source
    oth_FBCIEQ(t)
*EQ(66), BC forcing from biomass source
    oth_FBCBEQ(t)
*EQ(77), Focring effect from BC on snow
    oth_FBCSNOWEQ(t)

*EQ(65), Sulfate forcing from industrial source
    oth_FSOXIEQ(t)
*EQ(66), Sulfate forcing from biomass source
    oth_FSOXBEQ(t)

*EQ(65), OC forcing from industrial source
    oth_FOCIEQ(t)
*EQ(66), OC forcing from biomass source
    oth_FOCBEQ(t)

*EQ(65), Nitrate forcing from industrial source
    oth_FNOXIEQ(t)
*EQ(66), Nitrate forcing from biomass source
    oth_FNOXBEQ(t)

*EQ(67), Sum of forcing from biomass source
    oth_FBIOEQ(t)
*Not reflected in the manual, Sum of forcing from direct aerosols
    oth_FAERDIREQ(t)

*EQ(69), Aerosol concentraion
   oth_AERCONCEQ(t)
*EQ(69), Cloud albedo forcing
    oth_FCLOUDABDOEQ(t)
*Not reflected in the manual, Total cloud forcing
    oth_FCLOUDTOTEQ(t)

*Simulating forcing from halogenated gases
*EQ(63)
    oth_HAEQ(t,fgs)
*EQ(64)
    oth_FHLEQ(t,fgs)
*Not reflected in the manual
    oth_FHALOEQ(t)
*Not reflected in the manual
*    oth_FKHALOEQ(t)
*Not reflected in the manual
*    oth_FMHALOEQ(t)

*EQ(71), Equivalent effective stratospheric chlorine concentration
    oth_EESCEQ(t)
*EQ(72), Stratospheric ozone forcing
    oth_FSTRATOZEQ(tstrat)

*Not reflected in the manual, Forcing from both human related sources and natural sources
    oth_FTOTEQ(t)

*EQ(80), Calculating effective radiative forcing
    oth_EFCO2EQ(T)
    oth_EFCH4EQ(T)
    oth_EFH2OEQ(T)
    oth_EFN2OEQ(T)
    oth_EFSTRATOZEQ(T)
    oth_EFTROPOZEQ(T)
    oth_EFAERDIREQ(T)
    oth_EFCLOUDABDOEQ(T)
    oth_EFCLOUDCOVEREQ(T)
    oth_EFSOLAREQ(T)
    oth_EFVOLCANICEQ(T)
    oth_EFLANDUSEEQ(T)
    oth_EFBCSNOWEQ(T)
    oth_EFHALOEQ(T)
*    oth_EFKHALOEQ(T)
*    oth_EFMHALOEQ(T)
*    EFXTRAEQ(T)
*    EFAIRH2OEQ(T)
*    EFCONTRAILEQ(T)
*    EFCIRRUSEQ(T)

*Not reflected in the manual
    oth_EFCO2CH4N2OEQ(t)
    oth_EFCLOUDTOTEQ(t)
*    oth_EFKYOTOEQ(t)
    oth_EFGHGEQ(t)

*EQ(81)
    oth_EFTOTALEQ(t)

    oth_DELTEMEQ(t)

    oth_FANTHROEQ(t)
    oth_EFANTHROEQ(t)
;

oth_CCO2EQ(t)..                           oth_conc(t,"co2")                =E= scm_atmoCO2(t);

*EQ(54), CO2 frocing
* oth_FCO2EQ(t)..                                 oth_fco2(t)                =E= fco22x * (log(scm_atmoCO2(t)/co2_conc_1765)/log(2));
oth_FCO2EQ(t)..                                 oth_fco2(t)                =E= 5.35 * log(1 + scm_D_CO2(t)/CO2_init);
oth_RELOHEQ(t)..                           oth_tau_reloh(t)                =E= (
                                                                            CH4_TAUTEMPSENSITIVITY*(oth_deltem(t+1)-deltT2k)+
                                                                           (oth_conc(t,"ch4")/def_conc2k("ch4"))**s_ch4 *
                                                                           exp(CNOX  *(dat_ems(t+1,"nox")  - (dat_eind0("2000","nox") + dat_elnd0("2000","nox")))+
                                                                               CCO   *(dat_ems(t+1,"co")   - (dat_eind0("2000","co")  + dat_elnd0("2000","co"))) +
                                                                               CNMVOC*(dat_ems(t+1,"voc")  - (dat_eind0("2000","voc") + dat_elnd0("2000","voc")))
                                                                           )
                                                                       );

*EQ(56), CH4 decay rates
oth_DCYCH4EQ(t)..                        oth_decay(t,"ch4")                =E= 1/tau_soil + 1/tau_strat + oth_tau_reloh(t)/CH4_TAUINIT;

*EQ(55), CH4 concentration
oth_CCH4EQ(t)$(t.val GE 2020)..           oth_conc(t,"ch4")                =E= (dat_ems(t,"ch4")+def_emsnat("ch4"))/ def_PPB2TG("ch4")+oth_conc(t-1,"ch4")*(1-oth_decay(t-1,"ch4"));


*EQ(60, 62), CH4 forcing
oth_FCH4EQ(t)..                                oth_fmeth(t)                =E= 0.036 * (oth_conc(t,"ch4")**0.5-def_preindconc("ch4")**0.5)
                                                                       -(fmn(oth_conc(t,"ch4"),def_preindconc("n2o"))-fmn(def_preindconc("ch4"),def_preindconc("n2o")));
*Not reflected in the manual, CH4 oxidation
oth_EMETHEQ(t)..                               oth_emeth(t)                =E= CH4_FOSSFUELFRACTION * CH4_OXIDATION_COEFF * (oth_conc(t,"ch4")-def_preindconc("ch4"))/CH4_TAUINIT;


*EQ(58), N2O life time
oth_TAU_N2OEQ(t)..                           oth_tau_n2o(t)                =E= N2O_TAUINIT * ( oth_conc(t,"n2o")/def_conc2k("n2o"))**s_n2o;

*EQ(59), N2O decay rates
oth_DCYN2OEQ(t)..                        oth_decay(t,"n2o")                =E= 1/oth_tau_n2o(t);

*EQ(59), N2O concentration
oth_CN2OEQ(t)$(t.val GE 2020)..           oth_conc(t,"n2o")                =E= (dat_ems(t,"n2o") + def_emsnat("n2o"))/ def_PPB2TG("n2o") + oth_conc(t-1,"n2o") *(1 - oth_decay(t-1,"n2o"));

*EQ(61, 62), N2O forcing
oth_FN2OEQ(t)..                                   oth_fn(t)                =E= 0.12 *  (oth_conc(t,"n2o")**0.5-def_preindconc("n2o")**0.5)
                                                                       -(fmn(def_preindconc("ch4"),oth_conc(t,"n2o"))-fmn(def_preindconc("ch4"),def_preindconc("n2o")));

*EQ(75), Stratospheric water vapor from CH4 oxidation
oth_FH2OEQ(t)..                                 oth_fh2o(t)                =E= STRATH2O * ( 0.036 * ( oth_conc(t,"ch4")**0.5 - def_preindconc("ch4")**0.5 ) );

*20160526 update to be consitent with MAGICC 6
*TROPO3 calibrated based on CMIP5, AR5 Table AII.5.2 value 31.1 du in 2000
*EQ(73), Tropospheric concentration
oth_COZEQ1(t)$(t.val LT 2020)..                  oth_coz(t)                =E= dat_his_coz(t);

oth_COZEQ2(t)$(t.val GE 2020)..                  oth_coz(t)                =E= TROPOZ_CONC_2K + (TROPOZ_OZCH4  *  log(oth_conc(t,"ch4")/CH4_CONC_2K) +
                                                                                         TROPOZ_OZNOX  *  (dat_ems(t,"nox")  - (dat_eind0("2000","nox") + dat_elnd0("2000","nox"))) +
                                                                                         TROPOZ_OZCO   *  (dat_ems(t,"co")   - (dat_eind0("2000","co")  + dat_elnd0("2000","co"))) +
                                                                                         TROPOZ_OZVOC  *  (dat_ems(t,"voc")  - (dat_eind0("2000","voc") + dat_elnd0("2000","voc")))
                                                                                         );

*EQ(74), Tropospheric forcing
oth_FTROPOZEQ(t)..                           oth_ftropoz(t)                =E= TROPOZ_RADEFF_WM2PERDU * (oth_coz(t)-TROPOZ_CONC_1765);

*Not reflected in the manual, Sum of forcing from CO2, CH4 and N2O
oth_FCO2CH4N2OEQ(t)..                     oth_fco2ch4n2o(t)                =E= oth_fco2(t) + oth_fmeth(t) + oth_fn(t);

*Not reflected in the manual, GHG forcing
oth_FGHGEQ(t)..                                 oth_fghg(t)                =E= oth_fco2ch4n2o(t) + oth_fhalo(t);

*Not reflected in the manual, Kyoto gases forcing
* oth_FKYOTOEQ(t)..                             oth_fkyoto(t)                =E= oth_fco2ch4n2o(t) + oth_fkhalo(t);

*EQ(65), BC forcing from industrial source
oth_FBCIEQ(t)$(t.val GE 2020)..                 oth_fbci(t)                =E= RF_BCI_DIR_WM2_2020 * dat_eind(t,"bc") / dat_eind0("2020","bc");

*EQ(66), BC forcing from biomass source
oth_FBCBEQ(t)$(t.val GE 2020)..                 oth_fbcb(t)                =E= RF_BCB_DIR_WM2_2020 * dat_elnd(t,"bc") / dat_elnd0("2020","bc");

*EQ(77), Focring effect from BC on snow
oth_FBCSNOWEQ(t)$(t.val GE 2020)..           oth_fbcsnow(t)                =E= -0.005265 + dat_ems(t,"bc") * 0.012767;

*EQ(65), Sulfate forcing from industrial source
oth_FSOXIEQ(t)$(t.val GE 2020)..               oth_fsoxi(t)                =E= RF_SOXI_DIR_WM2_2020 * dat_eind(t,"so2") / dat_eind0("2020","so2");

*EQ(66), Sulfate forcing from biomass source
oth_FSOXBEQ(t)$(t.val GE 2020)..               oth_fsoxb(t)                =E= RF_SOXB_DIR_WM2_2020 * dat_elnd(t,"so2") / dat_elnd0("2020","so2");

*EQ(65), OC forcing from industrial source
oth_FOCIEQ(t)$(t.val GE 2020)..                 oth_foci(t)                =E= RF_OCI_DIR_WM2_2020  * dat_eind(t,"oc")  / dat_eind0("2020","oc");

*EQ(66), OC forcing from biomass source
oth_FOCBEQ(t)$(t.val GE 2020)..                 oth_focb(t)                =E= RF_OCB_DIR_WM2_2020  * dat_elnd(t,"oc")  / dat_elnd0("2020","oc");

*EQ(65), Nitrate forcing from industrial source
oth_FNOXIEQ(t)$(t.val GE 2020)..               oth_fnoxi(t)                =E= RF_NOXI_DIR_WM2_2020 * dat_eind(t,"nox") / dat_eind0("2020","nox");

*EQ(66), Nitrate forcing from biomass source
oth_FNOXBEQ(t)$(t.val GE 2020)..               oth_fnoxb(t)                =E= RF_NOXB_DIR_WM2_2020 * dat_elnd(t,"nox") / dat_elnd0("2020","nox");

*EQ(67), Sum of forcing from biomass source
oth_FBIOEQ(t)..                                 oth_fbio(t)                =E= oth_fbcb(t) + oth_fsoxb(t) + oth_focb(t) + oth_fnoxb(t);

*Not reflected in the manual, Sum of forcing from direct aerosols
oth_FAERDIREQ(t)..                           oth_faerdir(t)                =E= oth_fbci(t) + oth_fsoxi(t) + oth_foci(t) + oth_fnoxi(t) + oth_fbio(t) + oth_fmindust(t);

*EQ(69), Aerosol concentraion
oth_AERCONCEQ(t)..                           oth_aerconc(t)                =E= (dat_eind(t,"nox")* 1    + dat_elnd(t,"nox") * 1   )         / 1.7  * 0.23+
                                                                       (dat_eind(t,"bc") * 0.6  + dat_elnd(t,"bc")  * 0.8 )         / 1    * 0.05+
                                                                       (dat_eind(t,"oc") * 0.8  + dat_elnd(t,"oc")  * 0.8 )         / 1    * 0.36+
                                                                       (dat_eind(t,"so2")* 1    + dat_elnd(t,"so2") * 1 + ESNAT* 1) / 1.77 * 0.36;

*EQ(69), Cloud albedo forcing
oth_FCLOUDABDOEQ(t)$(t.val GE 2020)..     oth_fcloudabdo(t)                =E= RF_CLOUD_ALBEDO_AER_WM2_2020 * (log(oth_aerconc(t)/AERCONC_1765))*CLOUD_ALBEDO_SCALE_FACTOR;

*Not reflected in the manual, Total cloud forcing
oth_FCLOUDTOTEQ(t)..                       oth_fcloudtot(t)                =E= oth_fcloudabdo(t) + oth_fcloudc(t);

*Simulating forcing from halogenated gases
*EQ(63)
oth_HAEQ(t+1,fgs)..                       oth_ha(t+1,fgs)                =E= oth_ha(t,fgs)*exp(-1/hf(fgs, "tau")) + (dat_ems(t,fgs)/hf(fgs, "mms")) / ( 0.1 * AtmosDryAirConst ) * hf(fgs, "tau") * (1.0-exp(-1/hf(fgs, "tau")));

*EQ(64)
oth_FHLEQ(t,fgs)..                         oth_fhl(t,fgs)                =E= hf(fgs, "rho")/1000 * (oth_ha(t,fgs) - hf(fgs, "ha0"));

*Not reflected in the manual
oth_FHALOEQ(t)..                               oth_fhalo(t)                =E= sum(fgs,oth_fhl(t,fgs));

*Not reflected in the manual
* oth_FKHALOEQ(t)..                             oth_fkhalo(t)                =E= sum(gas_kyoto,fhl(t,gas_kyoto));

*Not reflected in the manual
* oth_FMHALOEQ(t)..                             oth_fmhalo(t)                =E= sum(mhalo,fhl(t,mhalo));

*EQ(71), Equivalent effective stratospheric chlorine concentration
oth_EESCEQ(t)..                                 oth_eesc(t)                =E= EESC_SCALE_FACTOR * (sum(chlorine,def_sc3yr(chlorine, "ncl") * def_sc3yr(chlorine,"rlsf") * oth_ha(t, chlorine)) +

                                                                                            sum(bromine, def_sc3yr(bromine, "nbr")  * def_sc3yr(bromine, "rlsf") * oth_ha(t, bromine)) * STRATOZ_BR_VS_CL_SCALE
                                                                                           ) ;
*EQ(72), Stratospheric ozone forcing
oth_FSTRATOZEQ(tstrat)..               oth_fstratoz(tstrat)                =E= STRATOZ_O3SCALE * signPower((EESC_CONVERT_FACTOR*(oth_eesc(tstrat)-EESC_REFERENCE_1980)),STRATOZ_CLEXPON);
* oth_FSTRATOZEQ(tstrat)..               oth_fstratoz(tstrat)                =E= STRATOZ_O3SCALE * (EESC_CONVERT_FACTOR*(oth_eesc(tstrat)-EESC_REFERENCE_1980))**STRATOZ_CLEXPON;

*Not reflected in the manual, Forcing from both human related sources and natural sources
oth_FTOTEQ(t)..                                 oth_ftot(t)                =E= oth_fanthro(t) + oth_fsolar(t) + oth_fvolcanic(t);

*EQ(80), Calculating effective radiative forcing
oth_EFCO2EQ(t)..                               oth_efco2(t)                =E= oth_fco2(t)           * RF_EFFICACY_CO2;

oth_EFCH4EQ(t)..                               oth_efch4(t)                =E= oth_fmeth(t)          * RF_EFFICACY_CH4;

oth_EFH2OEQ(t)..                               oth_efh2o(t)                =E= oth_fh2o(t)           * RF_EFFICACY_CH4OXSTRATH2O;

oth_EFN2OEQ(t)..                               oth_efn2o(t)                =E= oth_fn(t)             * RF_EFFICACY_N2O;

oth_EFSTRATOZEQ(t)..                       oth_efstratoz(t)                =E= oth_fstratoz(t)       * RF_EFFICACY_STRATOZ;

oth_EFTROPOZEQ(t)..                         oth_eftropoz(t)                =E= oth_ftropoz(t)        * RF_EFFICACY_TROPOZ;

oth_EFAERDIREQ(t)..                         oth_efaerdir(t)                =E= oth_faerdir(t)        * RF_EFFICACY_AER_DIR;

oth_EFCLOUDABDOEQ(t)..                   oth_efcloudabdo(t)                =E= oth_fcloudabdo(t)     * RF_EFFICACY_CLOUD_ALBEDO;

oth_EFCLOUDCOVEREQ(t)..                 oth_efcloudcover(t)                =E= oth_fcloudc(t)        * RF_EFFICACY_CLOUD_COVER;

oth_EFSOLAREQ(t)..                           oth_efsolar(t)                =E= oth_fsolar(t)         * RF_EFFICACY_SOLAR;

oth_EFVOLCANICEQ(t)..                     oth_efvolcanic(t)                =E= oth_fvolcanic(t)      * RF_EFFICACY_VOLC;

oth_EFLANDUSEEQ(t)..                       oth_eflanduse(t)                =E= oth_flanduse(t)       * RF_EFFICACY_LANDUSE;

oth_EFBCSNOWEQ(t)..                         oth_efbcsnow(t)                =E= oth_fbcsnow(t)        * RF_EFFICACY_BCSNOW;

oth_EFHALOEQ(t)..                             oth_efhalo(t)                =E= oth_fhalo(t)          * RF_EFFICACY_FGAS;
* oth_EFKHALOEQ(t)..                           oth_efkhalo(t)                =E= oth_fkhalo(t)         * RF_EFFICACY_FGAS;

* oth_EFMHALOEQ(t)..                           oth_efmhalo(t)                =E= oth_fmhalo(t)         * RF_EFFICACY_MHALO;

*Not reflected in the manual
oth_EFCO2CH4N2OEQ(t)..                   oth_efco2ch4n2o(t)                =E= oth_efco2(t) + oth_efch4(t) + oth_efn2o(t);

oth_EFCLOUDTOTEQ(t)..                     oth_efcloudtot(t)                =E= oth_efcloudabdo(t) + oth_efcloudcover(t);

* oth_EFKYOTOEQ(t)..                           oth_efkyoto(t)                =E= oth_efco2ch4n2o(t) + oth_efkhalo(t);

oth_EFGHGEQ(t)..                               oth_efghg(t)                =E= oth_efco2ch4n2o(t) + oth_efhalo(t);

*EQ(81)
oth_EFTOTALEQ(t)..                           oth_eftotal(t)                =E= oth_efanthro(t) + oth_efsolar(t) + oth_efvolcanic(t);

oth_FANTHROEQ(t)..                           oth_fanthro(t)                =E= oth_fghg(t) + oth_faerdir(t) + oth_fcloudtot(t) + oth_fstratoz(t) + oth_ftropoz(t) + oth_fh2o(t) + oth_flanduse(t) + oth_fbcsnow(t);
oth_EFANTHROEQ(t)..                         oth_efanthro(t)                =E= oth_efghg(t) + oth_efaerdir(t) + oth_efcloudtot(t) + oth_efstratoz(t) + oth_eftropoz(t) + oth_efh2o(t) + oth_eflanduse(t) + oth_efbcsnow(t);

oth_DELTEMEQ(t+2)..                         oth_deltem(t+2)                =E= 2*scm_tatm(t+1)-scm_tatm(t)-deltT1900;

oth_deltem.fx(tfirst)=0;
oth_deltem.fx(tsecond)=0;

oth_fstratoz.fx(t)$(t.val LT 1980)     = 0;
oth_fstratoz.fx(t)$(t.val GT 2048)     = 0;

oth_ha.fx(tfirst,fgs)= hf(fgs, "ha0");

* oth_delsst.fx("1850")=0;
* oth_delsst.fx("1850")=0;

oth_deltem.fx("1850")=0;
oth_deltem.fx("1850")=0;

oth_tau_reloh.lo(t) = 0.01;
oth_conc.lo(t,ghg)  = 0.01;
oth_tau_n2o.lo(t)   = 0.01;
oth_aerconc.lo(t)   = 0.01;

* oth_eesc.lo(tstrat) = EESC_REFERENCE_1980;

oth_fbcsnow.fx(t)$(t.val LT 2020)       = oth_fbcsnow_hist(t);
oth_conc.fx(t,oghg)$(t.val LT 2020)     = oth_conc_hist(t,oghg);

oth_fcloudabdo.fx(t)$(t.val LT 2020)    = oth_fclouda(t);

oth_fsoxi.fx(t)$(t.val LT 2020)         = dat_rcp_SOXI_RF(t,"rcp45");
oth_fsoxb.fx(t)$(t.val LT 2020)         = dat_rcp_SOXB_RF(t,"rcp45");

oth_fnoxi.fx(t)$(t.val LT 2020)         = dat_rcp_NOXI_RF(t,"rcp45");
oth_fnoxb.fx(t)$(t.val LT 2020)         = dat_rcp_NOXB_RF(t,"rcp45");

oth_foci.fx(t)$(t.val LT 2020)          = dat_rcp_OCI_RF(t,"rcp45");
oth_focb.fx(t)$(t.val LT 2020)          = dat_rcp_OCB_RF(t,"rcp45");

oth_fbci.fx(t)$(t.val LT 2020)          = dat_rcp_BCI_RF(t,"rcp45");
oth_fbcb.fx(t)$(t.val LT 2020)          = dat_rcp_BCB_RF(t,"rcp45");