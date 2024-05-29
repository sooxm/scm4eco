** This module is from DICE2023, which is built based on FAIR simple climate model
** Equals old FAIR with recalibrated parameters for revised F2xco2 and Millar model.
** Deletes nonnegative reservoirs. See explanation below


*sets     tfirst(t), tlast(t);

PARAMETERS
        fair_yr0     Calendar year that corresponds to model year zero         /2020/
        fair_emshare0 Carbon emissions share into Reservoir 0   /0.2173/
        fair_emshare1 Carbon emissions share into Reservoir 1    /0.224/
        fair_emshare2 Carbon emissions share into Reservoir 2    /0.2824/
        fair_emshare3 Carbon emissions share into Reservoir 3    /0.2763/
        fair_tau0    Decay time constant for R0  (year)                            /1000000/
        fair_tau1    Decay time constant for R1  (year)                            /394.4/
        fair_tau2    Decay time constant for R2  (year)       /36.53/
        fair_tau3    Decay time constant for R3  (year) /4.304/

        fair_teq1    Thermal equilibration parameter for box 1 (m^2 per KW)         /0.324/
        fair_teq2    Thermal equilibration parameter for box 2 (m^2 per KW)        /0.44/
        fair_d1      Thermal response timescale for deep ocean (year)               /236/
        fair_d2      Thermal response timescale for upper ocean (year)              /4.07/
 
        fair_irf0    Pre-industrial IRF100 (year)                                        /32.4/
        fair_irC      Increase in IRF100 with cumulative carbon uptake (years per GtC)    /0.019/
        fair_irT      Increase in IRF100 with warming (years per degree K)                /4.165/
        fair_fco22x   Forcings of equilibrium CO2 doubling (Wm-2)                        /3.93/       

** INITIAL CONDITIONS TO BE CALIBRATED TO HISTORY
** CALIBRATION
*       fair_mat0   Initial concentration in atmosphere in 2020 (GtC)       /886.5128014/
 
*       fair_res00  Initial concentration in Reservoir 0 in 2020 (GtC)      /150.093 /
*       fair_res10  Initial concentration in Reservior 1 in 2020 (GtC)      /102.698 /
*       fair_res20  Initial concentration in Reservoir 2 in 2020 (GtC)      /39.534  /
*       fair_res30  Initial concentration in Reservoir 3 in 2020 (GtC)      / 6.1865 /
	   
       fair_mat0   Initial concentration in atmosphere in 1850 (GtC)       /602.932/

       fair_res00  Initial concentration in Reservoir 0 in 1850 (GtC)      /2.37777934 /
      fair_res10  Initial concentration in Reservior 1 in 1850 (GtC)      /1.56211058 /
       fair_res20  Initial concentration in Reservoir 2 in 1850 (GtC)      /0.42749728  /
       fair_res30  Initial concentration in Reservoir 3 in 1850 (GtC)      /0.09531464 /

*       fair_mateq      Equilibrium concentration atmosphere  (GtC)            /588   /
*       fair_tbox10    Initial temperature box 1 change in 2020 (C from 1765)  /0.1477  /
*       fair_tbox20    Initial temperature box 2 change in 2020 (C from 1765)  /1.099454/
*       fair_tatm0     Initial atmospheric temperature change in 2020          /1.24715 /   

        fair_mateq      Equilibrium concentration atmosphere  (GtC)            /600   /
       fair_tbox10    Initial temperature box 1 change in 1850 (C from 1765)  /0.0009210303  /
       fair_tbox20    Initial temperature box 2 change in 1850 (C from 1765)  /0.006855995/
       fair_tatm0     Initial atmospheric temperature change in 1850          /0.007777 /     

*       fair_F_Misc(t)
*       fair_F_GHGabate(t)        
;

*       fair_F_Misc(t) = 0.265;
*       fair_F_GHGabate(t)    = 0.45;
VARIABLES
*Note: Stock variables correspond to levels at the END of the period
*       fair_FORC(t)        Increase in radiative forcing (watts per m2 from 1765)
*       fair_TATM(t)        Increase temperature of atmosphere (degrees C from 1765)     
*       fair_TBOX1(t)       Increase temperature of box 1 (degrees C from 1765)
*       fair_TBOX2(t)       Increase temperature of box 2 (degrees C from 1765)
        fair_RES0(t)        Carbon concentration in Reservoir 0 (GtC from 1765)
        fair_RES1(t)        Carbon concentration in Reservoir 1 (GtC from 1765)
        fair_RES2(t)        Carbon concentration in Reservoir 2 (GtC from 1765)
        fair_RES3(t)        Carbon concentration in Reservoir 3 (GtC from 1765)
        fair_MAT(t)         Carbon concentration increase in atmosphere (GtC from 1765)
        fair_CACC(t)        Accumulated carbon in ocean and other sinks (GtC)
        fair_IRFt(t)        IRF100 at time t
        fair_alpha(t)       Carbon decay time scaling factor
        fair_SumAlpha      Placeholder variable for objective function;

**** IMPORTANT PROGRAMMING NOTE. Earlier implementations has reservoirs as non-negative.
**** However, these are not physical but mathematical solutions.
**** So, they need to be unconstrained so that can have negative emissions.
NONNEGATIVE VARIABLES   TATM, MAT,  IRFt, alpha

