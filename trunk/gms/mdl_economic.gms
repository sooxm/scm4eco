$TITLE Macroeconomic module for SCM4OPT
*Created since Apr., 2013, by Xuanming SU, suxuanming@gmail.com
*Based on DICE 2013R

$ifthen not set dmg
$setglobal dmg "ssp"
$endif

*Time period for simulating
* $include ../trunk/gms/set_year_2100.gms
$ifthen set CLP
set t(tAll) /1850*2100/;
set tlast(t);
tlast(t) = yes$(t.val eq 2100);

set tnotlast(t);
tnotlast(t) = yes$(t.val lt 2100);

parameter
    first_year                  /1850/
    last_year                   /2100/;

* *Projection period
set tp(t) /2020*2100/;
$else

set t(tAll) /1850*2550/;
set tlast(t);
tlast(t) = yes$(t.val eq 2550);

set tnotlast(t);
tnotlast(t) = yes$(t.val lt 2550);

parameter
    first_year                  /1850/
    last_year                   /2550/;

* *Projection period
set tp(t) /2020*2550/;
$endif

alias (t1,t);
set tfirst(t);
tfirst(t) = yes$(t.val eq 1850);

set tsecond(t);
tsecond(t) = yes$(t.val eq 1851);

alias (t1,t);


* *Historical period
set th(t) /1850*2019/;

* alias (tt,t);



set tpfirst(t);
tpfirst(t) = yes$(t.val eq 2020);

parameter
  ssp_scale /8.5/;




*All SSP scenarios
set      ssp        ssp scenarios
         /ssp1*ssp5/;



$include ../trunk/gms/dat_ssp.gms


table dat_mac_ems(gas_nonf,p_aim_mac)
;

$ifthen set use_mac
dat_mac_ems(gas_nonf,p_aim_mac) = dat_ssp_mac_ems(gas_nonf,"%use_mac%",p_aim_mac);
$else
dat_mac_ems(gas_nonf,p_aim_mac) = dat_ssp_mac_ems(gas_nonf,"%scen%",p_aim_mac);
$endif

display dat_mac_ems;

* parameter dat_miu_loss(p_aim_loss);

* dat_miu_loss(p_aim_loss) = dat_ssp_miu_loss("%scen%",p_aim_loss);

parameter 
dat_ssp_sig_eind(t,gas)
dat_ssp_sig_elnd(t,gas)
;


scalar max_cmiu;
max_cmiu = 0.3 / 10;

$Ifthen %scen% == "ssp1"
max_cmiu = 0.26 / 10;
$elseif %scen% == "ssp2"
max_cmiu = 0.19 / 10;
$elseif %scen% == "ssp3"
max_cmiu = 0.16 / 10;
$elseif %scen% == "ssp4"
max_cmiu = 0.25 / 10;
$elseif %scen% == "ssp5"
max_cmiu = 0.24 / 10;
$endif

parameter def_deltT1850 /0/;

parameters
        eco_l(t)           Level of population and labor
        eco_al(t)          Level of total factor productivity
*        albase(tp)     Baseline Level of total factor productivity
*        sigma(tp)      CO2-equivalent-emissions output ratio
        eco_rr(t)         Average utility social discount rate
        eco_ga(t)         Growth rate of productivity from 0 to T
*         eco_ga1(tp)         Growth rate of productivity from 0 to T
*        gl(tp)         Growth rate of labor (0 to T)
*        gcost1         Growth of cost factor
*        eco_gsig(tp)       Change in sigma (cumulative improvement of energy efficiency)

*        eco_cost1(tp)      Adjusted cost for backstop
*        partfract(tp)  Fraction of emissions in control regime
*        lam            Climate model parameter
*        gfacpop(tp)    Growth factor population
*        eco_pbacktime(tp)  Backstop price
        eco_optlrsav       Optimal long-run savings rate used for transversality

*        cpricebase(tp) Carbon price in base case
*        photel(tp)     Carbon Price under no damages (Hotelling rent condition)

**Time Step
       tstep Years per Period                                    /1/

** Preferences

       eco_elasmu   Elasticity of marginal utility of consumption     /  1.45 /
*        eco_elasmu   Elasticity of marginal utility of consumption     /  1.012462469 /

        
* eco_prstp annual 0.015, per 1/6 year =1-(1-0.015)^(1/6)
*       eco_prstp    Initial rate of social time preference per year   / 0.00251577  /
        eco_prstp    Initial rate of social time preference per year   / 0.015  /
        eco_gama     Capital elasticity in production function         /.300    /

* eco_dk annual 0.1, per 1/6 year=1-0.9^(1/6)
*        eco_dk       Depreciation rate on capital                      /0.017406806 /
        eco_dk       Depreciation rate on capital                      /0.1 /
        eco_q0       Initial world gross output (trill 2005 USD)       /65.2   /
        eco_k0       Initial capital value (trill 2005 USD)            /135     /
*        a0       Initial level of total factor productivity        /3.87    /
        eco_ga0      Initial growth rate for TFP per year              /0.082   /
       eco_dela     Decline rate of TFP per year                      /0.0072   /

        eco_e0       Industrial emissions 2010 (GtCO2 per year)           /33.61   /
        eco_miu0     Initial emissions control rate for base case 2010    /.0    /

        eco_gama1    Protection cost function coeff multiplier factor/0.4355/
        eco_gama2    Protection cost function coeff exponential term /4.4893/

        eco_a1       Initial Damage intercept                         /0.0005       /
        eco_a2       Initial Damage quadratic term                    /0.0025 /
        eco_a3        Damage exponent                                 /2.2523    /

        eco_gf(t)




*Parameters for storing initial assumptions and estimates
*SSPs emissions
        dat_ssp_ems(t,cm6_gas)

*CO2 emission intensity
        eco_co2_ind_sig(t)

*BASE case indutrial emissions
        dat_eind0(t,gas)
*Reduction parameters for industrial emissions
        eco_gind_a(gas)
        eco_gind_b(gas)

*Reduction parameters for biomass CCS
        eco_a_ccs_bio
        eco_b_ccs_bio

*BASE case land use emissions
        dat_elnd0(t,gas)
*Reduction parameters for land use emissions
        eco_glnd_a(gas)
        eco_glnd_b(gas)

*        a_lu(biome)
*        b_lu(biome)
*        c_lu(biome)
*        d_lu(biome)

* Carbon reduction parameters, MAC curves
        eco_mc1
        eco_mc2
        eco_ex1
        eco_ex2
        eco_gback     Initial cost decline backstop cost per period   / .0 /



** Availability of fossil fuels
        eco_fosslim        Maximum cumulative extraction fossil fuels (GtC) /10000/
*        eco_fosslim        Maximum cumulative extraction fossil fuels (GtC) /6000/

** Scaling and inessential parameters
* Note that these are unnecessary for the calculations but are for convenience
*        eco_scale1      Multiplicative scaling coefficient               /0.016408662 /
*        eco_scale2      Additive scaling coefficient                     /-3855.106895/
* eco_scale1      Multiplicative scaling coefficient               /1E-6/
eco_scale1      Multiplicative scaling coefficient               /1E-3/
eco_scale2      Additive scaling coefficient                     /200/
;

tstep = scm_dt;

$ifthen set prstp
        eco_prstp = %prstp%;
$endIf

*********************************For testing*****************************************************
parameter
*        eco_gsigma1  Initial growth of sigma (continuous per year)        /-0.01   /
        eco_gsigma1  Initial growth of sigma (continuous per year)        /-0.0151242   /
        eco_dsig     Decline rate of decarbonization per period           /-0.001  /
        eco_sig0     Sigma 2010 (industrial MTCO2 per thous 2005 USD 2010)
        eco_sig_dic(t)      CO2-equivalent-emissions output ratio
        eco_gsig(t)       Change in sigma (cumulative improvement of energy efficiency)
        eco_gsig_ssp_ind(t,gas)
        eco_gsig_ssp_lnd(t,gas)
        eco_sig0  /0.549/
;

parameter
dat_ems0(t,gas)
dat_ems_1850(gas)
dat_eind_1850(gas)
dat_elnd_1850(gas)
;



*Initialing assumptions and estimates
eco_l(t)$(t.val<2005)                     = dat_hisPop(t);
$ifthen set use_pop
eco_l(t)$(t.val>=2005)                     = dat_ssp_pop(t,"%use_pop%");
$else
eco_l(t)$(t.val>=2005)                     = dat_ssp_pop(t,"%scen%");
$endif

display eco_l;
* eco_mc1                       = dat_ssp_def("mc1","%scen%");
* eco_mc2                       = dat_ssp_def("mc2","%scen%");
* eco_ex1                       = dat_ssp_def("ex1","%scen%");
* eco_ex2                       = dat_ssp_def("ex2","%scen%");

