$ifthen not set ref

* $ifthen not set limT 
* $ifthen not set CLP 
* eco_miu.fx(tp,gas_nonf)   = 0.;
* SOLVE scm4opt USING NLP MAXIMIZING obj;
* $include ../trunk/gms/econ_sym.gms
* $endif
* $endif

scalar eco_miu_up /1.2/;

$Ifthen %scen% == "ssp1"
eco_miu_up  = 1.5;
$elseif %scen% == "ssp2"
eco_miu_up  = 1.8;
$elseif %scen% == "ssp3"
eco_miu_up  = 1.2;
$elseif %scen% == "ssp4"
eco_miu_up  = 1.9;
$elseif %scen% == "ssp5"
eco_miu_up  = 1.7;
$endif

$ifthen set use_mac
$Ifthen %scen% == "ssp1"
eco_miu_up  = 1.5+0.2;
$elseif %scen% == "ssp2"
eco_miu_up  = 1.8;
$elseif %scen% == "ssp3"
eco_miu_up  = 1.2+0.2;
$elseif %scen% == "ssp4"
eco_miu_up  = 1.9;
$elseif %scen% == "ssp5"
eco_miu_up  = 1.7+0.1;
$endif
$endif

* $ifthen set use_pop
* eco_miu_up = eco_miu_up + 0.2;
* $endif

$ifthen set use_gdp
$Ifthen %use_gdp% == "ssp1"
eco_miu_up  = 1.5;
$elseif %use_gdp% == "ssp2"
eco_miu_up  = 1.8;
$elseif %use_gdp% == "ssp3"
eco_miu_up  = 1.2+0.2;
$elseif %use_gdp% == "ssp4"
eco_miu_up  = 1.9;
$elseif %use_gdp% == "ssp5"
eco_miu_up  = 1.7;
$endif
$endIf

eco_miu_up = 1.7;
$ifthen not set CLP
eco_miu.up(tp,gas_nonf)$(tp.val > 2020) = eco_miu_up;
eco_cmiu.up(tp)$(tp.val > 2020)   = eco_miu_up;
$endIf




eco_miu.l(tp,gas_nonf)   = 0.88;
eco_cmiu.l(tp)   = 0.9;



$ifthen set limT 
* scm_tatm.up(t)$(t.val>2100) = %limT%;
scm_tatm.up(t) = %limT%;
$elseif set CLP 
* tt(t) = slice_map("ts3",t);
* eco_miu.fx(t,"co2")   = miu_path(t);
* eco_cmiu.fx(t)   = round(miu_path(t),2);
* eco_cmiu.fx(t) = 0;
*  eco_miu.fx(t,gas_nonf)   = miu_path(t,gas_nonf);
 eco_miu.fx(t,"co2")   = miu_path(t,"co2");


*  eco_cprice.fx(t) = round(price_path(t),2);
$else
* tt(t) = slice_map("ts2",t);
$endIf

SOLVE scm4opt USING NLP MAXIMIZING obj;
$else
SOLVE scm4opt USING NLP MAXIMIZING obj;

$endIf

$ifthen %dmg% == "ssp"
* emulator
* parameter
* dmg_a1        Damage intercept                                 /0/
* dmg_a2        Damage quadratic term                            /1.979e-03/
* dmg_a3        Damage exponent                                  /2    /
* ;
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*signPower(scm_tatm(t),dmg_a3);
* eco_GDFRACEQ(t)..                   eco_gdfrac(t)           =E= dmg_a1*scm_tatm(t)+dmg_a2*scm_tatm(t)**dmg_a3;

$ifthen %scen% == "ssp1"

dmg_a1        =                            0.004759665;
dmg_a2        =                            0.001900510; 
dmg_a3        =                            2.00    ;

$elseIf %scen% == "ssp2"

dmg_a1        =                            0.004800032;  
dmg_a2        =                            0.001977489; 
dmg_a3        =                            2.00    ;

$elseIf %scen% == "ssp3"

dmg_a1        =                            0.003467047;  
dmg_a2        =                            0.003055544;
dmg_a3        =                            2.00    ;

$elseIf %scen% == "ssp4"

dmg_a1        =                            0.004764481;  
dmg_a2        =                            0.002299899; 
dmg_a3        =                            2.00    ;

$elseIf %scen% == "ssp5"

dmg_a1        =                            0.004710991; 
dmg_a2        =                            0.001619722; 
dmg_a3        =                            2.00    ;

$endIf

parameter
est_gdfrac(t) 
est_gd(t) 
;
est_gdfrac(t)  = dmg_a1*scm_tatm.l(t)+dmg_a2*signPower(scm_tatm.l(t),dmg_a3);
est_gd(t)      = eco_ygross.l(t) * est_gdfrac(t);

$endIf