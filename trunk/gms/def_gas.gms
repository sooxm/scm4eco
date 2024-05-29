*Emission definitions

*All anthropogenic emissions
set            all_gas      eimissions                   /
*Anthropogenic emissions from industrial and land use sources
                                                       co2
                                                       ch4
                                                       n2o
                                                       so2
                                                       co
                                                       voc
                                                       nox
                                                       bc
                                                       oc
                                                       nh3

                                                       hfc23
                                                       hfc32
                                                       hfc125
                                                       hfc134a
                                                       hfc143a
                                                       hfc152a
                                                       hfc227ea
                                                       hfc236fa
                                                       hfc245fa
                                                       hfc365mfc
                                                       hfc4310mee

                                                      hfc134
                                                      hfc143
                                                      hfc41

                                                       sf6
                                                       nf3
                                                       cf4
                                                       c2f6
                                                       c3f8
                                                       cc4f8
                                                       c4f10
                                                       c5f12
                                                       c6f14
                                                      c7f16

                                                       cfc11
                                                       cfc12
                                                       cfc113
                                                       cfc114
                                                       cfc115
                                                       ccl4
                                                       ch3ccl3
                                                       hcfc22
                                                       hcfc141b
                                                       hcfc142b
                                                       halon1211
                                                       halon1202
                                                       halon1301
                                                       halon2402
                                                       ch3br
                                                       ch3cl
*Anthropogenic emissions from industrial sources
                                                       co2i
                                                       co2n
                                                       ch4i
                                                       n2oi
                                                       so2i
                                                       coi
                                                       voci
                                                       noxi
                                                       bci
                                                       oci
                                                       nh3i

                                                       hfc23i
                                                       hfc32i
                                                       hfc125i
                                                       hfc134ai
                                                       hfc143ai
                                                       hfc152ai
                                                       hfc227eai
                                                       hfc236fai
                                                       hfc245fai
                                                       hfc365mfci
                                                       hfc4310meei

                                                      hfc134i
                                                      hfc143i
                                                      hfc41i

                                                       sf6i
                                                       nf3i
                                                       cf4i
                                                       c2f6i
                                                       c3f8i
                                                       cc4f8i
                                                       c4f10i
                                                       c5f12i
                                                       c6f14i
                                                      c7f16i

                                                       cfc11i
                                                       cfc12i
                                                       cfc113i
                                                       cfc114i
                                                       cfc115i
                                                       ccl4i
                                                       ch3ccl3i
                                                       hcfc22i
                                                       hcfc141bi
                                                       hcfc142bi
                                                       halon1211i
                                                       halon1202i
                                                       halon1301i
                                                       halon2402i
                                                       ch3bri
                                                       ch3cli
*Anthropogenic emissions from land use sources
                                                       co2l
                                                       ch4l
                                                       n2ol
                                                       so2l
                                                       col
                                                       vocl
                                                       noxl
                                                       bcl
                                                       ocl
                                                       nh3l

                                                       hfc23l
                                                       hfc32l
                                                       hfc125l
                                                       hfc134al
                                                       hfc143al
                                                       hfc152al
                                                       hfc227eal
                                                       hfc236fal
                                                       hfc245fal
                                                       hfc365mfcl
                                                       hfc4310meel
                                                      hfc134l
                                                      hfc143l
                                                      hfc41l
                                                       sf6l
                                                       nf3l
                                                       cf4l
                                                       c2f6l
                                                       c3f8l
                                                       cc4f8l
                                                       c4f10l
                                                       c5f12l
                                                       c6f14l
                                                      c7f16l

                                                       cfc11l
                                                       cfc12l
                                                       cfc113l
                                                       cfc114l
                                                       cfc115l
                                                       ccl4l
                                                       ch3ccl3l
                                                       hcfc22l
                                                       hcfc141bl
                                                       hcfc142bl
                                                       halon1211l
                                                       halon1202l
                                                       halon1301l
                                                       halon2402l
                                                       ch3brl
                                                       ch3cll
                                                         /;