dat_ssp_ems(t,cm6_gas)        = dat_%scen%_ems(t,cm6_gas);

dat_eind0(t,"co2")        = dat_ssp_ems(t,"co2i");
dat_eind0(t,"ch4")        = dat_ssp_ems(t,"ch4i");
dat_eind0(t,"n2o")        = dat_ssp_ems(t,"n2oi");
dat_eind0(t,"bc")         = dat_ssp_ems(t,"bci");
dat_eind0(t,"co")         = dat_ssp_ems(t,"coi");
dat_eind0(t,"nox")        = dat_ssp_ems(t,"noxi");
dat_eind0(t,"oc")         = dat_ssp_ems(t,"oci");
dat_eind0(t,"so2")        = dat_ssp_ems(t,"so2i");
dat_eind0(t,"nh3")        = dat_ssp_ems(t,"nh3i");
dat_eind0(t,"voc")        = dat_ssp_ems(t,"voci");


dat_eind0(t,"hfc23")        = dat_ssp_ems(t,"hfc23");
dat_eind0(t,"hfc32")        = dat_ssp_ems(t,"hfc32");
dat_eind0(t,"hfc125")        = dat_ssp_ems(t,"hfc125");
dat_eind0(t,"hfc134a")        = dat_ssp_ems(t,"hfc134a");
dat_eind0(t,"hfc143a")        = dat_ssp_ems(t,"hfc143a");
dat_eind0(t,"hfc152a")        = dat_ssp_ems(t,"hfc152a");
dat_eind0(t,"hfc227ea")        = dat_ssp_ems(t,"hfc227ea");
dat_eind0(t,"hfc236fa")        = dat_ssp_ems(t,"hfc236fa");
dat_eind0(t,"hfc245fa")        = dat_ssp_ems(t,"hfc245fa");
dat_eind0(t,"hfc365mfc")        = dat_ssp_ems(t,"hfc365mfc");
dat_eind0(t,"hfc4310mee")        = dat_ssp_ems(t,"hfc4310mee");
dat_eind0(t,"hfc134")        = dat_ssp_ems(t,"hfc134");
dat_eind0(t,"hfc143")        = dat_ssp_ems(t,"hfc143");
dat_eind0(t,"hfc41")        = dat_ssp_ems(t,"hfc41");
dat_eind0(t,"sf6")        = dat_ssp_ems(t,"sf6");
dat_eind0(t,"nf3")        = dat_ssp_ems(t,"nf3");
dat_eind0(t,"cf4")        = dat_ssp_ems(t,"cf4");
dat_eind0(t,"c2f6")        = dat_ssp_ems(t,"c2f6");
dat_eind0(t,"c3f8")        = dat_ssp_ems(t,"c3f8");
dat_eind0(t,"cc4f8")        = dat_ssp_ems(t,"cc4f8");
dat_eind0(t,"c4f10")        = dat_ssp_ems(t,"c4f10");
dat_eind0(t,"c5f12")        = dat_ssp_ems(t,"c5f12");
dat_eind0(t,"c6f14")        = dat_ssp_ems(t,"c6f14");
dat_eind0(t,"c7f16")        = dat_ssp_ems(t,"c7f16");
dat_eind0(t,"cfc11")        = dat_ssp_ems(t,"cfc11");
dat_eind0(t,"cfc12")        = dat_ssp_ems(t,"cfc12");
dat_eind0(t,"cfc113")        = dat_ssp_ems(t,"cfc113");
dat_eind0(t,"cfc114")        = dat_ssp_ems(t,"cfc114");
dat_eind0(t,"cfc115")        = dat_ssp_ems(t,"cfc115");
dat_eind0(t,"ccl4")        = dat_ssp_ems(t,"ccl4");
dat_eind0(t,"ch3ccl3")        = dat_ssp_ems(t,"ch3ccl3");
dat_eind0(t,"hcfc22")        = dat_ssp_ems(t,"hcfc22");
dat_eind0(t,"hcfc141b")        = dat_ssp_ems(t,"hcfc141b");
dat_eind0(t,"hcfc142b")        = dat_ssp_ems(t,"hcfc142b");
dat_eind0(t,"halon1211")        = dat_ssp_ems(t,"halon1211");
dat_eind0(t,"halon1202")        = dat_ssp_ems(t,"halon1202");
dat_eind0(t,"halon1301")        = dat_ssp_ems(t,"halon1301");
dat_eind0(t,"halon2402")        = dat_ssp_ems(t,"halon2402");
dat_eind0(t,"ch3br")        = dat_ssp_ems(t,"ch3br");
dat_eind0(t,"ch3cl")        = dat_ssp_ems(t,"ch3cl");

dat_elnd0(t,"co2")      = dat_ssp_ems(t,"co2l");
dat_elnd0(t,"ch4")      = dat_ssp_ems(t,"ch4l");
dat_elnd0(t,"n2o")      = dat_ssp_ems(t,"n2ol");
dat_elnd0(t,"bc")       = dat_ssp_ems(t,"bcl");
dat_elnd0(t,"co")       = dat_ssp_ems(t,"col");
dat_elnd0(t,"nox")      = dat_ssp_ems(t,"noxl");
dat_elnd0(t,"oc")       = dat_ssp_ems(t,"ocl");
dat_elnd0(t,"so2")      = dat_ssp_ems(t,"so2l");
dat_elnd0(t,"nh3")      = dat_ssp_ems(t,"nh3l");
dat_elnd0(t,"voc")      = dat_ssp_ems(t,"vocl");

dat_elnd0(t,fgs)       = 0;




eco_co2_ind_sig(t)          =  dat_ssp_sig_co2_ind(t,"%scen%");
*ssp_sig_co2_ind(t,"%scen%");
*eco_sig_dic(t);


* eco_gind_a("ch4")            = dat_ssp_def("a_ch4_ind","%scen%");
* eco_gind_a("n2o")            = dat_ssp_def("a_n2o_ind","%scen%");
* eco_gind_a("bc")             = dat_ssp_def("a_bc_ind","%scen%");
* eco_gind_a("co")             = dat_ssp_def("a_co_ind","%scen%");
* eco_gind_a("nox")            = dat_ssp_def("a_nox_ind","%scen%");
* eco_gind_a("oc")             = dat_ssp_def("a_oc_ind","%scen%");
* eco_gind_a("so2")            = dat_ssp_def("a_sul_ind","%scen%");
* eco_gind_a("nh3")            = dat_ssp_def("a_nh3_ind","%scen%");
* eco_gind_a("voc")            = dat_ssp_def("a_voc_ind","%scen%");
* eco_gind_a("cf4")            = dat_ssp_def("a_cf4_ind","%scen%");
* eco_gind_a("c2f6")           = dat_ssp_def("a_c2f6_ind","%scen%");
* eco_gind_a("c6f14")          = dat_ssp_def("a_c6f14_ind","%scen%");
* eco_gind_a("hfc23")          = dat_ssp_def("a_hfc23_ind","%scen%");
* eco_gind_a("hfc32")          = dat_ssp_def("a_hfc32_ind","%scen%");
* eco_gind_a("hfc4310mee")        = dat_ssp_def("a_hfc4310_ind","%scen%");
* eco_gind_a("hfc125")         = dat_ssp_def("a_hfc125_ind","%scen%");
* eco_gind_a("hfc134a")        = dat_ssp_def("a_hfc134a_ind","%scen%");
* eco_gind_a("hfc143a")        = dat_ssp_def("a_hfc143a_ind","%scen%");
* eco_gind_a("hfc227ea")       = dat_ssp_def("a_hfc227ea_ind","%scen%");
* eco_gind_a("hfc245fa")       = dat_ssp_def("a_hfc245fa_ind","%scen%");
* eco_gind_a("sf6")            = dat_ssp_def("a_sf6_ind","%scen%");
* eco_gind_a(mhalo)            = 0;

