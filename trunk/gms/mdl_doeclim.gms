*  DOECLIM:  Diffusion Ocean Energy balance CLIMate model
*
*  Copyright (C) 2007 E. Kriegler
*
*  This program is free software; you can redistribute it and/or modify
*  it under the terms of the GNU General Public License as published by
*  the Free Software Foundation; either version 2 of the License, or
*  (at your option) any later version.
*
*  This program is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program; if not, write to the Free Software
*  Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*
*------------------------------------------------------------------------------
* Simple climate model DOECLIM
*
* calculates sea surface and land air temperature response to radiative forcing
* based on an energy balance model with 1-D diffusion ocean
*
* Constructed by Elmar Kriegler (EK),
* Potsdam Institute for Climate Impact Research
* Date: 06.02.2005
*
* References for the historical forcing values can be found in (Reference EK05):
* Kriegler, E (2005) Imprecise probability analysis for integrated assessment
* of climate change. Ph.D. thesis. University of Potsdam, 256 pp.
* opus.kobv.de/ubp/volltexte/2005/561/
*
* Model equations are described in EK05 and (Reference TK07):
* Tanaka, K, Kriegler, E, Bruckner, T, Hooss, G, Knorr, W, Raddatz, T (2007)
* Aggregated carbon cycle, atmospheric chemistry, and climate model (ACC2):
* Description of the forward and inverse modes, Reports on Earth System Science * 40/2007,
* Max Planck Institute for Meteorology, Hamburg, 199 pp.
* www.mpimet.mpg.de/fileadmin/publikationen/Reports/BzE_40.pdf
*
*==============================================================================
*
* Updates:
* 22.05.2007 Hammer-Hollingsworth numerical correction included (EK)
* 23.05.2007 Ocean heat uptake added (EK)
* 12.02.2008 Translated to Fortran90 (Marlos Goes <mpg14@psu.edu>)
* 15.08.2009 Written as Fortran90 module (Brian Tuttle <btuttle@psu.edu>)
* 14.03.2018 Integrated to part of SCM4OPT (Xuanming Su <suxuanming@jamstec.go.jp>)
*==============================================================================
*
* Global Parameters:
*   ak      slope coeff. for land-sea heat exchange
*   bk      inters. coeff. for land-sea heat exch.
*   bsi     marine air warming enhancement
*   cal     heat cap. of land-troposph. system
*   cas     heat cap. of ocean ML-troposph.
*   csw     specific heat capacity of 1m^3 seawater [Wa/m^3/K]
*   deltat  time step size [years]
*   flnd    land fraction
*   fso     ocean frac. area below 60m
*   kcon    conversion factor [cm2/s->m2/a]
*   q2co    2xCo2 forcing increase [W/m^2]
*   rlam    clim sens. over land enhancement
*   zbot    depth of interior ocean
*
*   temp_landair:       land air temperature anomaly (K)
*   temp_sst:           sea surface temperature anomaly (K)
*   heat_mixed:         mixed layer heat anomaly (10^22 J)
*   heat_interior:      interior ocean heat anomaly (10^22 J)
*   heatflux_mixed:     heat uptake of the mixed layer (W/m^2)
*   heatflux_interior:  heat uptake of the interior ocean (W/m^2)
*
*==============================================================================


*Define comment symbols
*$eolcom //
$offdigit

$macro erf(x) (2*errorf((x)*sqrt(2))-1)

*  =========================================================================
* |  Initialize variables for DOECLIM.                                      |
* |                                                                         |
* |  Input parameters:                                                      |
* |     t2co:   climate sensitivity to 2xCO2 (K); default = 3               |
* |     kappa:  vertical ocean diffusivity (cm^2 s^-1); default = 0.55      |
* |     nsteps: number of steps (length of forcing and response vectors)    |
* |                                                                         |
*  =========================================================================


parameter

    doe_Pi;

    doe_Pi = 3.14159265358979323846264338327950288;

parameter
    doe_zero /0/;

parameter

*    scm_dt
    doe_nsteps
    doe_ak
    doe_bk
    doe_bsi
    doe_cal
    doe_cas
    doe_csw
    doe_flnd
    doe_fso
    doe_kcon
    doe_q2co
    doe_rlam
    doe_zbot
    doe_earth_area
    doe_secs_per_Year
