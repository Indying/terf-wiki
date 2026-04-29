#decide which reactor component should need maintenance
execute store result score component terf_states run random value 0..6
execute if score component terf_states matches 0 run function terf:entity/machines/stfr/maintenance/add_case_relative
execute if score component terf_states matches 1..6 run function terf:entity/machines/stfr/maintenance/add_stabilizer_relative