*Anthropogenic emissions from industrial and land use sources
set            gas(all_gas)      eimissions              /
*Anthropogenic emissions from industrial and land use sources
                                                       co2
                                                       ch4
                                                       n2o
                                                       so2
                                                       co
                                                       voc
                                                       nox
                                                       bc
                                                       oc
                                                       nh3

                                                       hfc23
                                                       hfc32
                                                       hfc125
                                                       hfc134a
                                                       hfc143a
                                                       hfc152a
                                                       hfc227ea
                                                       hfc236fa
                                                       hfc245fa
                                                       hfc365mfc
                                                       hfc4310mee
                                                      hfc134
                                                      hfc143
                                                      hfc41

                                                       sf6
                                                       nf3
                                                       cf4
                                                       c2f6
                                                       c3f8
                                                       cc4f8
                                                       c4f10
                                                       c5f12
                                                       c6f14
                                                      c7f16

                                                       cfc11
                                                       cfc12
                                                       cfc113
                                                       cfc114
                                                       cfc115
                                                       ccl4
                                                       ch3ccl3
                                                       hcfc22
                                                       hcfc141b
                                                       hcfc142b
                                                       halon1211
                                                       halon1202
                                                       halon1301
                                                       halon2402
                                                       ch3br
                                                       ch3cl
                                                         /;

set        gas_nonf(gas)                             /
                                                          co2
                                                          ch4
                                                          n2o
                                                          so2
                                                          co
                                                          voc
                                                          nox
                                                          bc
                                                          oc
                                                          nh3
                                                         /;

set        gas_noncf(gas_nonf)        other eimissions             /
                                                          ch4
                                                          n2o
                                                          so2
                                                          co
                                                          voc
                                                          nox
                                                          bc
                                                          oc
                                                          nh3
                                                          /;

set        gas_co2(gas_nonf)        co2 eimissions       /
                                                          co2
                                                          /;
                                                          
set        gas_ch4(gas_nonf)        ch4 eimissions       /
                                                        ch4
/;

set        gas_3ghg(gas_nonf)        other eimissions     /
                                                          co2
                                                          ch4
                                                          n2o
                                                          /;

set        gas_aero(gas_nonf)                             /
                                                          so2
                                                          co
                                                          voc
                                                          nox
                                                          bc
                                                          oc
                                                          nh3
                                                         /;

set            fgs(gas)      eimissions              /
                                                       hfc23
                                                       hfc32
                                                       hfc125
                                                       hfc134a
                                                       hfc143a
                                                       hfc152a
                                                       hfc227ea
                                                       hfc236fa
                                                       hfc245fa
                                                       hfc365mfc
                                                       hfc4310mee
                                                      hfc134
                                                      hfc143
                                                      hfc41

                                                       sf6
                                                       nf3
                                                       cf4
                                                       c2f6
                                                       c3f8
                                                       cc4f8
                                                       c4f10
                                                       c5f12
                                                       c6f14
                                                      c7f16

                                                       cfc11
                                                       cfc12
                                                       cfc113
                                                       cfc114
                                                       cfc115
                                                       ccl4
                                                       ch3ccl3
                                                       hcfc22
                                                       hcfc141b
                                                       hcfc142b
                                                       halon1211
                                                       halon1202
                                                       halon1301
                                                       halon2402
                                                       ch3br
                                                       ch3cl
                                                       /;

set fgs_hfc(fgs) /hfc23,hfc32,hfc125,hfc134a,hfc143a,hfc152a,hfc227ea,hfc236fa,hfc245fa,hfc365mfc,hfc4310mee,hfc134,hfc143,hfc41/;

set fgs_pfc(fgs) /sf6,nf3,cf4,c2f6,c3f8,cc4f8,c4f10,c5f12,c6f14,c7f16/;


set fgs_ods(fgs) /cfc11,cfc12,cfc113,cfc114,cfc115,ccl4,ch3ccl3,hcfc22,hcfc141b,hcfc142b,halon1211,halon1202,halon1301,halon2402,ch3br,ch3cl/;