;

    // Hard-coded DOECLIM parameters
    doe_nsteps         = card(t);       // number of timesteps
    doe_ak             = 0.31;          // slope in climate feedback - land-sea heat exchange linear relationship
    doe_bk             = 1.59;          // offset in climate feedback - land-sea heat exchange linear relationship, W/m2/K
    doe_csw            = 0.13;          // specific heat capacity of seawater W*yr/m3/K
    doe_earth_area     = 5100656E8;     // m2
    doe_kcon           = 3155.8;        // conversion from cm2/s to m2/yr
    doe_q2co           = 3.7;           // radiative forcing for atmospheric CO2 doubling, W/m2
    doe_rlam           = 1.43;          // factor between land clim. sens. and sea surface clim. sens. T_L2x = rlam*T_S2x
    doe_secs_per_Year  = 31556926.0;
    doe_zbot           = 4000.0;        // bottom depth of diffusive ocean, m
    doe_bsi            = 1.3;           // warming factor for marine surface air over SST (due to retreating sea ice)
    doe_cal            = 0.52;          // heat capacity of land-troposphere system, W*yr/m2/K
    doe_cas            = 7.80;          // heat capacity of mixed layer-troposphere system, W*yr/m2/K
    doe_flnd           = 0.29;          // fractional land area
    doe_fso            = 0.95;          // ocean fractional area below 60m



parameter

    doe_t2co
    doe_kappa
    doe_T0
    doe_ST0
;

    doe_t2co  = 3.0;
    doe_kappa = 0.55;
    doe_T0    = 0;
    doe_ST0   = 0;

$ifthen %scen% == "ssp1"
* using default values
$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif
$elseIf %scen% == "ssp2"
* using default values
$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif
$elseIf %scen% == "ssp3"
* using default values
$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif
$elseIf %scen% == "ssp4"
* using default values
$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif
$elseIf %scen% == "ssp5"
* using default values
$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif
$elseif set cm6mdl

set cmip6_clim/
   "doe_ak",
   "doe_bk",
   "doe_csw",
   "doe_q2co",
   "doe_rlam",
   "doe_bsi",
   "doe_cal",
   "doe_cas",
   "doe_t2co",
   "doe_kappa",
    "T0",
    "ST0"
    /;

table cmip6_param(gcm_mdl,cmip6_clim)
$ondelim
* $Include ../trunk/dat/CMIP6/doe_gcm_est.csv
$ifthen %ch4rfc% == "etminan" 
$Include ../trunk/dat/CMIP6/doe_gcm_est_etminan.csv
$else 
$Include ../trunk/dat/CMIP6/doe_gcm_est_myhre.csv
$endif
$offdelim
;

    doe_ak   = cmip6_param("%cm6mdl%","doe_ak");
    doe_bk   = cmip6_param("%cm6mdl%","doe_bk");
    doe_csw  = cmip6_param("%cm6mdl%","doe_csw");
    doe_q2co = cmip6_param("%cm6mdl%","doe_q2co");
    doe_rlam = cmip6_param("%cm6mdl%","doe_rlam");
    doe_bsi  = cmip6_param("%cm6mdl%","doe_bsi");
    doe_cal  = cmip6_param("%cm6mdl%","doe_cal");
    doe_cas  = cmip6_param("%cm6mdl%","doe_cas");
    doe_t2co = cmip6_param("%cm6mdl%","doe_t2co");
    doe_kappa= cmip6_param("%cm6mdl%","doe_kappa");

    doe_T0    = cmip6_param("%cm6mdl%","T0");
    doe_ST0   = cmip6_param("%cm6mdl%","ST0");


$ifthen set clim_sensi
    doe_t2co = %clim_sensi%;
$endif

$endif

$ifthen %scen% == "tcre"
*     doe_ak    =    0.0880;      
*     doe_bk    =    0.0872;      
*     doe_rlam  =    0.6694;      
*     doe_bsi   =    1.3528;      
*     doe_csw   =    2.1774;      
*     doe_cal   =    2.6787;      
*     doe_cas   =   11.4856;      
*     doe_q2co  =    1.5000;      
*     doe_t2co  =    2.6122;      
*     doe_kappa =    0.0001;      

