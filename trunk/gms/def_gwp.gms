*GWP100 from AR4
parameter def_gwp100_ar4(all_gas)
/
co2              1
co2i             1
co2l             1
ch4              25
ch4i             25
ch4l             25
n2o              298
n2oi             298
n2ol             298
*so2
*so2i
*so2b
*co
*nmvoc
*nox
*noxi
*noxb
*bc
*bci
*bcb
*oc
*oci
*ocb
*nh3
cf4               7390
c2f6              12200
c6f14             9300
hfc23             14800
hfc32             675
hfc125            3500
hfc134a           1430
hfc143a           4470
hfc227ea          3220
hfc245fa          1030
sf6               22800
cfc11             4750
cfc12             10900
cfc113            6130
cfc114            10000
cfc115            7370
ccl4              1400
ch3ccl3           146
hcfc22             1810
hcfc141b           725
hcfc142b           2310
halon1211         1890
halon1202         0
halon1301         7140
halon2402         1640
ch3br             5
ch3cl             13

cf4i               7390
c2f6i              12200
c6f14i             9300
hfc23i             14800
hfc32i             675
hfc125i            3500
hfc134ai           1430
hfc143ai           4470
hfc227eai          3220
hfc245fai          1030
sf6i               22800
cfc11i             4750
cfc12i             10900
cfc113i            6130
cfc114i            10000
cfc115i            7370
ccl4i              1400
ch3ccl3i           146
hcfc22i             1810
hcfc141bi           725
hcfc142bi           2310
halon1211i         1890
halon1202i         0
halon1301i         7140
halon2402i         1640
ch3bri             5
ch3cli             13

cf4l               7390
c2f6l              12200
c6f14l             9300
hfc23l             14800
hfc32l             675
hfc125l            3500
hfc134al           1430
hfc143al           4470
hfc227eal          3220
hfc245fal          1030
sf6l               22800
cfc11l             4750
cfc12l             10900
cfc113l            6130
cfc114l            10000
cfc115l            7370
ccl4l              1400
ch3ccl3l           146
hcfc22l             1810
hcfc141bl           725
hcfc142bl           2310
halon1211l         1890
halon1202l         0
halon1301l         7140
halon2402l         1640
ch3brl             5
ch3cll             13
/
;

*GWP100 from MAGICC 6.0
parameter def_gwp100_mgc6(all_gas)
/
co2              1
co2i             1
co2l             1
ch4              21
ch4i             21
ch4l             21
n2o              310
n2oi             310
n2ol             310
*so2
*so2i
*so2b
*co
*nmvoc
*nox
*noxi
*noxb
*bc
*bci
*bcb
*oc
*oci
*ocb
*nh3
hfc23             12400
hfc32             677
hfc125            3170
hfc134a           1300
hfc143a           4800
hfc152a           140
hfc227ea          3350
hfc236fa          6300
hfc245fa          858
hfc365mfc         804
hfc4310mee        1300

hfc134              1120
hfc143              328
hfc41               116

sf6               23500
nf3               16100
cf4               6630
c2f6              11100
c3f8              7000
cc4f8             8700
c4f10             7000
c5f12             7500
c6f14             7910
c7f16             7820

cfc11             4660
cfc12             10200
cfc113            5820
cfc114            8590
cfc115            7670
ccl4              1730
ch3ccl3           160
hcfc22            1760
hcfc141b          782
hcfc142b          1980
halon1211         1750
halon1202         231
halon1301         6290
halon2402         1470
ch3br             2
ch3cl             12

hfc23i             12400
hfc32i             677
hfc125i            3170
hfc134ai           1300
hfc143ai           4800
hfc152ai           140
hfc227eai          3350
hfc236fai          6300
hfc245fai          858
hfc365mfci         804
hfc4310meei        1300
hfc134i              1120
hfc143i              328
hfc41i               116

sf6i               23500
nf3i               16100
cf4i               6630
c2f6i              11100
c3f8i              7000
cc4f8i             8700
c4f10i             7000
c5f12i             7500
c6f14i             7910
c7f16i             7820

cfc11i             4660
cfc12i             10200
cfc113i            5820
cfc114i            8590
cfc115i            7670
ccl4i              1730
ch3ccl3i           160
hcfc22i            1760
hcfc141bi         782
hcfc142bi          1980
halon1211i         1750
halon1202i         231
halon1301i         6290
halon2402i         1470
ch3bri             2
ch3cli             12

hfc23l             12400
hfc32l             677
hfc125l            3170
hfc134al           1300
hfc143al           4800
hfc152al           140
hfc227eal          3350
hfc236fal          6300
hfc245fal          858
hfc365mfcl         804
hfc4310meel        1300
hfc134l              1120
hfc143l              328
hfc41l               116

sf6l               23500
nf3l               16100
cf4l              6630
c2f6l              11100
c3f8l              7000
cc4f8l             8700
c4f10l            7000
c5f12l             7500
c6f14l             7910
c7f16l             7820

cfc11l             4660
cfc12l             10200
cfc113l            5820
cfc114l            8590
cfc115l            7670
ccl4l              1730
ch3ccl3l           160
hcfc22l            1760
hcfc141bl          782
hcfc142bl          1980
halon1211l         1750
halon1202l         231
halon1301l         6290
halon2402l         1470
ch3brl             2
ch3cll             12
/
;

*Fuglestved 2010, Transport impacts on atmosphere and climate: Metrics
*Average for 3 inventories
parameter def_gwp100_so2_indir /-357/;