set fgs_cfc(fgs) /cfc11,cfc12,cfc113,cfc114,cfc115/;

*Kyoto gas emissions
set        gas_kyoto(all_gas)                            /
                                                          co2i
                                                          ch4i
                                                          n2oi

                                                          co2l
                                                          ch4l
                                                          n2ol

                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                         /;

*Emissions excluding halogenated gases


*Anthropogenic emissions from industrial sources
set        gas_ind(all_gas)      eimissions              /
                                                          co2i
                                                          ch4i
                                                          n2oi
                                                          so2i
                                                          coi
                                                          voci
                                                          noxi
                                                          bci
                                                          oci
                                                          nh3i
                                                          cf4i
                                                          c2f6i
                                                          c6f14i
                                                          hfc23i
                                                          hfc32i
                                                          hfc4310meei
                                                          hfc125i
                                                          hfc134ai
                                                          hfc143ai
                                                          hfc227eai
                                                          hfc245fai
                                                          sf6i
                                                          cfc11i
                                                          cfc12i
                                                          cfc113i
                                                          cfc114i
                                                          cfc115i
                                                          ccl4i
                                                          ch3ccl3i
                                                          hcfc22i
                                                          hcfc141bi
                                                          hcfc142bi
                                                          halon1211i
                                                          halon1202i
                                                          halon1301i
                                                          halon2402i
                                                          ch3bri
                                                          ch3cli
                                                         /;

*Anthropogenic emissions from land use sources
set            gas_lnd(all_gas)      eimissions          /
                                                          co2l
                                                          ch4l
                                                          n2ol
                                                          so2l
                                                          col
                                                          vocl
                                                          noxl
                                                          bcl
                                                          ocl
                                                          nh3l
                                                          cf4l
                                                          c2f6l
                                                          c6f14l
                                                          hfc23l
                                                          hfc32l
                                                          hfc4310meel
                                                          hfc125l
                                                          hfc134al
                                                          hfc143al
                                                          hfc227eal
                                                          hfc245fal
                                                          sf6l
                                                          cfc11l
                                                          cfc12l
                                                          cfc113l
                                                          cfc114l
                                                          cfc115l
                                                          ccl4l
                                                          ch3ccl3l
                                                          hcfc22l
                                                          hcfc141bl
                                                          hcfc142bl
                                                          halon1211l
                                                          halon1202l
                                                          halon1301l
                                                          halon2402l
                                                          ch3brl
                                                          ch3cll
                                                         /;

*Emissions compatable to RCP definitions
set            rcp_gas(all_gas)      eimissions          /
                                                          co2i
                                                          co2l
                                                          ch4i
                                                          ch4l
                                                          n2oi
                                                          n2ol
                                                          so2i
                                                          so2l
                                                          coi
                                                          col
                                                          voci
                                                          vocl
                                                          noxi
                                                          noxl
                                                          bci
                                                          bcl
                                                          oci
                                                          ocl
                                                          nh3i
                                                          nh3l

                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;

set            cm5_gas(all_gas)      eimissions          /
                                                          co2i
                                                          co2l
                                                          ch4i
                                                          ch4l
                                                          n2oi
                                                          n2ol
                                                          so2i
                                                          so2l
                                                          coi
                                                          col
                                                          voci
                                                          vocl
                                                          noxi
                                                          noxl
                                                          bci
                                                          bcl
                                                          oci
                                                          ocl
                                                          nh3i
                                                          nh3l

                                                          hfc23
                                                          hfc32
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc152a
                                                          hfc227ea
                                                          hfc236fa
                                                          hfc245fa
                                                          hfc365mfc
                                                          hfc4310mee
                                                          hfc134
                                                          hfc143
                                                          hfc41

                                                          sf6
                                                          nf3
                                                          cf4
                                                          c2f6
                                                          c3f8
                                                          cc4f8
                                                          c4f10
                                                          c5f12
                                                          c6f14
                                                         c7f16

                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;