doe_ak       =   0.0015 ;       
doe_bk       =   7.9251 ;       
doe_rlam     =   0.0003 ;       
doe_bsi      =   1.3000 ;       
doe_csw      =   0.1300 ;       
doe_cal      =   0.5200 ;       
doe_cas      =   7.8000 ;       
doe_q2co     =   3.7000 ;       
doe_t2co     =   2.6122 ;       
doe_kappa    =   0.0100 ;       
 


$endif

$ifthen %scen% == "tcre2"
*     doe_ak    =    0.0880;      
*     doe_bk    =    0.0872;      
*     doe_rlam  =    0.6694;      
*     doe_bsi   =    1.3528;      
*     doe_csw   =    2.1774;      
*     doe_cal   =    2.6787;      
*     doe_cas   =   11.4856;      
*     doe_q2co  =    1.5000;      
*     doe_t2co  =    2.6122;      
*     doe_kappa =    0.0001;      

doe_ak       =   0.0015 ;       
doe_bk       =   7.9251 ;       
doe_rlam     =   0.0003 ;       
doe_bsi      =   1.3000 ;       
doe_csw      =   0.1300 ;       
doe_cal      =   0.5200 ;       
doe_cas      =   7.8000 ;       
doe_q2co     =   3.7000 ;       
doe_t2co     =   2.6122 ;       
doe_kappa    =   0.0100 ;       
 


$endif


parameter
    // DOECLIM parameters calculated from constants above
    doe_ocean_area       // m2
    doe_cnum             // factor from sea-surface climate sensitivity to global mean
    doe_cden             // intermediate parameter
    doe_cfl              // land climate feedback parameter, W/m2/K
    doe_cfs              // sea climate feedback parameter, W/m2/K
    doe_kls              // land-sea heat exchange coefficient, W/m2/K
    doe_keff             // ocean heat diffusivity, m2/yr
    doe_taubot           // ocean bottom diffusion time scale, yr
    doe_powtoheat        // convert flux to total ocean heat 1E22 m2*s
    doe_taucfs           // sea climate feedback time scale, yr
    doe_taucfl           // land climate feedback time scale, yr
    doe_taudif           // interior ocean heat uptake time scale, yr
    doe_tauksl           // sea-land heat exchange time scale, yr
    doe_taukls           // land-sea heat exchange time scale, yr
;

    doe_ocean_area  = (1.0 - doe_flnd) * doe_earth_area;    // m2
    doe_cnum        = doe_rlam * doe_flnd + doe_bsi * (1.0 - doe_flnd);   // factor from sea-surface climate sensitivity to global mean
    doe_cden        = doe_rlam * doe_flnd - doe_ak * (doe_rlam - doe_bsi);    // intermediate parameter
    doe_cfl         = doe_flnd * doe_cnum / doe_cden * doe_q2co / doe_t2co - doe_bk * (doe_rlam - doe_bsi) / doe_cden;      // land climate feedback parameter, W/m2/K
    doe_cfs         = (doe_rlam * doe_flnd - doe_ak / (1.0 - doe_flnd) * (doe_rlam - doe_bsi)) * doe_cnum / doe_cden * doe_q2co / doe_t2co + doe_rlam * doe_flnd / (1.0 - doe_flnd) * doe_bk * (doe_rlam - doe_bsi) / doe_cden;                                // sea climate feedback parameter, W/m2/K
    doe_kls         = doe_bk * doe_rlam * doe_flnd / doe_cden - doe_ak * doe_flnd * doe_cnum / doe_cden * doe_q2co / doe_t2co;  // land-sea heat exchange coefficient, W/m2/K
    doe_keff        = doe_kcon * doe_kappa;    // ocean heat diffusivity, m2/yr
    doe_taubot      = power(doe_zbot,2) / doe_keff;    // ocean bottom diffusion time scale, yr
    doe_powtoheat   = doe_ocean_area * doe_secs_per_Year / power(10.0,22);    // convert flux to total ocean heat
    doe_taucfs      = doe_cas / doe_cfs;    // sea climate feedback time scale, yr
    doe_taucfl      = doe_cal / doe_cfl;    // land climate feedback time scale, yr
    doe_taudif      = power(doe_cas,2) / power(doe_csw,2) * doe_Pi / doe_keff;    // interior ocean heat uptake time scale, yr
    doe_tauksl      = (1.0 - doe_flnd) * doe_cas / doe_kls;    // sea-land heat exchange time scale, yr
    doe_taukls      = doe_flnd * doe_cal / doe_kls;    // land-sea heat exchange time scale, yr