EQUATIONS
*       fair_FORCE(t)        Radiative forcing equation
        fair_RES0LOM(t)      Reservoir 0 law of motion
        fair_RES1LOM(t)      Reservoir 1 law of motion
        fair_RES2LOM(t)      Reservoir 2 law of motion
        fair_RES3LOM(t)      Reservoir 3 law of motion
        fair_MMAT(t)         Atmospheric concentration equation
        fair_Cacceq(t)       Accumulated carbon in sinks equation
*       fair_TATMEQ(t)       Temperature-climate equation for atmosphere
*       fair_TBOX1EQ(t)      Temperature box 1 law of motion
*       fair_TBOX2EQ(t)      Temperature box 2 law of motion
        fair_IRFeqLHS(t)     Left-hand side of IRF100 equation
        fair_IRFeqRHS(t)     Right-hand side of IRF100 equation
;
** Equations of the model
    fair_res0lom(t+1)..   fair_RES0(t+1) =E=  (fair_emshare0*fair_tau0*fair_alpha(t+1)*dat_ems(t+1,"co2")/scm_dt)*(1-exp(-scm_dt/(fair_tau0*fair_alpha(t+1))))+fair_Res0(t)*exp(-scm_dt/(fair_tau0*fair_alpha(t+1)));
    fair_res1lom(t+1)..   fair_RES1(t+1) =E=  (fair_emshare1*fair_tau1*fair_alpha(t+1)*dat_ems(t+1,"co2")/scm_dt)*(1-exp(-scm_dt/(fair_tau1*fair_alpha(t+1))))+fair_Res1(t)*exp(-scm_dt/(fair_tau1*fair_alpha(t+1)));
    fair_res2lom(t+1)..   fair_RES2(t+1) =E=  (fair_emshare2*fair_tau2*fair_alpha(t+1)*dat_ems(t+1,"co2")/scm_dt)*(1-exp(-scm_dt/(fair_tau2*fair_alpha(t+1))))+fair_Res2(t)*exp(-scm_dt/(fair_tau2*fair_alpha(t+1)));
    fair_res3lom(t+1)..   fair_RES3(t+1) =E=  (fair_emshare3*fair_tau3*fair_alpha(t+1)*dat_ems(t+1,"co2")/scm_dt)*(1-exp(-scm_dt/(fair_tau3*fair_alpha(t+1))))+fair_Res3(t)*exp(-scm_dt/(fair_tau3*fair_alpha(t+1)));
    fair_mmat(t+1)..      fair_MAT(t+1)  =E=   fair_mateq+fair_Res0(t+1)+fair_Res1(t+1)+fair_Res2(t+1)+fair_Res3(t+1);
    fair_cacceq(t)..      fair_Cacc(t)   =E=  (scm_cca(t)-(fair_MAT(t)-fair_mateq));
*   fair_force(t)..       fair_FORC(t)    =E=  fair_fco22x*((log((fair_MAT(t)/fair_mateq))/log(2))) + fair_F_Misc(t)+fair_F_GHGabate(t);
    
*   fair_tbox1eq(t+1)..   fair_Tbox1(t+1) =E=  fair_Tbox1(t)*exp(-scm_dt/fair_d1)+fair_teq1*fair_Forc(t+1)*(1-exp(-scm_dt/fair_d1));
*   fair_tbox2eq(t+1)..   fair_Tbox2(t+1) =E=  fair_Tbox2(t)*exp(-scm_dt/fair_d2)+fair_teq2*fair_Forc(t+1)*(1-exp(-scm_dt/fair_d2));
*   fair_tatmeq(t+1)..    fair_TATM(t+1)  =E=   fair_Tbox1(t+1)+fair_Tbox2(t+1);
   fair_irfeqlhs(t)..    fair_IRFt(t)   =E=  ((fair_alpha(t)*fair_emshare0*fair_tau0*(1-exp(-100/(fair_alpha(t)*fair_tau0))))+(fair_alpha(t)*fair_emshare1*fair_tau1*(1-exp(-100/(fair_alpha(t)*fair_tau1))))+(fair_alpha(t)*fair_emshare2*fair_tau2*(1-exp(-100/(fair_alpha(t)*fair_tau2))))+(fair_alpha(t)*fair_emshare3*fair_tau3*(1-exp(-100/(fair_alpha(t)*fair_tau3)))));
   fair_irfeqrhs(t)..    fair_IRFt(t)   =E=  fair_irf0+fair_irC*fair_Cacc(t)+fair_irT*scm_TATM(t);

**  Upper and lower bounds for stability
fair_MAT.LO(t)       = 10;
* fair_TATM.UP(t)      = 20;
* fair_TATM.lo(t)      = -0.5;
fair_alpha.up(t) = 500;
fair_alpha.lo(t) = 0.1;
fair_alpha.l(t) = 0.16;

* Initial conditions
fair_MAT.FX(tfirst)    = fair_mat0;
fair_MAT.lo(t) = fair_mat0;

* fair_TATM.FX(tfirst)   = fair_tatm0;
fair_Res0.fx(tfirst) = fair_Res00;
fair_Res1.fx(tfirst) = fair_Res10;
fair_Res2.fx(tfirst) = fair_Res20;
fair_Res3.fx(tfirst) = fair_Res30;
* fair_Tbox1.fx(tfirst) = fair_Tbox10;
* fair_Tbox2.fx(tfirst) = fair_Tbox20;

** Solution options
option iterlim = 99900;
option reslim = 99999;
option solprint = on;
option limrow = 0;
option limcol = 0;
 