* eco_gind_b("ch4")            = dat_ssp_def("b_ch4_ind","%scen%");
* eco_gind_b("n2o")            = dat_ssp_def("b_n2o_ind","%scen%");
* eco_gind_b("bc")             = dat_ssp_def("b_bc_ind","%scen%");
* eco_gind_b("co")             = dat_ssp_def("b_co_ind","%scen%");
* eco_gind_b("nox")            = dat_ssp_def("b_nox_ind","%scen%");
* eco_gind_b("oc")             = dat_ssp_def("b_oc_ind","%scen%");
* eco_gind_b("so2")            = dat_ssp_def("b_sul_ind","%scen%");
* eco_gind_b("nh3")            = dat_ssp_def("b_nh3_ind","%scen%");
* eco_gind_b("voc")            = dat_ssp_def("b_voc_ind","%scen%");
* eco_gind_b("cf4")            = dat_ssp_def("b_cf4_ind","%scen%");
* eco_gind_b("c2f6")           = dat_ssp_def("b_c2f6_ind","%scen%");
* eco_gind_b("c6f14")          = dat_ssp_def("b_c6f14_ind","%scen%");
* eco_gind_b("hfc23")          = dat_ssp_def("b_hfc23_ind","%scen%");
* eco_gind_b("hfc32")          = dat_ssp_def("b_hfc32_ind","%scen%");
* eco_gind_b("hfc4310mee")        = dat_ssp_def("b_hfc4310_ind","%scen%");
* eco_gind_b("hfc125")         = dat_ssp_def("b_hfc125_ind","%scen%");
* eco_gind_b("hfc134a")        = dat_ssp_def("b_hfc134a_ind","%scen%");
* eco_gind_b("hfc143a")        = dat_ssp_def("b_hfc143a_ind","%scen%");
* eco_gind_b("hfc227ea")       = dat_ssp_def("b_hfc227ea_ind","%scen%");
* eco_gind_b("hfc245fa")       = dat_ssp_def("b_hfc245fa_ind","%scen%");
* eco_gind_b("sf6")            = dat_ssp_def("b_sf6_ind","%scen%");
* eco_gind_b(mhalo)            = 1;

* eco_a_ccs_bio                = dat_ssp_def("a_ccs_bio","%scen%");
* eco_b_ccs_bio                = dat_ssp_def("b_ccs_bio","%scen%");


* eco_glnd_a("co2")            = dat_ssp_def("a_co2_lnd","%scen%");
* eco_glnd_a("ch4")            = dat_ssp_def("a_ch4_lnd","%scen%");
* eco_glnd_a("n2o")            = dat_ssp_def("a_n2o_lnd","%scen%");
* eco_glnd_a("bc")             = dat_ssp_def("a_bc_lnd","%scen%");
* eco_glnd_a("co")             = dat_ssp_def("a_co_lnd","%scen%");
* eco_glnd_a("nox")            = dat_ssp_def("a_nox_lnd","%scen%");
* eco_glnd_a("oc")             = dat_ssp_def("a_oc_lnd","%scen%");
* eco_glnd_a("so2")            = dat_ssp_def("a_sul_lnd","%scen%");
* eco_glnd_a("nh3")            = dat_ssp_def("a_nh3_lnd","%scen%");
* eco_glnd_a("voc")            = dat_ssp_def("a_voc_lnd","%scen%");
* eco_glnd_a(halo)             = 0;

* eco_glnd_b("co2")            = dat_ssp_def("b_co2_lnd","%scen%");
* eco_glnd_b("ch4")            = dat_ssp_def("b_ch4_lnd","%scen%");
* eco_glnd_b("n2o")            = dat_ssp_def("b_n2o_lnd","%scen%");
* eco_glnd_b("bc")             = dat_ssp_def("b_bc_lnd","%scen%");
* eco_glnd_b("co")             = dat_ssp_def("b_co_lnd","%scen%");
* eco_glnd_b("nox")            = dat_ssp_def("b_nox_lnd","%scen%");
* eco_glnd_b("oc")             = dat_ssp_def("b_oc_lnd","%scen%");
* eco_glnd_b("so2")            = dat_ssp_def("b_sul_lnd","%scen%");
* eco_glnd_b("nh3")            = dat_ssp_def("b_nh3_lnd","%scen%");
* eco_glnd_b("voc")            = dat_ssp_def("b_voc_lnd","%scen%");
* eco_glnd_b(halo)             = 1;


eco_gama2                    = dat_gama2s("%scen%");

* (1-0.025)^(1/30)
* eco_gback                    = dat_ssp_def("gback","%scen%");
eco_gback = 0.000843571;


eco_gf(th)                   = 1;
eco_gf(tp)                   = (1-eco_gback)**ord(tp);
* eco_gf(tp)                       = 1;
*eco_al("2010")               = a0;

$ifthen set use_gdp
$Ifthen %use_gdp% == "ssp1"
ssp_scale=8.5;
$elseIf %use_gdp% == "ssp2"
ssp_scale=7.8;
$elseIf %use_gdp% == "ssp3"
ssp_scale=8.3;
$elseIf %use_gdp% == "ssp4"
ssp_scale=7.4;
$elseIf %use_gdp% == "ssp5"
ssp_scale=7.6;
$endif
ssp_scale=1;
eco_al(t)                    = dat_ssp_al(t,"%use_gdp%")*ssp_scale;
$else
$Ifthen %scen% == "ssp1"
ssp_scale=8.5;
$elseIf %scen% == "ssp2"
ssp_scale=7.8;
$elseIf %scen% == "ssp3"
ssp_scale=8.3;
$elseIf %scen% == "ssp4"
ssp_scale=7.4;
$elseIf %scen% == "ssp5"
ssp_scale=7.6;
$endif
ssp_scale=1;
eco_al(t)                    = dat_ssp_al(t,"%scen%")*ssp_scale;
$endIf

$ifthen set gdp_scale
eco_al(t) = eco_al(t) * %gdp_scale%;
$endif


eco_rr(th)                   = 1;
eco_rr(tp)                   = 1/((1+eco_prstp)**(tstep*ord(tp)));

eco_optlrsav = (eco_dk + .004)/(eco_dk + .004*eco_elasmu + eco_prstp)*eco_gama;

eco_sig_dic(th) = dat_ssp_sig_co2_ind(th,"%scen%");
eco_gsig("2020")=eco_gsigma1;   
loop(tp,eco_gsig(tp+1)=eco_gsig(tp)*((1+eco_dsig)**tstep) ;);
eco_sig_dic("2020")=eco_sig0/44.01*12.0107;   loop(tp,eco_sig_dic(tp+1)=(eco_sig_dic(tp)*exp(eco_gsig(tp)*tstep)););
        
dat_ssp_sig_eind(t,gas)$(t.val<=2100) = dat_eind0(t,gas) / dat_ssp_gdp_ref(t,"%scen%");
dat_ssp_sig_elnd(t,gas)$(t.val<=2100) = dat_elnd0(t,gas) / dat_ssp_gdp_ref(t,"%scen%");

eco_gsig_ssp_ind(t,gas) = 0;
eco_gsig_ssp_lnd(t,gas) = 0;
display dat_ssp_sig_eind, dat_ssp_sig_elnd;
loop(t$(t.val<=2100),
        eco_gsig_ssp_ind(t+1,gas)$(dat_ssp_sig_eind(t,gas)>0 and dat_ssp_sig_eind(t+1,gas)>0) = log(dat_ssp_sig_eind(t+1,gas) / dat_ssp_sig_eind(t,gas))/tstep;
        eco_gsig_ssp_lnd(t+1,gas)$(dat_ssp_sig_elnd(t,gas)>0 and dat_ssp_sig_elnd(t+1,gas)>0) = log(dat_ssp_sig_elnd(t+1,gas) / dat_ssp_sig_elnd(t,gas))/tstep;
);



scalar loop_yr /2100/;


loop(tp$(tp.val>=loop_yr),
        eco_gsig_ssp_ind(tp+1,gas)=eco_gsig_ssp_ind(tp,gas)*((1+eco_dsig)**tstep);
        eco_gsig_ssp_lnd(tp+1,gas)=eco_gsig_ssp_lnd(tp,gas)*((1+eco_dsig)**tstep);
);


$Ifthen %scen% == "ssp3"
loop(tp$(tp.val>=2100),
       dat_ssp_sig_eind(tp+1,gas)=(dat_ssp_sig_eind(tp,gas)*((1+eco_dsig*10)**tstep));
       dat_ssp_sig_elnd(tp+1,gas)=(dat_ssp_sig_elnd(tp,gas)*((1+eco_dsig*10)**tstep));
);
$elseIf %scen% == "ssp2"
loop(tp$(tp.val>=2100),
        dat_ssp_sig_eind(tp+1,gas)=(dat_ssp_sig_eind(tp,gas)*exp(eco_gsig_ssp_ind(tp,gas)*1.5*tstep));
        dat_ssp_sig_elnd(tp+1,gas)=(dat_ssp_sig_elnd(tp,gas)*exp(eco_gsig_ssp_lnd(tp,gas)*1.5*tstep));
);
$else
loop(tp$(tp.val>=2100),
        dat_ssp_sig_eind(tp+1,gas)=(dat_ssp_sig_eind(tp,gas)*exp(eco_gsig_ssp_ind(tp,gas)*tstep));
        dat_ssp_sig_elnd(tp+1,gas)=(dat_ssp_sig_elnd(tp,gas)*exp(eco_gsig_ssp_lnd(tp,gas)*tstep));
);
$endif



dat_eind0(tp,gas)$(tp.val>2100) =  dat_ssp_sig_eind(tp,gas) * dat_ssp_gdp_ref(tp,"%scen%");
dat_elnd0(tp,gas)$(tp.val>2100) =  dat_ssp_sig_elnd(tp,gas) * dat_ssp_gdp_ref(tp,"%scen%");



