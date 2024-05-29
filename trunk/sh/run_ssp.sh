# Scripts for running scenarios
# Reference scenarios

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ref O=ssp1_ref --ref=1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ref O=ssp2_ref --ref=1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ref O=ssp3_ref --ref=1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ref O=ssp4_ref --ref=1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ref O=ssp5_ref --ref=1

parallel --no-run-if-empty --ungroup eval 'gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen={1} gdx={1}_ref O={1}_ref --ref=1' ::: ssp1 ssp2 ssp3 ssp4 ssp5

# Optimal scenarios

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_opt O=ssp1_opt
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_opt O=ssp2_opt
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_opt O=ssp3_opt
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_opt O=ssp4_opt
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_opt O=ssp5_opt

parallel --no-run-if-empty --ungroup eval 'gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen={1} gdx={1}_opt O={1}_opt' ::: ssp1 ssp2 ssp3 ssp4 ssp5

# Validation running

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ctax100 O=ssp1_ctax100 --CLP=100
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ctax200 O=ssp1_ctax200 --CLP=200
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ctax300 O=ssp1_ctax300 --CLP=300
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ctax400 O=ssp1_ctax400 --CLP=400
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_ctax500 O=ssp1_ctax500 --CLP=500

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax100 O=ssp2_ctax100 --CLP=100
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax200 O=ssp2_ctax200 --CLP=200
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax300 O=ssp2_ctax300 --CLP=300
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax400 O=ssp2_ctax400 --CLP=400
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax500 O=ssp2_ctax500 --CLP=500

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ctax100 O=ssp3_ctax100 --CLP=100
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ctax200 O=ssp3_ctax200 --CLP=200
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ctax300 O=ssp3_ctax300 --CLP=300
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ctax400 O=ssp3_ctax400 --CLP=400
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_ctax500 O=ssp3_ctax500 --CLP=500

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ctax100 O=ssp4_ctax100 --CLP=100
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ctax200 O=ssp4_ctax200 --CLP=200
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ctax300 O=ssp4_ctax300 --CLP=300
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ctax400 O=ssp4_ctax400 --CLP=400
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_ctax500 O=ssp4_ctax500 --CLP=500

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ctax100 O=ssp5_ctax100 --CLP=100
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ctax200 O=ssp5_ctax200 --CLP=200
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ctax300 O=ssp5_ctax300 --CLP=300
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ctax400 O=ssp5_ctax400 --CLP=400
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_ctax500 O=ssp5_ctax500 --CLP=500

parallel --no-run-if-empty --ungroup eval 'gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_ctax{1} O=ssp2_ctax{1} --CLP={1}' ::: 100 200 300 400 500

# Using DICE2023 damages

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_opt_d2023 O=ssp1_opt_d2023 --dmg=dice2023
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_opt_d2023 O=ssp2_opt_d2023 --dmg=dice2023
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_opt_d2023 O=ssp3_opt_d2023 --dmg=dice2023
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_opt_d2023 O=ssp4_opt_d2023 --dmg=dice2023
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_opt_d2023 O=ssp5_opt_d2023 --dmg=dice2023

parallel --no-run-if-empty --ungroup eval 'gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen={1} gdx={1}_opt_d2023 O={1}_opt_d2023 --dmg=dice2023' ::: ssp1 ssp2 ssp3 ssp4 ssp5

# Solely CO2 running

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 --only_abate_co2=1 gdx=ssp1_co2 O=ssp1_co2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 --only_abate_co2=1 gdx=ssp2_co2 O=ssp2_co2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 --only_abate_co2=1 gdx=ssp3_co2 O=ssp3_co2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 --only_abate_co2=1 gdx=ssp4_co2 O=ssp4_co2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 --only_abate_co2=1 gdx=ssp5_co2 O=ssp5_co2

parallel --no-run-if-empty --ungroup eval 'gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen={1} --only_abate_co2=1 gdx={1}_co2 O={1}_co2' ::: ssp1 ssp2 ssp3 ssp4 ssp5

# Sensitivity test of indicators affecting optimization scenarios

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_mac1 O=ssp1_use_mac1 --use_mac=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_mac2 O=ssp1_use_mac2 --use_mac=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_mac3 O=ssp1_use_mac3 --use_mac=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_mac4 O=ssp1_use_mac4 --use_mac=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_mac5 O=ssp1_use_mac5 --use_mac=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_mac1 O=ssp2_use_mac1 --use_mac=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_mac2 O=ssp2_use_mac2 --use_mac=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_mac3 O=ssp2_use_mac3 --use_mac=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_mac4 O=ssp2_use_mac4 --use_mac=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_mac5 O=ssp2_use_mac5 --use_mac=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_mac1 O=ssp3_use_mac1 --use_mac=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_mac2 O=ssp3_use_mac2 --use_mac=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_mac3 O=ssp3_use_mac3 --use_mac=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_mac4 O=ssp3_use_mac4 --use_mac=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_mac5 O=ssp3_use_mac5 --use_mac=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_mac1 O=ssp4_use_mac1 --use_mac=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_mac2 O=ssp4_use_mac2 --use_mac=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_mac3 O=ssp4_use_mac3 --use_mac=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_mac4 O=ssp4_use_mac4 --use_mac=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_mac5 O=ssp4_use_mac5 --use_mac=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_mac1 O=ssp5_use_mac1 --use_mac=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_mac2 O=ssp5_use_mac2 --use_mac=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_mac3 O=ssp5_use_mac3 --use_mac=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_mac4 O=ssp5_use_mac4 --use_mac=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_mac5 O=ssp5_use_mac5 --use_mac=ssp5