display doe_cden;


parameter

    doe_KT0(t)
    doe_KTA1(t)
    doe_KTB1(t)
    doe_KTA2(t)
    doe_KTB2(t)
    doe_KTA3(t)
    doe_KTB3(t)
;

// Components of the analytical solution to the integral found in the temperature difference equation
// Third order bottom correction terms will be "more than sufficient" for simulations out to 2500
// (Equation A.25, EK05, or 2.3.23, TK07)

    // First order

    doe_KT0(t)$(t.val=last_year)  = 4.0 - 2.0 * 2.0 ** 0.5;
    doe_KTA1(t)$(t.val=last_year) = -8.0 * exp(-doe_taubot / scm_dt) + 4.0 * 2.0 ** 0.5 * exp(-0.5 * doe_taubot / scm_dt);
    doe_KTB1(t)$(t.val=last_year) = 4.0 * (doe_Pi * doe_taubot / scm_dt) ** 0.5 * (1.0 + erf((0.5 * doe_taubot / scm_dt) ** 0.5) - 2.0 * erf((doe_taubot / scm_dt) ** 0.5));

    // Second order
    doe_KTA2(t)$(t.val=last_year) =  8.0 * exp(-4.0 * doe_taubot / scm_dt) - 4.0 * 2.0 ** 0.5 * exp(-2.0 * doe_taubot / scm_dt);
    doe_KTB2(t)$(t.val=last_year) = -8.0 * (doe_Pi * doe_taubot / scm_dt)** 0.5 * (1.0 + erf((2.0 * doe_taubot / scm_dt)** 0.5) - 2.0 * erf(2.0 * (doe_taubot / scm_dt) ** 0.5) );

    // Third order
    doe_KTA3(t)$(t.val=last_year) = -8.0 * exp(-9.0 * doe_taubot / scm_dt) + 4.0 * 2.0 ** 0.5 * exp(-4.5 * doe_taubot / scm_dt);
    doe_KTB3(t)$(t.val=last_year) = 12.0 * (doe_Pi * doe_taubot / scm_dt) ** 0.5 * (1.0 + erf((4.5 * doe_taubot / scm_dt) ** 0.5) - 2.0 * erf(3.0 * (doe_taubot / scm_dt) ** 0.5) );

    // First order
    doe_KT0(t)$(t.val < last_year) = 4.0 * (doe_nsteps+1-ord(t)) ** 0.5 - 2.0 * (doe_nsteps+1+1-ord(t)) ** 0.5 - 2.0 * (doe_nsteps+1-1-ord(t)) ** 0.5;
    doe_KTA1(t)$(t.val < last_year) = -8.0 * (doe_nsteps+1-ord(t)) ** 0.5 * exp(-doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) + 4.0 * (doe_nsteps+1+1-ord(t)) ** 0.5 * exp(-doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) + 4.0 * (doe_nsteps+1-1-ord(t)) ** 0.5 * exp(-doe_taubot/scm_dt / (doe_nsteps+1-1-ord(t)));
    doe_KTB1(t)$(t.val < last_year) =  4.0 * (doe_Pi * doe_taubot / scm_dt) ** 0.5 * ( erf((doe_taubot / scm_dt / (doe_nsteps+1-1-ord(t)))** 0.5) + erf((doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) ** 0.5) - 2.0 * erf((doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) ** 0.5));

    // Second order
    doe_KTA2(t)$(t.val < last_year) =  8.0 * (doe_nsteps+1-ord(t)) ** 0.5 * exp(-4.0 * doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) - 4.0 * (doe_nsteps+1+1-ord(t)) ** 0.5 * exp(-4.0 * doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) - 4.0 * (doe_nsteps+1-1-ord(t)) ** 0.5 * exp(-4.0 * doe_taubot / scm_dt / (doe_nsteps+1-1-ord(t)));
    doe_KTB2(t)$(t.val < last_year) = -8.0 * (doe_Pi * doe_taubot / scm_dt) ** 0.5 * ( erf(2.0 * (doe_taubot / scm_dt / (doe_nsteps+1-1-ord(t))) ** 0.5) + erf(2.0 * (doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) ** 0.5) - 2.0 * erf(2.0 * (doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) ** 0.5) );

    // Third order
    doe_KTA3(t)$(t.val < last_year) = -8.0 * (doe_nsteps+1-ord(t)) ** 0.5 * exp(-9.0 * doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) + 4.0 * (doe_nsteps+1+1-ord(t)) ** 0.5 * exp(-9.0 * doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) + 4.0 * (doe_nsteps+1-1-ord(t)) ** 0.5 * exp(-9.0 * doe_taubot / scm_dt / (doe_nsteps+1-1-ord(t)));
    doe_KTB3(t)$(t.val < last_year) = 12.0 * (doe_Pi * doe_taubot / scm_dt) ** 0.5 * ( erf(3.0 * (doe_taubot / scm_dt / (doe_nsteps+1-1-ord(t))) ** 0.5) + erf(3.0 * (doe_taubot / scm_dt / (doe_nsteps+1+1-ord(t))) ** 0.5) - 2.0 * erf(3.0 * (doe_taubot / scm_dt / (doe_nsteps+1-ord(t))) ** 0.5) );

