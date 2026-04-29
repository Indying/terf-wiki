execute store result storage terf:temp args2.pitch float 0.1 run random value -1800..1800
execute store result storage terf:temp args2.yaw float 0.1 run random value -900..900

$scoreboard players set max_splits terf_states $(max_splits)
$data modify storage terf:temp args set value {splitp:"$(splitp)",contp:"$(contp)",particle:"particle minecraft:electric_spark ~ ~ ~ 0 0 0 0 1 force"}
data modify storage terf:temp args2.command set value 'function terf:require/lightning_split'

function datapipes_lib:require/run_rotated with storage terf:temp args2