*GWP100 from AR5
*Halo gases only direct effects
parameter def_gwp100_ar5_ems(gas)
/
co2              1
*CH4 consider both direct and indirect effects
* includes indirect effects from enhancements of ozone and stratospheric water vapour
*take the average
ch4              29
n2o              265
*Fuglestvedt, J. S., et al., 2010: Transport impacts on atmosphere and climate: Metrics.
*The effects of aerosols on clouds (and in the case of black carbon, on surface albedo) are not included.
*All sulphur values are on SO2 basis
* so2              -40
* co               2.65
* voc              4.5
*NOX on a per kilogram of nitrogen basis
* nox              -11
*BC on carbon basis
* bc               460
*OC on organic carbon basis
* oc               -69
* nh3              0

hfc23             12400
hfc32             677
hfc125            3170
hfc134a           1300
hfc143a           4800
hfc152a           140
hfc227ea          3350
hfc236fa          6300
hfc245fa          858
hfc365mfc         804
hfc4310mee        1300
hfc134              1120
hfc143              328
hfc41               116

sf6               23500
nf3               16100
cf4               6630
c2f6              11100
c3f8              7000
cc4f8             8700
c4f10             7000
c5f12             7500
c6f14             7910
c7f16             7820

cfc11             4660
cfc12             10200
cfc113            5820
cfc114            8590
cfc115            7670
ccl4              1730
ch3ccl3           160
hcfc22            1760
hcfc141b          782
hcfc142b          1980
halon1211         1750
halon1202         231
halon1301         6290
halon2402         1470
ch3br             2
ch3cl             12
/
;

*GWP100 from AR5, industrial sources
parameter def_gwp100_ar5_eind(gas)
/
co2             1
*CH4 consider both direct and indirect effects
* includes indirect effects from enhancements of ozone and stratospheric water vapour
*take the average
ch4             30
n2o             265
*Fuglestvedt, J. S., et al., 2010: Transport impacts on atmosphere and climate: Metrics.
*The effects of aerosols on clouds (and in the case of black carbon, on surface albedo) are not included.
*All sulphur values are on SO2 basis
* so2             -40
* co              2.65
* voc             4.5
*NOX on a per kilogram of nitrogen basis
* nox             -11
*BC on carbon basis
* bc              460
*OC on organic carbon basis
* oc              -69
* nh3              0

hfc23             12400
hfc32             677
hfc125            3170
hfc134a           1300
hfc143a           4800
hfc152a           140
hfc227ea          3350
hfc236fa          6300
hfc245fa          858
hfc365mfc         804
hfc4310mee        1300

hfc134              1120
hfc143              328
hfc41               116

sf6               23500
nf3               16100
cf4               6630
c2f6              11100
c3f8              7000
cc4f8             8700
c4f10             7000
c5f12             7500
c6f14             7910
c7f16             7820

cfc11             4660
cfc12             10200
cfc113            5820
cfc114            8590
cfc115            7670
ccl4              1730
ch3ccl3           160
hcfc22            1760
hcfc141b          782
hcfc142b          1980
halon1211         1750
halon1202         231
halon1301         6290
halon2402         1470
ch3br             2
ch3cl             12
/
;

*GWP100 from AR5, land use sources
parameter def_gwp100_ar5_elnd(gas)
/
co2             1
*CH4 consider both direct and indirect effects
* includes indirect effects from enhancements of ozone and stratospheric water vapour
*take the average
ch4             28
n2o             265
*Fuglestvedt, J. S., et al., 2010: Transport impacts on atmosphere and climate: Metrics.
*The effects of aerosols on clouds (and in the case of black carbon, on surface albedo) are not included.
*All sulphur values are on SO2 basis
* so2             -40
* co              2.65
* voc             4.5
*NOX on a per kilogram of nitrogen basis
* nox             -11
*BC on carbon basis
* bc              460
*OC on organic carbon basis
* oc              -69
* nh3              0

hfc23             12400
hfc32             677
hfc125            3170
hfc134a           1300
hfc143a           4800
hfc152a           140
hfc227ea          3350
hfc236fa          6300
hfc245fa          858
hfc365mfc         804
hfc4310mee        1300
hfc134              1120
hfc143              328
hfc41               116

sf6               23500
nf3               16100
cf4               6630
c2f6              11100
c3f8              7000
cc4f8             8700
c4f10             7000
c5f12             7500
c6f14             7910
c7f16             7820

cfc11             4660
cfc12             10200
cfc113            5820
cfc114            8590
cfc115            7670
ccl4              1730
ch3ccl3           160
hcfc22            1760
hcfc141b          782
hcfc142b          1980
halon1211         1750
halon1202         231
halon1301         6290
halon2402         1470
ch3br             2
ch3cl             12
/
;
*GWP100 for halogenated gases
*WMO, 2011: Scientific Assessment of Ozone Depletion: 2010. Table 5A-4
*IPCC AR5 Table 8.A.2
parameter def_gwp100_ar5_mhalo(mhalo)
/
cfc11              -2640
cfc12              -2100
cfc113             -2150
cfc114             -914
cfc115             -223
ccl4               -2110
ch3ccl3            -319
hcfc22              -98
hcfc141b            -261
hcfc142b            -152
halon1211          -19000
halon1202          0
halon1301          -44500
halon2402          -32000
ch3br              -1250
ch3cl              0
/;