loop((tp,gas),
        If (dat_eind0(tp,gas) < dat_eind0("1850",gas),
                dat_eind0(tp,gas) = dat_eind0("1850",gas);
        ) ;
);

loop((tp,gas),
        If (dat_elnd0(tp,gas) < dat_elnd0("1850",gas),
                dat_elnd0(tp,gas) = dat_elnd0("1850",gas);
        ) ;
);



dat_ems0(t,gas) = dat_eind0(t,gas) + dat_elnd0(t,gas);
dat_ems_1850(gas)=dat_ems0("1850",gas);

dat_eind_1850(gas) = dat_eind0("1850",gas);
dat_elnd_1850(gas) = dat_elnd0("1850",gas);

VARIABLES
         scm_tatm(t)

         dat_ems(t,gas)      Total emissions
         eco_cgross_ind(t)   Gross indutrial CO2 emissions
         eco_eco2ch4n2o(t)
         eco_cabate_ind(t)   Indutrial CO2 emissions that are removed
*         eco_ccs_bio(t)      CO2 removed by bimass CCS
         eco_cind(t)         CO2 emissions after abated
         dat_eind(t,gas)     Industrial emissions
         dat_elnd(t,gas)     Land use emissions

         eco_miu(t,gas_nonf)      Emission control rate of GHGs
        eco_cmiu(t)         Emission control rate of industrial CO2
*         beccs_miu(t)

         eco_c(t)            Consumption (trillions 2005 US dollars per year)
         eco_k(t)            Capital stock (trillions 2005 US dollars)
         eco_cpc(t)          Per capita consumption (thousands 2005 USD per year)
         eco_i(t)            Investment (trillions 2005 USD per year)
         eco_s(t)            Gross savings rate as fraction of gross world product
         eco_ri(t)           Real interest rate (per annum)
         eco_y(t)            Gross world product net of abatement and damages (trillions 2005 USD per year)
         eco_ygross(t)       Gross world product GROSS of abatement and damages (trillions 2005 USD per year)
         eco_ynet(t)         Output net of damages equation (trillions 2005 USD per year)

         eco_gd(t)           Gross Damages (trillions 2005 USD per year)
         eco_gdfrac(t)       Gross Damages as fraction of gross output
         eco_abatecost(t)    Cost of emissions reductions  (trillions 2005 USD per year)


         eco_mcabate(t)      Marginal cost of abatement (2005$ per ton CO2)
*         eco_cca(t)          Cumulative industrial carbon emissions (GTC)
         eco_periodu(t)      One period utility function
         eco_cprice(t)       Carbon price (2005$ per ton of CO2)

         eco_cemutotper(t)   Period utility

*         eco_p(t)            Protection levels (of gross damages)
*         eco_pc(t)           Protection costs (trillions 2005 USD per year)
         eco_rd(t)           Residual damages (trillions 2005 USD per year)

         obj             Welfare function
;

NONNEGATIVE VARIABLES  eco_miu,  eco_cmiu, eco_cprice, eco_mcabate;

POSITIVE VARIABLES eco_ygross, eco_ynet, eco_y, eco_c, eco_k, eco_i, eco_cpc;

*NONNEGATIVE VARIABLES  eco_miu, eco_cmiu, beccs_miu, eco_mcabate, eco_p, eco_pc;

*POSITIVE VARIABLES eco_ygross, eco_ynet, eco_y, eco_c, eco_k, eco_i, eco_cpc;

EQUATIONS
*EQ(2), Industrial emissions
         eco_EINDEQ(t,gas_nonf)
         eco_EFGSEQ(t,fgs)
*EQ(1), Gross industrial CO2 emission
         eco_CGROSSINDEQ(t)

        eco_ECO2CH4N2OEQ(t)
*EQ(1), Abated industrial CO2 emission
         eco_CABATEEQ(t)

*Not reflected in the manual, CO2 removed by bimass CCS
*         eco_CCSBIOEQ1(t)
*         eco_CCSBIOEQ2(t)

*EQ(1), Net industrial CO2 emission
*         eco_CINDEQ(t)
*         eco_CNETINDEQ(t)

*EQ(5), Anthropogenic emissions
         eco_EMSEQ(t,gas)


*EQ(2), Control rates of industrial emissions
*         eco_OMIUEQ(t,ogas)
*EQ(2), Control rates of industrial CO2 emissions
        eco_CMIUEQ(t)

*         eco_BECCSMIUEQ(t)

*Not reflected in the manual, accumulative CO2 emissions
*         eco_CCAEQ(t)

*EQ(8), Gross output
         eco_YGROSSEQ(t)
*         eco_YGROSSEQ1(t)
*EQ(9), Net gross output
         eco_YNETEQ(t)
*EQ(9), Gross output net of mitigation cost, adaptation cost and residual damages
         eco_YEQ(t)
*EQ(10), consumption
         eco_CEQ(t)

*Not reflected in the manual, per capita consumption
         eco_CPCEQ(t)
*EQ(12), Investment
         eco_SEQ(t)

*EQ(13), Captital stock
*        eco_KEQ1(th)
*        eco_KEQ2(tp)
       eco_KEQ(t)

*Not reflected in the manual, real nterest rate
         eco_RIEQ(t)

*EQ(14), Gross damage level
      eco_GDFRACEQ(t)
*      eco_GDFRACEQ1(th)
*      eco_GDFRACEQ2(tp)
*EQ(14), Gross damages
         eco_GDEQ(t)
*EQ(16), Abatement costs
         eco_ABATEEQ(t)
*EQ(15), Marginal abatement cost
         eco_MCABATEEQ(t)
*EQ(15), Carbon price


*      eco_miuEQ(t,gas_nonf)

*EQ(17), Residual damages
*         eco_RDEQ(t)
*EQ(18), Adaptation costs
*         eco_ADEQ(t)

*EQ(19), Utility
         eco_CEMUTOTPEREQ(t)


*EQ(19), Anual utility
     eco_PERIODUEQ(t)
*        eco_PERIODUEQ1(th)
*        eco_PERIODUEQ2(tp)

*EQ(20), Objective function
         eco_objEQ
;

*Used for fixed non-CO2 running
$ifthen set fixnco2
Equation
         eco_ELNDEQ1(tp)
         eco_ELNDEQ2(tp,ogas)
         eco_ELNDEQ3(th,gas)
;
eco_ELNDEQ1(tp)$tt(tp)..                  dat_elnd(tp,"co2")         =E= tb_co2lnd(tp,"%scen%");
eco_ELNDEQ2(tp,ogas)$tt(tp)..              dat_elnd(tp,ogas)         =E= 0;
eco_ELNDEQ3(th,gas)$tt(th)..              dat_elnd(th,gas)           =E= dat_elnd0(th,gas);

$else
Equation
         eco_ELNDEQ(t,gas)
;
*EQ(4), Land use emissions
* eco_ELNDEQ(t,gas)..                  dat_elnd(t,gas)         =E= dat_elnd0(t,gas) *( 1 - eco_glnd_a(gas) * eco_cprice(t) ** eco_glnd_b(gas));
* eco_ELNDEQ(t,gas)..                  dat_elnd(t,gas)         =E= dat_elnd0(t,gas);
$ifthen set reff
eco_ELNDEQ(t,gas)..                  dat_elnd(t,gas)         =E= dat_elnd0(t,gas);
$else
eco_ELNDEQ(t,gas)..                  dat_elnd(t,gas)         =E= dat_ssp_sig_elnd(t,gas) * eco_ygross(t);
$endIf

$endif

*Used for DICE-2013 running
$ifthen set diceprice
parameter
         eco_expcost2  Exponent of control cost function               / 2.8  /
         eco_pback     Cost of backstop 2005$ per tCO2 2010
*         eco_gback     Initial cost decline backstop cost per period   / .025 /
         eco_limmiu    Upper limit on control rate after 2150          / 1.2  /
         eco_tnopol    Period before which no emissions controls base  / 45   /
         eco_cprice0   Initial base carbon price                       / 1    /
         eco_gcprice   Growth rate of base carbon price per year       /.02   /

         eco_pbacktime(t)
         eco_cost1(t)      Adjusted cost for backstop
;
equation 
eco_OGSMIUEQ(t,gas_noncf)
eco_CARBPRICEEQ(t)
;


eco_pback         = 550;
*DICE2013R
eco_gback         = .005;
eco_pbacktime(th) = eco_pback;
eco_pbacktime(tp) = eco_pback*(1-eco_gback)**(tp.val-2020);
eco_cost1(t)      = eco_pbacktime(t)*eco_co2_ind_sig(t)/eco_expcost2/1000;


* eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= eco_ygross(t) * eco_cost1(t) * (eco_cmiu(t)**eco_expcost2);
* /tstep account for eco_cgross_ind emissions (1/6yr)
eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= eco_cgross_ind(t)* 44.01/12.0107 /tstep * eco_pbacktime(t)/eco_expcost2/1000 * (eco_cmiu(t)**eco_expcost2);
eco_MCABATEEQ(t)..                   eco_mcabate(t)          =E= eco_pbacktime(t) * eco_cmiu(t)**(eco_expcost2-1);
eco_CARBPRICEEQ(t)..                 eco_cprice(t)           =E= eco_pbacktime(t) * eco_cmiu(t)**(eco_expcost2-1);


eco_OGSMIUEQ(t,gas_noncf)..                      eco_miu(t,gas_noncf)        =E= 0;

$else

Equation
         eco_CARBPRICEEQ1(t)
;
eco_CARBPRICEEQ1(t)..                 eco_cprice(t)           =E= (dat_mac_ems("co2","a")*rPower(eco_miu(t,"co2"),dat_mac_ems("co2","c"))+dat_mac_ems("co2","b")*rPower(eco_miu(t,"co2"),dat_mac_ems("co2","d")))*eco_gf(t);

$ifthen not set only_abate_co2
Equation
         eco_CARBPRICEEQ2(t)
         eco_CARBPRICEEQ3(t)
         eco_CARBPRICEEQ4(t)
         eco_CARBPRICEEQ5(t)
         eco_CARBPRICEEQ6(t)
         eco_CARBPRICEEQ7(t)
         eco_CARBPRICEEQ8(t)
         eco_CARBPRICEEQ9(t)
         eco_CARBPRICEEQ10(t)
