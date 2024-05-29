*Parameters estimated from SSP sensitivity data
set      p_ssp      parameters for ssp definition
         /
          mc1
          mc2
          ex1
          ex2
          gback
          a_ccs_bio
          b_ccs_bio
          a_ch4_ind
          b_ch4_ind
          a_n2o_ind
          b_n2o_ind
          a_bc_ind
          b_bc_ind
          a_co_ind
          b_co_ind
          a_nox_ind
          b_nox_ind
          a_oc_ind
          b_oc_ind
          a_sul_ind
          b_sul_ind
          a_nh3_ind
          b_nh3_ind
          a_voc_ind
          b_voc_ind
          a_c2f6_ind
          b_c2f6_ind
          a_c6f14_ind
          b_c6f14_ind
          a_cf4_ind
          b_cf4_ind
          a_hfc125_ind
          b_hfc125_ind
          a_hfc134a_ind
          b_hfc134a_ind
          a_hfc143a_ind
          b_hfc143a_ind
          a_hfc227ea_ind
          b_hfc227ea_ind
          a_hfc23_ind
          b_hfc23_ind
          a_hfc245fa_ind
          b_hfc245fa_ind
          a_hfc32_ind
          b_hfc32_ind
          a_hfc4310_ind
          b_hfc4310_ind
          a_sf6_ind
          b_sf6_ind
          a_co2_lnd
          b_co2_lnd
          a_ch4_lnd
          b_ch4_lnd
          a_n2o_lnd
          b_n2o_lnd
          a_bc_lnd
          b_bc_lnd
          a_co_lnd
          b_co_lnd
          a_nox_lnd
          b_nox_lnd
          a_oc_lnd
          b_oc_lnd
          a_sul_lnd
          b_sul_lnd
          a_nh3_lnd
          b_nh3_lnd
          a_voc_lnd
          b_voc_lnd
$ontext
        a_lccrop
        b_lccrop
        c_lccrop
        d_lccrop
        a_lcforest
        b_lcforest
        c_lcforest
        d_lcforest
        a_lcother
        b_lcother
        c_lcother
        d_lcother
        a_lcpasture
        b_lcpasture
        c_lcpasture
        d_lcpasture
$offtext
         /;

*Parameters of total productivity factor
set        tpf
                                                         /al0
                                                          ga0
                                                          dela/;

*CO2 intensity
*Industrial T C per 1000 USD
TABLE dat_ssp_sig_co2_ind(tAll,ssp)
$ondelim
$Include ../trunk/dat/sce/ssp_sig_co2_ind_1yr.csv
$offdelim
;

*SSP population
TABLE dat_ssp_pop(tAll,ssp)
$ondelim
$Include ../trunk/dat/sce/ssp_pop_1yr.csv
$offdelim
;
* dat_ssp_pop(tAll,ssp)$(tAll.val > 2304) = dat_ssp_pop("2304",ssp);

*SSP gdp
TABLE dat_ssp_gdp_ref(tAll,ssp)
$ondelim
$Include ../trunk/dat/aim/ssp_gdp_ref_1yr.csv
* $Include ../trunk/dat/sce/gdp_prj_1yr.csv
$offdelim
;

*SSP parameters
* TABLE
* dat_ssp_def(p_ssp,ssp)
* $ondelim
* $Include ../trunk/dat/sce/ssp_def90.csv
* $offdelim
* ;


set p_aim_mac /a, b, c, d/;