*option decimals = 8;
display
doe_t2co      ,
doe_kappa     ,
doe_ocean_area,
doe_cnum      ,
doe_cden      ,
doe_cfl       ,
doe_cfs       ,
doe_kls       ,
doe_keff      ,
doe_taubot    ,
doe_powtoheat ,
doe_taucfs    ,
doe_taucfl    ,
doe_taudif    ,
doe_tauksl    ,
doe_taukls    ;


*display doe_nsteps;
*display doe_KT0;
*display doe_KTA1;
*display doe_KTB1;

*display doe_KTA2, doe_KTB2, doe_KTA3, doe_KTB3;


parameter
    doe_Ker(t);

    doe_Ker(t) = doe_KT0(t) + doe_KTA1(t) + doe_KTB1(t) + doe_KTA2(t) + doe_KTB2(t) + doe_KTA3(t) + doe_KTB3(t);


*display doe_Ker;

set mtx_idx /1*4/;
parameter
    doe_cdoe(mtx_idx)
;


// Correction terms, remove oscillation artefacts due to short-term forcings
// (Equation 2.3.27, TK07)
doe_cdoe("1") = 1.0 / power(doe_taucfl, 2) + 1.0 / power(doe_taukls, 2) + 2.0 / doe_taucfl / doe_taukls + doe_bsi / doe_taukls / doe_tauksl;
doe_cdoe("2") = -1 * doe_bsi / power(doe_taukls, 2) - doe_bsi / doe_taucfl / doe_taukls - doe_bsi / doe_taucfs / doe_taukls - power(doe_bsi, 2) / doe_taukls / doe_tauksl;
doe_cdoe("3") = -1 * doe_bsi / power(doe_tauksl, 2) - 1.0 / doe_taucfs / doe_tauksl - 1.0 / doe_taucfl / doe_tauksl -1.0 / doe_taukls / doe_tauksl;
doe_cdoe("4") = 1.0 / power(doe_taucfs, 2) + power(doe_bsi, 2) / power(doe_tauksl, 2) + 2.0 * doe_bsi / doe_taucfs / doe_tauksl + doe_bsi / doe_taukls / doe_tauksl;

doe_cdoe(mtx_idx) = doe_cdoe(mtx_idx) * (power(scm_dt, 2) / 12.0);

//display doe_cdoe;

parameter
    doe_bdoe(mtx_idx)
    doe_adoe(mtx_idx)

    doe_Ker_last
;

loop(t,
    if(ord(t) eq card(t), doe_Ker_last = doe_Ker(t));
);

//------------------------------------------------------------------
// Matrices of difference equation system B*T(i+1) = Q(i) + A*T(i)
// T = (TL,TS)
// (Equations 2.3.24 and 2.3.27, TK07)
doe_bdoe("1") = 1.0 + scm_dt / (2.0 * doe_taucfl) + scm_dt / (2.0 * doe_taukls);
doe_bdoe("2") = -scm_dt / (2.0 * doe_taukls) * doe_bsi;
doe_bdoe("3") = -scm_dt / (2.0 * doe_tauksl);
doe_bdoe("4") = 1.0 + scm_dt / (2.0 * doe_taucfs) + scm_dt / (2.0 * doe_tauksl) * doe_bsi + 2.0 * doe_fso * (scm_dt / doe_taudif) ** 0.5;

