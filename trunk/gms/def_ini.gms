*Some predefined parameters
parameters

*Coefficients for converting PPB to TG
def_PPB2TG(oghg)
    /ch4    2.78
     n2o    4.81/

*Emissions from natural sources, units: MtCH4/yr        MtN2O-N/yr
def_emsnat(oghg)
    /ch4    274.47437
     n2o    8.4223662/

*Concentration in 1765 from MAGICC 6, units: ppb
def_preindconc(oghg)
    /ch4    721.89411
     n2o    272.95961/

*Concentration in 2000 from MAGICC 6, units: ppb
def_conc2k(oghg)
    /ch4    1750.7400
     n2o    316.12500/

*Number of years since 1765
nyr(tAll)

*Historical temperature (differences)
*deltT
def_deltT90
def_deltT2k
def_deltT1900
def_deltT1850
;





*deltT(t,rcp) =  2*rcp_tatm(t-1,rcp)-rcp_tatm(t-2,rcp);
def_deltT90      =  2*dat_rcp_tatm("1989","rcp45")-dat_rcp_tatm("1988","rcp45");
def_deltT2k      =  2*dat_rcp_tatm("1999","rcp45")-dat_rcp_tatm("1998","rcp45");
def_deltT1900    =  2*dat_rcp_tatm("1899","rcp45")-dat_rcp_tatm("1898","rcp45");
def_deltT1850 = 0;