table dat_ssp_mac_bc(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_bc.csv
$offdelim
;

table dat_ssp_mac_ch4(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_ch4.csv
$offdelim
;

table dat_ssp_mac_co(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_co.csv
$offdelim
;

table dat_ssp_mac_co2(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_co2.csv
$offdelim
;

table dat_ssp_mac_n2o(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_n2o.csv
$offdelim
;

table dat_ssp_mac_nh3(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_nh3.csv
$offdelim
;

table dat_ssp_mac_nox(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_nox.csv
$offdelim
;

table dat_ssp_mac_oc(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_oc.csv
$offdelim
;

table dat_ssp_mac_so2(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_so2.csv
$offdelim
;

table dat_ssp_mac_voc(ssp,p_aim_mac)
$ondelim
$Include ../trunk/dat/aim/aim_mac_voc.csv
$offdelim
;

table dat_ssp_mac_ems(gas_nonf,ssp,p_aim_mac)
;
dat_ssp_mac_ems("co2",ssp,p_aim_mac) =  dat_ssp_mac_co2(ssp,p_aim_mac);                                                
dat_ssp_mac_ems("ch4",ssp,p_aim_mac) =  dat_ssp_mac_ch4(ssp,p_aim_mac);  
dat_ssp_mac_ems("n2o",ssp,p_aim_mac) =  dat_ssp_mac_n2o(ssp,p_aim_mac);  
dat_ssp_mac_ems("so2",ssp,p_aim_mac) =  dat_ssp_mac_so2(ssp,p_aim_mac);  
dat_ssp_mac_ems("co",ssp,p_aim_mac)  =  dat_ssp_mac_co(ssp,p_aim_mac);  
dat_ssp_mac_ems("voc",ssp,p_aim_mac) =  dat_ssp_mac_voc(ssp,p_aim_mac);  
dat_ssp_mac_ems("nox",ssp,p_aim_mac) =  dat_ssp_mac_nox(ssp,p_aim_mac);  
dat_ssp_mac_ems("bc",ssp,p_aim_mac)  =  dat_ssp_mac_bc(ssp,p_aim_mac);  
dat_ssp_mac_ems("oc",ssp,p_aim_mac)  =  dat_ssp_mac_oc(ssp,p_aim_mac);  
dat_ssp_mac_ems("nh3",ssp,p_aim_mac) =  dat_ssp_mac_nh3(ssp,p_aim_mac);  


* set p_aim_loss /a, b, c, d/;

* table dat_ssp_miu_loss(ssp,p_aim_loss)
* $ondelim
* $Include ../trunk/dat/aim/aimhub_miu_loss_co2_nluc.csv
* $offdelim
* ;

*Parameters of total productivity factor for SSPs
TABLE
dat_ssp_tpf(tAll,ssp)
$ondelim
$Include ../trunk/dat/sce/ssp_tpf_1yr.csv
$offdelim
;

*SSP1 emissions
table
dat_ssp1_ems(tAll,all_gas)
$ondelim
* $Include ../trunk/dat/sce/ssp1_ems.csv
$include ../trunk/dat/contrib/COMB_INDC/total/AIMHub_SSP1_BaU_NoCC_WORLD_1yr.csv
$offdelim
;
dat_ssp1_ems(tAll,all_gas)$(tAll.val>2100) = dat_ssp1_ems("2100",all_gas);

*SSP2 emissions
table
dat_ssp2_ems(tAll,all_gas)
$ondelim
* $Include ../trunk/dat/sce/ssp2_ems.csv
$include ../trunk/dat/contrib/COMB_INDC/total/AIMHub_SSP2_BaU_NoCC_WORLD_1yr.csv
$offdelim
;
dat_ssp2_ems(tAll,all_gas)$(tAll.val>2100) = dat_ssp2_ems("2100",all_gas);

*SSP3 emissions
table
dat_ssp3_ems(tAll,all_gas)
$ondelim
* $Include ../trunk/dat/sce/ssp3_ems.csv
$include ../trunk/dat/contrib/COMB_INDC/total/AIMHub_SSP3_BaU_NoCC_WORLD_1yr.csv
$offdelim
;
dat_ssp3_ems(tAll,all_gas)$(tAll.val>2100) = dat_ssp3_ems("2100",all_gas);

*SSP4 emissions
table
dat_ssp4_ems(tAll,all_gas)
$ondelim
* $Include ../trunk/dat/sce/ssp4_ems.csv
$include ../trunk/dat/contrib/COMB_INDC/total/AIMHub_SSP4_BaU_NoCC_WORLD_1yr.csv
$offdelim
;
dat_ssp4_ems(tAll,all_gas)$(tAll.val>2100) = dat_ssp4_ems("2100",all_gas);

*SSP5 emissions
table
dat_ssp5_ems(tAll,all_gas)
$ondelim
* $Include ../trunk/dat/sce/ssp5_ems.csv
$include ../trunk/dat/contrib/COMB_INDC/total/AIMHub_SSP5_BaU_NoCC_WORLD_1yr.csv
$offdelim
;
dat_ssp5_ems(tAll,all_gas)$(tAll.val>2100) = dat_ssp5_ems("2100",all_gas);

*Historical population
parameter
dat_hisPOP(tAll)
/
$ondelim
$Include ../trunk/dat/sce/hisPOP_1yr.csv
$offdelim
/
;

* dat_hisPOP("2004.167") = dat_hisPOP("2004");
* dat_hisPOP("2004.333") = dat_hisPOP("2004");
* dat_hisPOP("2004.5")   = dat_hisPOP("2004");
* dat_hisPOP("2004.667") = dat_hisPOP("2004");
* dat_hisPOP("2004.833") = dat_hisPOP("2004");

*Historical GDP
parameter
dat_hisGDP(tAll)
/
$ondelim
$Include ../trunk/dat/sce/hisGDP_1yr.csv
$offdelim
/
;

* dat_hisGDP("2004.333") = dat_hisGDP("2004");
* dat_hisGDP("2004.5")   = dat_hisGDP("2004");
* dat_hisGDP("2004.667") = dat_hisGDP("2004");
* dat_hisGDP("2004.833") = dat_hisGDP("2004");

*SSP total productivity factor
table
dat_ssp_al(tAll,ssp)
$ondelim
$Include ../trunk/dat/sce/ssp_al_1yr.csv
$offdelim
;

parameters
*Elasticity of marginal utility of consumption
        dat_elasmus(ssp)
        /ssp1      1.1
         ssp2      1.4
         ssp3      1.46
         ssp4      1.42
         ssp5      1.1
        /

*Initial rate of social time preference per year
        dat_prstps(ssp)
        /ssp1      .01
         ssp2      .012
         ssp3      .023
         ssp4      .012
         ssp5      .01
        /

*Protection cost function coeff exponential term
         dat_gama2s(ssp)
         /ssp1   4.4893
          ssp2   4.4893
          ssp3   4.4893
          ssp4   4.4893
          ssp5   4.4893/

;