doe_adoe("1") = 1.0 - scm_dt / (2.0 * doe_taucfl) - scm_dt / (2.0 * doe_taukls);
doe_adoe("2") = scm_dt / (2.0 * doe_taukls) * doe_bsi;
doe_adoe("3") = scm_dt / (2.0 * doe_tauksl);
doe_adoe("4") = 1.0 - scm_dt / (2.0 * doe_taucfs) - scm_dt / (2.0 * doe_tauksl) * doe_bsi + doe_Ker_last * doe_fso * (scm_dt / doe_taudif) ** 0.5;

doe_bdoe(mtx_idx) = doe_bdoe(mtx_idx) + doe_cdoe(mtx_idx);
doe_adoe(mtx_idx) = doe_adoe(mtx_idx) + doe_cdoe(mtx_idx);

//display doe_bdoe, doe_adoe, doe_Ker_last;

// Calculate the inverse of doe_bdoe

parameter
    doe_ibdoe(mtx_idx)
    doe_temp
    doe_temp_d
;

    doe_temp_d = (doe_bdoe("1")*doe_bdoe("4") - doe_bdoe("2")*doe_bdoe("3"));
    doe_temp = 1/doe_temp_d;
    doe_ibdoe("1") = doe_temp * doe_bdoe("4");
    doe_ibdoe("2") = doe_temp * (-1) * doe_bdoe("2");
    doe_ibdoe("3") = doe_temp * (-1) * doe_bdoe("3");
    doe_ibdoe("4") = doe_temp * doe_bdoe("1");

display doe_ibdoe;
display doe_temp_d;


variable
    doe_QL(t)
    doe_QO(t)

    doe_DelQL(t)
    doe_DelQO(t)

    doe_QC1(t)
    doe_QC2(t)

    doe_DQ1(t)
    doe_DQ2(t)

    doe_DPAST1(t)
    doe_DPAST2(t)

    doe_DTEAUX1(t)
    doe_DTEAUX2(t)

    doe_temp_landair(t)
    doe_temp_sst(t)

    doe_tas(t)

    doe_heatflux_mixed(t)
    doe_heatflux_interior(t)
    doe_heat_mixed(t)
    doe_heat_interior(t)

    doe_heatflux(t)
    doe_heatcontent(t)


;

equation
    doe_QL_EQ(t)
    doe_QO_EQ(t)

    doe_DelQL_EQ(t)
    doe_DelQO_EQ(t)

    doe_QC1_EQ(t)
    doe_QC2_EQ(t)

    doe_DQ1_EQ(t)
    doe_DQ2_EQ(t)

    doe_DPAST2_EQ(t)

    doe_DTEAUX1_EQ(t)
    doe_DTEAUX2_EQ(t)

    doe_temp_landair_EQ(t)
    doe_temp_sst_EQ(t)

    doe_tas_EQ(t)
 
    doe_heatflux_mixed_EQ(t)
    doe_heatflux_interior_EQ(t)
    doe_heat_mixed_EQ(t)
    doe_heat_interior_EQ(t)

    doe_heatflux_EQ(t)
    doe_heatcontent_EQ(t)