;
*EQ(16), Abatement costs
eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= (
                                                                 (eco_cgross_ind(t)* 44.01/12.0107 *(dat_mac_ems("co2","a")*eco_miu(t,"co2")**(dat_mac_ems("co2","c")+1)/(dat_mac_ems("co2","c")+1)+dat_mac_ems("co2","b")*eco_miu(t,"co2")**(dat_mac_ems("co2","d")+1)/(dat_mac_ems("co2","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("co2") 
                                                                +(dat_eind(t,"ch4")/1E3*(dat_mac_ems("ch4","a")*eco_miu(t,"ch4")**(dat_mac_ems("ch4","c")+1)/(dat_mac_ems("ch4","c")+1)+dat_mac_ems("ch4","b")*eco_miu(t,"ch4")**(dat_mac_ems("ch4","d")+1)/(dat_mac_ems("ch4","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("ch4")
                                                                +(dat_eind(t,"n2o")*44.013 / (14.0067 * 2)/1E3*(dat_mac_ems("n2o","a")*eco_miu(t,"n2o")**(dat_mac_ems("n2o","c")+1)/(dat_mac_ems("n2o","c")+1)+dat_mac_ems("n2o","b")*eco_miu(t,"n2o")**(dat_mac_ems("n2o","d")+1)/(dat_mac_ems("n2o","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("n2o")
                                                                )/tstep;

* eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= dat_miu_loss("a")*eco_cmiu(t)**dat_miu_loss("b");
* 
*                                                                 +(dat_eind(t,"bc")/1E6*(dat_mac_ems("bc","a")*eco_miu(t,"bc")**(dat_mac_ems("bc","c")+1)/(dat_mac_ems("bc","c")+1)+dat_mac_ems("bc","b")*eco_miu(t,"bc")**(dat_mac_ems("bc","d")+1)/(dat_mac_ems("bc","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"so2")/1E6*(dat_mac_ems("so2","a")*eco_miu(t,"so2")**(dat_mac_ems("so2","c")+1)/(dat_mac_ems("so2","c")+1)+dat_mac_ems("so2","b")*eco_miu(t,"so2")**(dat_mac_ems("so2","d")+1)/(dat_mac_ems("so2","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"nox")/1E6*(dat_mac_ems("nox","a")*eco_miu(t,"nox")**(dat_mac_ems("nox","c")+1)/(dat_mac_ems("nox","c")+1)+dat_mac_ems("nox","b")*eco_miu(t,"nox")**(dat_mac_ems("nox","d")+1)/(dat_mac_ems("nox","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"oc")/1E6*(dat_mac_ems("oc","a")*eco_miu(t,"oc")**(dat_mac_ems("oc","c")+1)/(dat_mac_ems("oc","c")+1)+dat_mac_ems("oc","b")*eco_miu(t,"oc")**(dat_mac_ems("oc","d")+1)/(dat_mac_ems("oc","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"co")/1E6*(dat_mac_ems("co","a")*eco_miu(t,"co")**(dat_mac_ems("co","c")+1)/(dat_mac_ems("co","c")+1)+dat_mac_ems("co","b")*eco_miu(t,"co")**(dat_mac_ems("co","d")+1)/(dat_mac_ems("co","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"voc")/1E6*(dat_mac_ems("voc","a")*eco_miu(t,"voc")**(dat_mac_ems("voc","c")+1)/(dat_mac_ems("voc","c")+1)+dat_mac_ems("voc","b")*eco_miu(t,"voc")**(dat_mac_ems("voc","d")+1)/(dat_mac_ems("voc","d")+1))/1000)*eco_gf(t)
*                                                                 +(dat_eind(t,"nh3")/1E6*(dat_mac_ems("nh3","a")*eco_miu(t,"nh3")**(dat_mac_ems("nh3","c")+1)/(dat_mac_ems("nh3","c")+1)+dat_mac_ems("nh3","b")*eco_miu(t,"nh3")**(dat_mac_ems("nh3","d")+1)/(dat_mac_ems("nh3","d")+1))/1000)*eco_gf(t);
* eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= (eco_cgross_ind(t)*(eco_mc1*eco_miu(t,"co2")**(eco_ex1+1)/(eco_ex1+1)+eco_mc2*eco_miu(t,"co2")**(eco_ex2+1)/(eco_ex2+1))/1000)*eco_gf(t);
*EQ(15), Marginal abatement cost
* eco_MCABATEEQ(t)..                   eco_mcabate(t)          =E= (eco_mc1 * eco_cmiu(t)**eco_ex1 + eco_mc2* eco_cmiu(t)**eco_ex2)*eco_gf(t);
*EQ(15), Carbon price
* eco_CARBPRICEEQ(t)..                 eco_cprice(t)           =E= (eco_mc1 * eco_cmiu(t)**eco_ex1 + eco_mc2* eco_cmiu(t)**eco_ex2)*eco_gf(t);

*EQ(15), Carbon price
* eco_CARBPRICEEQ1(t)..                 eco_cprice(t)           =E= (dat_mac_ems("co2","a")*eco_miu(t,"co2")**dat_mac_ems("co2","c")+dat_mac_ems("co2","b")*eco_miu(t,"co2")**dat_mac_ems("co2","d"))*eco_gf(t);
* eco_CARBPRICEEQ2(t)..                 eco_cprice(t)           =E= (dat_mac_ems("ch4","a")*eco_miu(t,"ch4")**dat_mac_ems("ch4","c")+dat_mac_ems("ch4","b")*eco_miu(t,"ch4")**dat_mac_ems("ch4","d"))*eco_gf(t);
* eco_CARBPRICEEQ3(t)..                 eco_cprice(t)           =E= (dat_mac_ems("n2o","a")*eco_miu(t,"n2o")**dat_mac_ems("n2o","c")+dat_mac_ems("n2o","b")*eco_miu(t,"n2o")**dat_mac_ems("n2o","d"))*eco_gf(t);
* eco_CARBPRICEEQ4(t)..                 eco_cprice(t)           =E= (dat_mac_ems("bc","a") *eco_miu(t,"bc")**dat_mac_ems("bc","c")+dat_mac_ems("bc","b")*eco_miu(t,"bc")**dat_mac_ems("bc","d"))*eco_gf(t);
* eco_CARBPRICEEQ5(t)..                 eco_cprice(t)           =E= (dat_mac_ems("co","a") *eco_miu(t,"co")**dat_mac_ems("co","c")+dat_mac_ems("co","b")*eco_miu(t,"co")**dat_mac_ems("co","d"))*eco_gf(t);
* eco_CARBPRICEEQ6(t)..                 eco_cprice(t)           =E= (dat_mac_ems("oc","a") *eco_miu(t,"oc")**dat_mac_ems("oc","c")+dat_mac_ems("oc","b")*eco_miu(t,"oc")**dat_mac_ems("oc","d"))*eco_gf(t);
* eco_CARBPRICEEQ7(t)..                 eco_cprice(t)           =E= (dat_mac_ems("nox","a")*eco_miu(t,"nox")**dat_mac_ems("nox","c")+dat_mac_ems("nox","b")*eco_miu(t,"nox")**dat_mac_ems("nox","d"))*eco_gf(t);
* eco_CARBPRICEEQ8(t)..                 eco_cprice(t)           =E= (dat_mac_ems("so2","a")*eco_miu(t,"so2")**dat_mac_ems("so2","c")+dat_mac_ems("so2","b")*eco_miu(t,"so2")**dat_mac_ems("so2","d"))*eco_gf(t);
* eco_CARBPRICEEQ9(t)..                 eco_cprice(t)           =E= (dat_mac_ems("voc","a")*eco_miu(t,"voc")**dat_mac_ems("voc","c")+dat_mac_ems("voc","b")*eco_miu(t,"voc")**dat_mac_ems("voc","d"))*eco_gf(t);
* eco_CARBPRICEEQ10(t)..                 eco_cprice(t)          =E= (dat_mac_ems("nh3","a")*eco_miu(t,"nh3")**dat_mac_ems("nh3","c")+dat_mac_ems("nh3","b")*eco_miu(t,"nh3")**dat_mac_ems("nh3","d"))*eco_gf(t);

eco_CARBPRICEEQ2(t)..                 eco_cprice(t)           =E= (dat_mac_ems("ch4","a")*rPower(eco_miu(t,"ch4"),dat_mac_ems("ch4","c"))+dat_mac_ems("ch4","b")*rPower(eco_miu(t,"ch4"),dat_mac_ems("ch4","d")))*eco_gf(t);
eco_CARBPRICEEQ3(t)..                 eco_cprice(t)           =E= (dat_mac_ems("n2o","a")*rPower(eco_miu(t,"n2o"),dat_mac_ems("n2o","c"))+dat_mac_ems("n2o","b")*rPower(eco_miu(t,"n2o"),dat_mac_ems("n2o","d")))*eco_gf(t);
eco_CARBPRICEEQ4(t)..                 eco_cprice(t)           =E= (dat_mac_ems("bc","a") *rPower(eco_miu(t,"bc") ,dat_mac_ems("bc","c")) +dat_mac_ems("bc","b") *rPower(eco_miu(t,"bc") ,dat_mac_ems("bc","d")))*eco_gf(t);
eco_CARBPRICEEQ5(t)..                 eco_cprice(t)           =E= (dat_mac_ems("co","a") *rPower(eco_miu(t,"co") ,dat_mac_ems("co","c")) +dat_mac_ems("co","b") *rPower(eco_miu(t,"co") ,dat_mac_ems("co","d")))*eco_gf(t);
eco_CARBPRICEEQ6(t)..                 eco_cprice(t)           =E= (dat_mac_ems("oc","a") *rPower(eco_miu(t,"oc") ,dat_mac_ems("oc","c")) +dat_mac_ems("oc","b") *rPower(eco_miu(t,"oc") ,dat_mac_ems("oc","d")))*eco_gf(t);
eco_CARBPRICEEQ7(t)..                 eco_cprice(t)           =E= (dat_mac_ems("nox","a")*rPower(eco_miu(t,"nox"),dat_mac_ems("nox","c"))+dat_mac_ems("nox","b")*rPower(eco_miu(t,"nox"),dat_mac_ems("nox","d")))*eco_gf(t);
eco_CARBPRICEEQ8(t)..                 eco_cprice(t)           =E= (dat_mac_ems("so2","a")*rPower(eco_miu(t,"so2"),dat_mac_ems("so2","c"))+dat_mac_ems("so2","b")*rPower(eco_miu(t,"so2"),dat_mac_ems("so2","d")))*eco_gf(t);
eco_CARBPRICEEQ9(t)..                 eco_cprice(t)           =E= (dat_mac_ems("voc","a")*rPower(eco_miu(t,"voc"),dat_mac_ems("voc","c"))+dat_mac_ems("voc","b")*rPower(eco_miu(t,"voc"),dat_mac_ems("voc","d")))*eco_gf(t);
eco_CARBPRICEEQ10(t)..                 eco_cprice(t)          =E= (dat_mac_ems("nh3","a")*rPower(eco_miu(t,"nh3"),dat_mac_ems("nh3","c"))+dat_mac_ems("nh3","b")*rPower(eco_miu(t,"nh3"),dat_mac_ems("nh3","d")))*eco_gf(t);

$else
Equation

eco_NCO2MIUEQ(t,gas_noncf);

eco_NCO2MIUEQ(t,gas_noncf)..                      eco_miu(t,gas_noncf)        =E= 0;

eco_ABATEEQ(t)..                     eco_abatecost(t)        =E= (
                                                                 (eco_cgross_ind(t)* 44.01/12.0107 *(dat_mac_ems("co2","a")*eco_miu(t,"co2")**(dat_mac_ems("co2","c")+1)/(dat_mac_ems("co2","c")+1)+dat_mac_ems("co2","b")*eco_miu(t,"co2")**(dat_mac_ems("co2","d")+1)/(dat_mac_ems("co2","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("co2") 
*                                                                 +(dat_eind(t,"ch4")/1E3*(dat_mac_ems("ch4","a")*eco_miu(t,"ch4")**(dat_mac_ems("ch4","c")+1)/(dat_mac_ems("ch4","c")+1)+dat_mac_ems("ch4","b")*eco_miu(t,"ch4")**(dat_mac_ems("ch4","d")+1)/(dat_mac_ems("ch4","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("ch4")
*                                                                +(dat_eind(t,"n2o")*44.013 / (14.0067 * 2)/1E3*(dat_mac_ems("n2o","a")*eco_miu(t,"n2o")**(dat_mac_ems("n2o","c")+1)/(dat_mac_ems("n2o","c")+1)+dat_mac_ems("n2o","b")*eco_miu(t,"n2o")**(dat_mac_ems("n2o","d")+1)/(dat_mac_ems("n2o","d")+1))/1000)*eco_gf(t) * def_gwp100_ar5_eind("n2o")
                                                                )/tstep;

$endif

eco_MCABATEEQ(t)..                   eco_mcabate(t)          =E= eco_cprice(t);

$endif


* eco_miuEQ(t+1,gas_nonf)..             eco_miu(t+1,gas_nonf)   =G= eco_miu(t,gas_nonf);  
$ifthen not set CLP
equation
eco_max_cmiuEQ1(t)
eco_max_cmiuEQ2(t)
;
eco_max_cmiuEQ1(t+1)..                     eco_cmiu(t+1)   =L= eco_cmiu(t) + max_cmiu;  
$ifThen set limT
$IFTHENe %limT% == 1.5
eco_max_cmiuEQ2(t+1)..                     eco_cmiu(t+1)   =G= eco_cmiu(t) - max_cmiu * 100;  
$else
eco_max_cmiuEQ2(t+1)..                     eco_cmiu(t+1)   =G= eco_cmiu(t) - max_cmiu;  
$endIf
$else
eco_max_cmiuEQ2(t+1)..                     eco_cmiu(t+1)   =G= eco_cmiu(t) - max_cmiu;  
$endIf
$endIf

*EQ(2), Industrial emission
$ifthen set reff
eco_EINDEQ(t,gas_nonf)..            dat_eind(t,gas_nonf)     =E= dat_eind0(t,gas_nonf) * (1 - eco_miu(t,gas_nonf));
eco_EFGSEQ(t,fgs)..                 dat_eind(t,fgs)          =E= dat_eind0(t,fgs);
eco_CGROSSINDEQ(t)..                 eco_cgross_ind(t)       =E= dat_eind0(t,"co2");
$else
eco_EINDEQ(t,gas_nonf)..            dat_eind(t,gas_nonf)     =E= dat_ssp_sig_eind(t,gas_nonf) * eco_ygross(t) * (1 - eco_miu(t,gas_nonf));
eco_EFGSEQ(t,fgs)..                 dat_eind(t,fgs)          =E= dat_ssp_sig_eind(t,fgs) * eco_ygross(t);
eco_CGROSSINDEQ(t)..                 eco_cgross_ind(t)       =E= dat_ssp_sig_eind(t,"co2") * eco_ygross(t);
$endIf
*EQ(1), Gross industrial CO2 emission



eco_ECO2CH4N2OEQ(t)..                eco_eco2ch4n2o(t)       =E= dat_eind(t,"co2")/12*44 + dat_eind(t,"ch4")*29/1000 +  dat_eind(t,"n2o")/28*44*265/1000 +
                                                                       dat_elnd(t,"co2")/12*44 + dat_elnd(t,"ch4")*29/1000 +  dat_elnd(t,"n2o")/28*44*265/1000 ;
*EQ(1), Abated industrial CO2 emission
eco_CABATEEQ(t)..                    eco_cabate_ind(t)       =E= eco_cgross_ind(t) * eco_miu(t,"co2");

*Not reflected in the manual, CO2 removed by bimass CCS
* eco_CCSBIOEQ1(t)$(t.val LT 2025)..   eco_ccs_bio(t)          =E= 0;
* eco_CCSBIOEQ2(t)$(t.val GE 2025)..   eco_ccs_bio(t)          =E= eco_a_ccs_bio * eco_cprice(t) ** eco_b_ccs_bio;
*EQ(1), Net industrial CO2 emission
* eco_CINDEQ(t)..                      eco_cind(t)             =E= eco_cgross_ind(t) - eco_cabate_ind(t);
* eco_CNETINDEQ(t)..                   dat_eind(t,"co2")       =E= eco_cind(t) - eco_ccs_bio(t);
* eco_CNETINDEQ(t)..                   dat_eind(t,"co2")       =E= eco_cind(t);

*EQ(5), Anthropogenic emissions
eco_EMSEQ(t,gas)..                   dat_ems(t, gas)         =E= dat_eind(t,gas) + dat_elnd(t,gas);

*EQ(2), Control rates of industrial emissions
* eco_OMIUEQ(t,ogas)..                 eco_miu(t,ogas)         =E= eco_gind_a(ogas) * eco_cprice(t) ** eco_gind_b(ogas);
*EQ(2), Control rates of industrial CO2 emissions
eco_CMIUEQ(t)..                      eco_cmiu(t)            =E= eco_miu(t,"co2");



*Not reflected in the manual, accumulative CO2 emissions
* eco_CCAEQ(t+1)..                     eco_cca(t+1)            =E= eco_cca(t)+ dat_ems(t,"co2");

*EQ(8), Gross output
eco_YGROSSEQ(t)..                    eco_ygross(t)           =E= (eco_al(t)*(eco_l(t)/1000)**(1-eco_gama))*(eco_k(t)**eco_gama);
* eco_YGROSSEQ1(t+1)..                    eco_ygross(t+1)         =G=   eco_ygross(t);
*EQ(9), Net gross output
* eco_YNETEQ(t)..                      eco_ynet(t)             =E= eco_ygross(t) - eco_rd(t) - eco_pc(t);
* eco_YNETEQ(t)..                      eco_ynet(t)             =E= eco_ygross(t) - eco_rd(t);
eco_YNETEQ(t)..                      eco_ynet(t)             =E= eco_ygross(t) - eco_gd(t);

*EQ(9), Gross output net of mitigation cost, adaptation cost and residual damages
eco_YEQ(t)..                         eco_y(t)                =E= eco_ynet(t) - eco_abatecost(t);
*EQ(10), consumption
eco_CEQ(t)..                         eco_c(t)                =E= eco_y(t) - eco_i(t);
*Not reflected in the manual, per capita consumption
eco_CPCEQ(t)..                       eco_cpc(t)              =E= 1000 * eco_c(t) / eco_l(t);
*EQ(12), Investment
eco_SEQ(t)..                         eco_i(t)                =E= eco_s(t) * eco_y(t);

*EQ(13), Captital stock
* eco_KEQ1(th+1)..      eco_k(th+1)              =E= (1-eco_dk)**tstep * eco_k(th) + tstep*eco_i(th);
* eco_KEQ2(tp+1)..      eco_k(tp+1)              =L= (1-eco_dk)**tstep * eco_k(tp) + tstep*eco_i(tp);

eco_KEQ(t+1)..                     eco_k(t+1)              =L= (1-eco_dk)**tstep * eco_k(t) + tstep*eco_i(t);




*Not reflected in the manual, real nterest rate
eco_RIEQ(t+1)..                        eco_ri(t)               =E= (1+eco_prstp) * (eco_cpc(t+1)/eco_cpc(t))**(eco_elasmu/tstep) - 1;

*EQ(14), Gross damage level
*eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= (eco_a1*scm_tatm(t))+(eco_a2*scm_tatm(t)**eco_a3);


*Uncertainty of damages
$ifthen %dmg% == "dice1992"
parameter
dmg_a1 /.0133/;
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+(dmg_a1/9)*SQR(scm_tatm(t)));
$elseif %dmg% == "dice1999"
parameter
dmg_a1 /-.0045/
dmg_a2 /.0035/;
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+dmg_a1*scm_tatm(t)+ dmg_a2*scm_tatm(t)**2);
$elseif %dmg% == "dice2008"
parameter
dmg_aa1 / 0.00000 /
dmg_aa2 / 0.0028388 /
dmg_aa3 / 2.00 /
;
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+dmg_aa1*scm_tatm(t)+ dmg_aa2*signPower(scm_tatm(t),dmg_aa3));
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+dmg_aa1*scm_tatm(t)+ dmg_aa2*scm_tatm(t)**dmg_aa3);
$elseif %dmg% == "dice2013r"
parameter
dmg_a1 / 0.00000 /
dmg_a2 / 0.00267 /
dmg_a3 / 2.00 /
;
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;
$elseif %dmg% == "dice2016r"
parameter
dmg_a1        Damage intercept                                 /0       /
dmg_a2        Damage quadratic term                            /0.00236 /
dmg_a3        Damage exponent                                  /2.00    /
;

eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;
$elseif %dmg% == "dice2023"
parameter
dmg_a1        Damage intercept                                 /0       /
dmg_a2        Damage quadratic term                            /0.003467/
dmg_a3        Damage exponent                                  /2.00    /
;
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;
$elseif %dmg% == "ssp"
* emulator
* parameter
* dmg_a1        Damage intercept                                 /0/
* dmg_a2        Damage quadratic term                            /1.979e-03/
* dmg_a3        Damage exponent                                  /2    /
* ;
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;

$ifthen %scen% == "ssp1"
parameter
dmg_a1        Damage intercept                                 /0.004759665/  
dmg_a2        Damage quadratic term                            /0.001900510/ 
dmg_a3        Damage exponent                                  /2.00    /
;
$elseIf %scen% == "ssp2"
parameter
dmg_a1        Damage intercept                                 /0.004800032/  
dmg_a2        Damage quadratic term                            /0.001977489/ 
dmg_a3        Damage exponent                                  /2.00    /
;
$elseIf %scen% == "ssp3"
parameter
dmg_a1        Damage intercept                                 /0.003467047/  
dmg_a2        Damage quadratic term                            /0.003055544/ 
dmg_a3        Damage exponent                                  /2.00    /
;
$elseIf %scen% == "ssp4"
parameter 
dmg_a1        Damage intercept                                 /0.004764481/  
dmg_a2        Damage quadratic term                            /0.002299899/ 
dmg_a3        Damage exponent                                  /2.00    /
;
$elseIf %scen% == "ssp5"
parameter
dmg_a1        Damage intercept                                 /0.004710991/  
dmg_a2        Damage quadratic term                            /0.001619722/ 
dmg_a3        Damage exponent                                  /2.00    /
;
$endIf

eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;


$elseif %dmg% == "Nordhaus"
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+signPower(scm_tatm(t)/18.8,2));
$elseif %dmg% == "Hanemann"
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+signPower(scm_tatm(t)/9.1,2));
$elseif %dmg% == "Weitzman"
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+signPower(scm_tatm(t)/20.2,2)+signPower(scm_tatm(t)/6.08,6.76));
$elseif %dmg% == "WeitzmanHigh"
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= 1-1/(1+signPower(scm_tatm(t)/9.2,2)+signPower(scm_tatm(t)/6.47,7.41));
$else
eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= (eco_a1*scm_tatm(t))+(eco_a2*signPower(scm_tatm(t),eco_a3));
* eco_GDFRACEQ1(th)..                  eco_gdfrac(th)           =E= 0;
* eco_GDFRACEQ2(tp)..                   eco_gdfrac(tp)           =E= (eco_a1*scm_tatm(tp))+(eco_a2*scm_tatm(tp)**eco_a3);
$endif


*EQ(14), Gross damages
eco_GDEQ(t)..                        eco_gd(t)               =E= eco_ygross(t) * eco_gdfrac(t);


*EQ(17), Residual damages
* eco_RDEQ(t)..                        eco_rd(t)               =E= eco_gd(t)*(1-eco_p(t));
*EQ(18), Adaptation costs
* eco_ADEQ(t)..                        eco_pc(t)               =E= eco_ygross(t)*eco_gama1*eco_p(t)**eco_gama2;

*EQ(19), Utility
eco_CEMUTOTPEREQ(t)..                eco_cemutotper(t)       =E= eco_periodu(t) * eco_l(t) * eco_rr(t);

*EQ(19), Anual utility
eco_PERIODUEQ(t)..                   eco_periodu(t)          =E= (eco_cpc(t)**(1-eco_elasmu)-1)/(1-eco_elasmu)-1;
*
* eco_PERIODUEQ(t)..                   eco_periodu(t)          =E= log(1000*eco_c(t)/eco_l(t));

* eco_PERIODUEQ1(th)..                 eco_periodu(th)         =E= 0.5303;
* eco_PERIODUEQ2(tp)..                 eco_periodu(tp)         =E= (eco_cpc(tp)**(1-eco_elasmu)-1)/(1-eco_elasmu)-1;


*EQ(20), Objective function

$ifThen set ref
* eco_objEQ..                           obj                    =E= tstep*eco_scale1 * sum(t,  eco_cemutotper(t)) + eco_scale2 ;
eco_objEQ..                           obj                    =E= tstep*sum(t,  eco_cemutotper(t)) ;
$elseIf set CLP
eco_objEQ..                           obj                    =E= 1;
$else
eco_objEQ..                           obj                    =E= tstep*eco_scale1 * sum(t,  eco_cemutotper(t)) + eco_scale2 ;

* eco_objEQ..                           obj                    =E= tstep*sum(t,  eco_cemutotper(t)) ;
* eco_objEQ..                           obj                    =E= 1;
$endif

*Resource limit
*eco_cca.up(tp)       = eco_fosslim;

*Setting bounds for variables to help the optimizing process
eco_k.lo(t)         = 0.1;
eco_c.lo(t)         = 0.1;
eco_i.lo(t)         = 0.1;
* eco_k.up(t)         = 1E6;
* ********eco_ygross.lo(t)    = 0.1;
* ********eco_ynet.lo(t)      = 0.1;
* ********eco_y.lo(t)         = 0.1;

********eco_k.up(t)         = 1E4;
* ********eco_c.up(t)         = 1E4;
* ********eco_i.up(t)         = 1E4;
* ********eco_ygross.up(t)    = 1E4;
* ********eco_ynet.up(t)      = 1E4;
* ********eco_y.up(t)         = 1E4;

* ********eco_ri.lo(t)        = -1;
* ********eco_ri.up(t)        = 1;


eco_cpc.lo(t)       = 0.1;
* ********eco_cpc.up(t)       = 1E3;



eco_cmiu.lo(t) = 0;
eco_miu.lo(t,gas_nonf)  = 0;

eco_miu.fx(th,gas_nonf)   = 0;
eco_cmiu.fx(th)   = 0.;


*BAU cases running
$ifthen set ref
* eco_a1 = 0;
* eco_a2 = 0;
 eco_cmiu.fx(tp)   = 0.;
 eco_miu.fx(tp,gas_nonf)   = 0;
 
 dmg_a1 = 0;
 dmg_a2  = 0;
* eco_cmiu.fx(tp)   = 1.2;
* eco_miu.fx(tp,"co2")   = 1;
* eco_p.fx(tp)      = 0.1;

$elseIf set CLP 
parameter
price_path(t);
price_path(t) = 0;
$IFTHENe %CLP%==100       
        price_path(t)$(t.val>=2020)=(t.val-2020)/80*0.1;
$ELSEIFe %CLP%==200       
        price_path(t)$(t.val>=2020)=(t.val-2020)/80*0.2;
$ELSEIFe %CLP%==300       
        price_path(t)$(t.val>=2020)=(t.val-2020)/80*0.3;
$ELSEIFe %CLP%==400       
        price_path(t)$(t.val>=2020)=(t.val-2020)/80*0.4;
$ELSEIFe %CLP%==500       
*        price_path(t)$(t.val>=2020 and t.val<2025)=(t.val-2020)/5*0.02;
*        price_path(t)$(t.val>=2025)=(t.val-2025)/75*(0.5-0.02)+0.02;
        price_path(t)$(t.val>=2020)=(t.val-2020)/80*0.5;
$endif
price_path(t) = price_path(t) * 1000;
* price_path(t)$(t.val>2100) = price_path("2100");
display price_path;
eco_miu.up(t,gas_nonf)  = 5;
* eco_cprice.fx(t) = price_path(t);


equation
price_path_EQ1(t)
price_path_EQ2(t)
price_path_EQ3(t)
price_path_EQ4(t)
price_path_EQ5(t)
price_path_EQ6(t)
price_path_EQ7(t)
price_path_EQ8(t)
price_path_EQ9(t)
price_path_EQ10(t)
price_objEQ;

variable
price_obj;
* price_path_EQ(t).. price_path(t)           =E= (dat_mac_ems("co2","a")*rPower(eco_cmiu(t),dat_mac_ems("co2","c"))+dat_mac_ems("co2","b")*rPower(eco_cmiu(t),dat_mac_ems("co2","d")))*eco_gf(t);
price_objEQ..                     price_obj=E=1;

price_path_EQ1(t)..                 price_path(t)           =E= (dat_mac_ems("co2","a")*rPower(eco_miu(t,"co2"),dat_mac_ems("co2","c"))+dat_mac_ems("co2","b")*rPower(eco_miu(t,"co2"),dat_mac_ems("co2","d")))*eco_gf(t);
price_path_EQ2(t)..                 price_path(t)           =E= (dat_mac_ems("ch4","a")*rPower(eco_miu(t,"ch4"),dat_mac_ems("ch4","c"))+dat_mac_ems("ch4","b")*rPower(eco_miu(t,"ch4"),dat_mac_ems("ch4","d")))*eco_gf(t);
price_path_EQ3(t)..                 price_path(t)           =E= (dat_mac_ems("n2o","a")*rPower(eco_miu(t,"n2o"),dat_mac_ems("n2o","c"))+dat_mac_ems("n2o","b")*rPower(eco_miu(t,"n2o"),dat_mac_ems("n2o","d")))*eco_gf(t);
price_path_EQ4(t)..                 price_path(t)           =E= (dat_mac_ems("bc","a") *rPower(eco_miu(t,"bc") ,dat_mac_ems("bc","c")) +dat_mac_ems("bc","b") *rPower(eco_miu(t,"bc") ,dat_mac_ems("bc","d")))*eco_gf(t);
price_path_EQ5(t)..                 price_path(t)           =E= (dat_mac_ems("co","a") *rPower(eco_miu(t,"co") ,dat_mac_ems("co","c")) +dat_mac_ems("co","b") *rPower(eco_miu(t,"co") ,dat_mac_ems("co","d")))*eco_gf(t);
price_path_EQ6(t)..                 price_path(t)           =E= (dat_mac_ems("oc","a") *rPower(eco_miu(t,"oc") ,dat_mac_ems("oc","c")) +dat_mac_ems("oc","b") *rPower(eco_miu(t,"oc") ,dat_mac_ems("oc","d")))*eco_gf(t);
price_path_EQ7(t)..                 price_path(t)           =E= (dat_mac_ems("nox","a")*rPower(eco_miu(t,"nox"),dat_mac_ems("nox","c"))+dat_mac_ems("nox","b")*rPower(eco_miu(t,"nox"),dat_mac_ems("nox","d")))*eco_gf(t);
price_path_EQ8(t)..                 price_path(t)           =E= (dat_mac_ems("so2","a")*rPower(eco_miu(t,"so2"),dat_mac_ems("so2","c"))+dat_mac_ems("so2","b")*rPower(eco_miu(t,"so2"),dat_mac_ems("so2","d")))*eco_gf(t);
price_path_EQ9(t)..                 price_path(t)           =E= (dat_mac_ems("voc","a")*rPower(eco_miu(t,"voc"),dat_mac_ems("voc","c"))+dat_mac_ems("voc","b")*rPower(eco_miu(t,"voc"),dat_mac_ems("voc","d")))*eco_gf(t);
price_path_EQ10(t)..                 price_path(t)          =E= (dat_mac_ems("nh3","a")*rPower(eco_miu(t,"nh3"),dat_mac_ems("nh3","c"))+dat_mac_ems("nh3","b")*rPower(eco_miu(t,"nh3"),dat_mac_ems("nh3","d")))*eco_gf(t);

 model ppath /price_path_EQ1 
             price_path_EQ2,
             price_path_EQ3,
             price_path_EQ4,
             price_path_EQ5,
             price_path_EQ6,
             price_path_EQ7,
             price_path_EQ8,
             price_path_EQ9,
            price_path_EQ10,
                price_objEQ/;
option nlp = CONOPT4;
SOLVE ppath USING NLP MINIMIZING price_obj;
option eco_cmiu:3:0:1;
display eco_cmiu.l;

Parameter
miu_path(t,gas_nonf);
miu_path(th,gas_nonf) = 0;
miu_path(tp,gas_nonf) = eco_miu.l(tp,gas_nonf);
option miu_path:0:0:1;
display miu_path;
$endif

* Control variables
* Savings rate for asympotic equilibrium for last 50 yrs
set lag10(tp) ;
lag10(tp) =  yes$(tp.val gt (last_year-50));
eco_s.FX(lag10(tp)) = eco_optlrsav;
$ifthen set prstp
        eco_s.FX(t) = eco_optlrsav;
$endIf

eco_k.fx(tfirst)   =  0.3;