set            cm6_gas(all_gas)      eimissions          /
                                                          co2i
                                                          co2l
                                                          co2n
                                                          ch4i
                                                          ch4l
                                                          n2oi
                                                          n2ol
                                                          so2i
                                                          so2l
                                                          coi
                                                          col
                                                          voci
                                                          vocl
                                                          noxi
                                                          noxl
                                                          bci
                                                          bcl
                                                          oci
                                                          ocl
                                                          nh3i
                                                          nh3l

                                                          hfc23
                                                          hfc32
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc152a
                                                          hfc227ea
                                                          hfc236fa
                                                          hfc245fa
                                                          hfc365mfc
                                                          hfc4310mee

                                                          hfc134
                                                          hfc143
                                                          hfc41

                                                          sf6
                                                          nf3
                                                          cf4
                                                          c2f6
                                                          c3f8
                                                          cc4f8
                                                          c4f10
                                                          c5f12
                                                          c6f14
                                                         c7f16

                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;
*Industrial emissions compatable to RCP definitions
set            rcp_gas_ind(rcp_gas)      eimissions      /
                                                          co2i
                                                          ch4i
                                                          n2oi
                                                          so2i
                                                          coi
                                                          voci
                                                          noxi
                                                          bci
                                                          oci
                                                          nh3i
                                                         /;

*Land use emissions compatable to RCP definitions
set            rcp_gas_lnd(rcp_gas)      eimissions      /
                                                          co2l
                                                          ch4l
                                                          n2ol
                                                          so2l
                                                          col
                                                          vocl
                                                          noxl
                                                          bcl
                                                          ocl
                                                          nh3l
                                                         /;


*F-gases emissions compatable to RCP definitions
set            rcp_gas_fgs(rcp_gas)      eimissions      /
                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;

*Emissions excluding CO2
set        ogas(gas)        other eimissions             /
                                                          ch4
                                                          n2o
                                                          so2
                                                          co
                                                          voc
                                                          nox
                                                          bc
                                                          oc
                                                          nh3
                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;



*Aerosol emissions
set gh_aer(all_gas)                                      /
                                                          so2i
                                                          so2l
                                                          noxi
                                                          noxl
                                                          oci
                                                          ocl
                                                          bci
                                                          bcl
                                                          /;

*Three important GHGs
set ghg(all_gas)
                                                         /
                                                          co2
                                                          ch4
                                                          n2o
                                                          /;

*Two GHGs
set oghg(ghg)
                                                         /
                                                          ch4
                                                          n2o
                                                          /;

*All halogenated gases
set halo(fgs)                                           /
                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /
;

*All flourinated gases controlled under the Kyoto Protocol (HFCs, PFCs, SF6)
set khalo(fgs)                                           /
                                                          cf4
                                                          c2f6
                                                          c6f14
                                                          hfc23
                                                          hfc32
                                                          hfc4310mee
                                                          hfc125
                                                          hfc134a
                                                          hfc143a
                                                          hfc227ea
                                                          hfc245fa
                                                          sf6
                                                         /
;


*Montreal Protocol gases
set mhalo(fgs)                                        /
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                          ch3cl
                                                         /;

*Chlorine related to equivalent effective stratospheric chlorine (EESC)
set chlorine(mhalo)                                    /
                                                          cfc11
                                                          cfc12
                                                          cfc113
                                                          cfc114
                                                          cfc115
                                                          ccl4
                                                          ch3ccl3
                                                          hcfc22
                                                          hcfc141b
                                                          hcfc142b
                                                          ch3cl
                                                         /;

*Bromine related to equivalent effective stratospheric chlorine (EESC)
set bromine(mhalo)                                    /
                                                          halon1211
                                                          halon1202
                                                          halon1301
                                                          halon2402
                                                          ch3br
                                                         /;


*Units for emissions
acronyms
         GtCPerYr,
         MtCH4PerYr,
         MtN2O_NPerYr,
         MtSPerYr,
         MtCOPerYr,
         MtNPerYr,
         MtPerYr,
         MtNPerYr,
         ktPerYr
;