;
// Assume land and ocean forcings are equal to global forcing

    doe_QL_EQ(t)..              doe_QL(t)       =E= scm_ftot(t);
    doe_QO_EQ(t)..              doe_QO(t)       =E= scm_ftot(t);

    doe_DelQL_EQ(t)..           doe_DelQL(t)    =E= doe_QL(t) - doe_QL(t-1);
    doe_DelQO_EQ(t)..           doe_DelQO(t)    =E= doe_QO(t) - doe_QO(t-1);


    // Assume linear forcing change between tstep and tstep+1
    doe_QC1_EQ(t)..             doe_QC1(t)      =E= (doe_DelQL(t)/doe_cal*(1.0/doe_taucfl+1.0/doe_taukls)-doe_bsi*doe_DelQO(t)/doe_cas/doe_taukls) * power(scm_dt, 2)/12.0;
    doe_QC2_EQ(t)..             doe_QC2(t)      =E= (doe_DelQO(t)/doe_cas*(1.0/doe_taucfs+doe_bsi/doe_tauksl)-doe_DelQL(t)/doe_cal/doe_tauksl) *power(scm_dt, 2)/12.0;

    // ----------------- Initial Conditions --------------------
    // Initialization of temperature and forcing vector:
    // Factor 1/2 in front of Q in Equation A.27, EK05, and Equation 2.3.27, TK07 is a typo!
    // Assumption: linear forcing change between n and n+1
    doe_DQ1_EQ(t)..             doe_DQ1(t)      =E= 0.5*scm_dt/doe_cal*(doe_QL(t)+doe_QL(t-1)) + doe_QC1(t);
    doe_DQ2_EQ(t)..             doe_DQ2(t)      =E= 0.5*scm_dt/doe_cas*(doe_QO(t)+doe_QO(t-1)) + doe_QC2(t);


    // ---------- SOLVE MODEL ------------------
    // Calculate temperatures

    doe_DPAST2_EQ(t)..          doe_DPAST2(t)           =E= sum(t1$(ord(t1) lt ord(t)), doe_temp_sst(t1) * doe_Ker(t1+(doe_nsteps-ord(t)))) * doe_fso * (scm_dt/doe_taudif) ** 0.5;

    doe_DTEAUX1_EQ(t)..         doe_DTEAUX1(t)          =E= doe_adoe("1") * doe_temp_landair(t-1) + doe_adoe("2") * doe_temp_sst(t-1);
    doe_DTEAUX2_EQ(t)..         doe_DTEAUX2(t)          =E= doe_adoe("3") * doe_temp_landair(t-1) + doe_adoe("4") * doe_temp_sst(t-1);

    doe_temp_landair_EQ(t)..    doe_temp_landair(t)     =E= doe_ibdoe("1") * (doe_DQ1(t) + doe_DPAST1(t) + doe_DTEAUX1(t)) + doe_ibdoe("2") * (doe_DQ2(t) + doe_DPAST2(t) + doe_DTEAUX2(t));
    doe_temp_sst_EQ(t)..        doe_temp_sst(t)         =E= doe_ibdoe("3") * (doe_DQ1(t) + doe_DPAST1(t) + doe_DTEAUX1(t)) + doe_ibdoe("4") * (doe_DQ2(t) + doe_DPAST2(t) + doe_DTEAUX2(t));


    doe_tas_EQ(t)..             doe_tas(t)              =E= doe_flnd * doe_temp_landair(t) + (1.0 - doe_flnd) * doe_bsi * doe_temp_sst(t);


    // Calculate ocean heat uptake [W/m^2]
    // heatflux[tstep] captures in the heat flux in the period between tstep-1 and tstep.
    // Numerical implementation of Equation 2.7, EK05, or Equation 2.3.13, TK07)
    // ------------------------------------------------------------------------



    doe_heatflux_mixed_EQ(t)..          doe_heatflux_mixed(t)       =E= doe_cas*(doe_temp_sst(t) - doe_temp_sst(t-1));
    doe_heatflux_interior_EQ(t)..       doe_heatflux_interior(t)    =E= doe_cas*doe_fso/(doe_taudif*scm_dt) ** 0.5*(2.0*doe_temp_sst(t) - sum(t1$(ord(t1) lt ord(t)), doe_temp_sst(t1) * doe_Ker(t1+(doe_nsteps-ord(t)+1))));
    
    doe_heat_interior_EQ(t)..           doe_heat_mixed(t)           =E= doe_heat_mixed(t-1) + doe_heatflux_mixed(t) * (doe_powtoheat*scm_dt);
    doe_heat_mixed_EQ(t)..              doe_heat_interior(t)        =E= doe_heat_interior(t-1) + doe_heatflux_interior(t) * (doe_fso*doe_powtoheat*scm_dt);

    doe_heatflux_EQ(t)..                doe_heatflux(t)             =E= (doe_heatflux_mixed(t) + doe_fso * doe_heatflux_interior(t)) * doe_powtoheat;
    doe_heatcontent_EQ(t)..             doe_heatcontent(t)          =E= (doe_heatcontent(t-1) + doe_heatflux(t))$(not tfirst(t)) + (doe_zero)$tfirst(t);
*For testing purpose
*$ifthen set cali_tm
*$include ../trunk/gms/cali_doeclim_solve.gms
*$endif


// Handle the initial conditions
*    doe_temp_landair.fx(tfirst) = 0.0;
*    doe_temp_sst.fx(tfirst) = 0.0;

    doe_DPAST1.fx(t) = 0;

