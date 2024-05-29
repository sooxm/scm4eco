*Coefficients related to equivalent effective stratospheric chlorine (EESC)
set def_hcoef /tau,rho,ha0,mms/;

*Coefficients for halogenated gases
*WG1AR5 Table 8.A.1   mms pptv
*tau lifetime (year)      
*rho radiative efficiency (W m–2 ppb–1)          
*ha0 preindustrial HaloC concentrations {ppt}   
*mms molar mass
table def_hf_AR5(fgs, def_hcoef)
            tau          rho             ha0      mms
cf4         50000        0.09            35       88.0043
c2f6        10000        0.25            0        138.01
c6f14       3100         0.44            0        338.0436448
hfc23       222          0.18            0        70
hfc32       5.2          0.11            0        52
hfc4310mee  16.1         0.42            0        252.0
hfc125      28.2         0.23            0        120.02
hfc134a     13.4         0.16            0        102.02
hfc143a     47.1         0.16            0        84.04
hfc227ea    38.9         0.26            0        170.03
hfc245fa    7.7          0.24            0        134
sf6         3200         0.57            0        146.06

hfc134     10.5          0.19            0        102.031
hfc143     3.7           0.13            0        84.04
hfc41      2.9           0.02            0        34.03

hfc152a     1.5          0.10            0        66
hfc236fa    242.0        0.24            0        152       
hfc365mfc   8.7          0.22            0        148.1

nf3         500.0        0.20            0        71
c3f8        2600.0       0.28            0        188
cc4f8       3200.0       0.32            0        200
c4f10       2600.0       0.36            0        238
c5f12       4100.0       0.41            0        288
c7f16       3000.0       0.50            0        388.1

cfc11       45           0.26            0        137.35
cfc12       100          0.32            0        120.9
cfc113      85           0.3             0        187.35
cfc114      190          0.31            0        170.9
cfc115      1020         0.2             0        154.45
ccl4        26           0.17            0        153.8
ch3ccl3     5            0.07            0        133.35
hcfc22       11.9         0.21            0        86.45
hcfc141b     9.2          0.16            0        116.9
hcfc142b     17.2         0.19            0        100.45
halon1211   16           0.029           0        165.35
halon1202   2.9          0.27            0        209.8158064
halon1301   65           0.3             0        148.9
halon2402   20           0.31            0        259.8
ch3br       0.8          0.004           5.8      94.9
ch3cl       1            0.01            480      50.45
;

*Coefficients for halogenated gases
*From MAGICC 6.0 definition
table def_hf_mgc6(fgs, def_hcoef)
            tau          rho             ha0      mms
cf4         50000        0.1             35       88.0043
c2f6        10000        0.26            0        138.01
c6f14       3200         0.49            0        338.0436448
hfc23       270          0.19            0        70
hfc32       4.9          0.11            0        52
hfc4310mee  15.9         0.40            0        252.0
hfc125      29           0.23            0        120.02
hfc134a     14           0.16            0        102.02
hfc143a     52           0.13            0        84.04
hfc227ea    34.2         0.26            0        170.03
hfc245fa    7.6          0.28            0        134
sf6         3200         0.52            0        146.06
cfc11       45           0.25            0        137.35
cfc12       100          0.32            0        120.9
cfc113      85           0.3             0        187.35
cfc114      300          0.31            0        170.9
cfc115      1700         0.18            0        154.45
ccl4        26           0.13            0        153.8
ch3ccl3     5            0.06            0        133.35
hcfc22       12           0.20            0        86.45
hcfc141b     9.3          0.14            0        116.9
hcfc142b     17.9         0.20            0        100.45
halon1211   16           0.3             0        165.35
*rho for halon1202 = 0?
halon1202   2.9          0               0        209.8158064
halon1301   65           0.32            0        148.9
halon2402   20           0.33            0        259.8
*ch3br       0.7          0.01            5.8      94.9
*ch3cl       1.3          0.01            480      50.45
*Adjusted 20160525 for stabilization
ch3br       0.7          0.01            6.4446   94.9
ch3cl       1.3          0.01            443.8139 50.45
;

*Fractional release values (rlsf) of stratospheric chlorine
*Follow MAGICC 6.0
set def_ccoef /ncl, nbr, rlsf/;

table def_sc3yr(mhalo,def_ccoef)
                ncl             nbr              rlsf
cfc11           3               0                1
cfc12           2               0                0.6
cfc113          3               0                0.75
cfc114          2               0                0.75
cfc115          1               0                0.75
ccl4            4               0                1.06
ch3ccl3         3               0                1.08
hcfc22           1               0                0.35
hcfc141b         2               0                0.72
hcfc142b         1               0                0.36
halon1211       1               1                1.10
halon1202       0               2                0.8
halon1301       0               1                0.8
halon2402       0               2                0.8
ch3br           0               1                1.08
ch3cl           1               0                1.08
;

parameter hf(fgs, def_hcoef);

*use magicc6 parameters as default
hf(fgs, def_hcoef) = def_hf_AR5(fgs, def_hcoef);