*Units for emissions in the simulations
parameter  gas_unit(all_gas)
/
     co2         GtCPerYr
     ch4         MtCH4PerYr
     n2o         MtN2O_NPerYr
     so2         MtSPerYr
     co          MtCOPerYr
     voc         MtPerYr
     nox         MtNPerYr
     bc          MtPerYr
     oc          MtPerYr
     nh3         MtNPerYr
     cf4         ktPerYr
     c2f6        ktPerYr
     c6f14       ktPerYr
     hfc23       ktPerYr
     hfc32       ktPerYr
     hfc4310mee     ktPerYr
     hfc125      ktPerYr
     hfc134a     ktPerYr
     hfc143a     ktPerYr
     hfc227ea    ktPerYr
     hfc245fa    ktPerYr
     sf6         ktPerYr
     cfc11       ktPerYr
     cfc12       ktPerYr
     cfc113      ktPerYr
     cfc114      ktPerYr
     cfc115      ktPerYr
     ccl4        ktPerYr
     ch3ccl3     ktPerYr
     hcfc22       ktPerYr
     hcfc141b     ktPerYr
     hcfc142b     ktPerYr
     halon1211   ktPerYr
     halon1202   ktPerYr
     halon1301   ktPerYr
     halon2402   ktPerYr
     ch3br       ktPerYr
     ch3cl       ktPerYr

     co2i        GtCPerYr
     ch4i        MtCH4PerYr
     n2oi        MtN2O_NPerYr
     so2i        MtSPerYr
     coi         MtCOPerYr
     voci        MtPerYr
     noxi        MtNPerYr
     bci         MtPerYr
     oci         MtPerYr
     nh3i        MtNPerYr
     cf4i        ktPerYr
     c2f6i       ktPerYr
     c6f14i      ktPerYr
     hfc23i      ktPerYr
     hfc32i      ktPerYr
     hfc4310meei ktPerYr
     hfc125i     ktPerYr
     hfc134ai    ktPerYr
     hfc143ai    ktPerYr
     hfc227eai   ktPerYr
     hfc245fai   ktPerYr
     sf6i        ktPerYr
     cfc11i      ktPerYr
     cfc12i      ktPerYr
     cfc113i     ktPerYr
     cfc114i     ktPerYr
     cfc115i     ktPerYr
     ccl4i       ktPerYr
     ch3ccl3i    ktPerYr
     hcfc22i      ktPerYr
     hcfc141bi    ktPerYr
     hcfc142bi    ktPerYr
     halon1211i  ktPerYr
     halon1202i  ktPerYr
     halon1301i  ktPerYr
     halon2402i  ktPerYr
     ch3bri      ktPerYr
     ch3cli      ktPerYr

     co2l        GtCPerYr
     ch4l        MtCH4PerYr
     n2ol        MtN2O_NPerYr
     so2l        MtSPerYr
     col         MtCOPerYr
     vocl        MtPerYr
     noxl        MtNPerYr
     bcl         MtPerYr
     ocl         MtPerYr
     nh3l        MtNPerYr
     cf4l        ktPerYr
     c2f6l       ktPerYr
     c6f14l      ktPerYr
     hfc23l      ktPerYr
     hfc32l      ktPerYr
     hfc4310meel ktPerYr
     hfc125l     ktPerYr
     hfc134al    ktPerYr
     hfc143al    ktPerYr
     hfc227eal   ktPerYr
     hfc245fal   ktPerYr
     sf6l        ktPerYr
     cfc11l      ktPerYr
     cfc12l      ktPerYr
     cfc113l     ktPerYr
     cfc114l     ktPerYr
     cfc115l     ktPerYr
     ccl4l       ktPerYr
     ch3ccl3l    ktPerYr
     hcfc22l      ktPerYr
     hcfc141bl    ktPerYr
     hcfc142bl    ktPerYr
     halon1211l  ktPerYr
     halon1202l  ktPerYr
     halon1301l  ktPerYr
     halon2402l  ktPerYr
     ch3brl      ktPerYr
     ch3cll      ktPerYr

/
;