# #################################################################

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_pop1 O=ssp1_use_pop1 --use_pop=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_pop2 O=ssp1_use_pop2 --use_pop=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_pop3 O=ssp1_use_pop3 --use_pop=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_pop4 O=ssp1_use_pop4 --use_pop=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_pop5 O=ssp1_use_pop5 --use_pop=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_pop1 O=ssp2_use_pop1 --use_pop=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_pop2 O=ssp2_use_pop2 --use_pop=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_pop3 O=ssp2_use_pop3 --use_pop=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_pop4 O=ssp2_use_pop4 --use_pop=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_pop5 O=ssp2_use_pop5 --use_pop=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_pop1 O=ssp3_use_pop1 --use_pop=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_pop2 O=ssp3_use_pop2 --use_pop=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_pop3 O=ssp3_use_pop3 --use_pop=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_pop4 O=ssp3_use_pop4 --use_pop=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_pop5 O=ssp3_use_pop5 --use_pop=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_pop1 O=ssp4_use_pop1 --use_pop=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_pop2 O=ssp4_use_pop2 --use_pop=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_pop3 O=ssp4_use_pop3 --use_pop=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_pop4 O=ssp4_use_pop4 --use_pop=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_pop5 O=ssp4_use_pop5 --use_pop=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_pop1 O=ssp5_use_pop1 --use_pop=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_pop2 O=ssp5_use_pop2 --use_pop=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_pop3 O=ssp5_use_pop3 --use_pop=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_pop4 O=ssp5_use_pop4 --use_pop=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_pop5 O=ssp5_use_pop5 --use_pop=ssp5

# #################################################################

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_gdp1 O=ssp1_use_gdp1 --use_gdp=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_gdp2 O=ssp1_use_gdp2 --use_gdp=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_gdp3 O=ssp1_use_gdp3 --use_gdp=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_gdp4 O=ssp1_use_gdp4 --use_gdp=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_use_gdp5 O=ssp1_use_gdp5 --use_gdp=ssp5


gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_gdp1 O=ssp2_use_gdp1 --use_gdp=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_gdp2 O=ssp2_use_gdp2 --use_gdp=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_gdp3 O=ssp2_use_gdp3 --use_gdp=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_gdp4 O=ssp2_use_gdp4 --use_gdp=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_use_gdp5 O=ssp2_use_gdp5 --use_gdp=ssp5


gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_gdp1 O=ssp3_use_gdp1 --use_gdp=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_gdp2 O=ssp3_use_gdp2 --use_gdp=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_gdp3 O=ssp3_use_gdp3 --use_gdp=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_gdp4 O=ssp3_use_gdp4 --use_gdp=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_use_gdp5 O=ssp3_use_gdp5 --use_gdp=ssp5


gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_gdp1 O=ssp4_use_gdp1 --use_gdp=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_gdp2 O=ssp4_use_gdp2 --use_gdp=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_gdp3 O=ssp4_use_gdp3 --use_gdp=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_gdp4 O=ssp4_use_gdp4 --use_gdp=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_use_gdp5 O=ssp4_use_gdp5 --use_gdp=ssp5

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_gdp1 O=ssp5_use_gdp1 --use_gdp=ssp1
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_gdp2 O=ssp5_use_gdp2 --use_gdp=ssp2
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_gdp3 O=ssp5_use_gdp3 --use_gdp=ssp3
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_gdp4 O=ssp5_use_gdp4 --use_gdp=ssp4
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_use_gdp5 O=ssp5_use_gdp5 --use_gdp=ssp5

################################################################################################

# Impacts of climate sensitivity

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs20 O=ssp1_cs20 --clim_sensi=2.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs25 O=ssp1_cs25 --clim_sensi=2.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs35 O=ssp1_cs35 --clim_sensi=3.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs40 O=ssp1_cs40 --clim_sensi=4.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs45 O=ssp1_cs45 --clim_sensi=4.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp1 gdx=ssp1_cs50 O=ssp1_cs50 --clim_sensi=5.0

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs20 O=ssp2_cs20 --clim_sensi=2.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs25 O=ssp2_cs25 --clim_sensi=2.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs35 O=ssp2_cs35 --clim_sensi=3.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs40 O=ssp2_cs40 --clim_sensi=4.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs45 O=ssp2_cs45 --clim_sensi=4.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp2 gdx=ssp2_cs50 O=ssp2_cs50 --clim_sensi=5.0

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs20 O=ssp3_cs20 --clim_sensi=2.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs25 O=ssp3_cs25 --clim_sensi=2.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs35 O=ssp3_cs35 --clim_sensi=3.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs40 O=ssp3_cs40 --clim_sensi=4.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs45 O=ssp3_cs45 --clim_sensi=4.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp3 gdx=ssp3_cs50 O=ssp3_cs50 --clim_sensi=5.0

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs20 O=ssp4_cs20 --clim_sensi=2.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs25 O=ssp4_cs25 --clim_sensi=2.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs35 O=ssp4_cs35 --clim_sensi=3.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs40 O=ssp4_cs40 --clim_sensi=4.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs45 O=ssp4_cs45 --clim_sensi=4.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp4 gdx=ssp4_cs50 O=ssp4_cs50 --clim_sensi=5.0

gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs20 O=ssp5_cs20 --clim_sensi=2.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs25 O=ssp5_cs25 --clim_sensi=2.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs35 O=ssp5_cs35 --clim_sensi=3.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs40 O=ssp5_cs40 --clim_sensi=4.0
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs45 O=ssp5_cs45 --clim_sensi=4.5
gams ../trunk/gms/scm4eco Wdir=./exe MaxProcDir=100000 --scen=ssp5 gdx=ssp5_cs50 O=ssp5_cs50 --clim_sensi=5.0