execute as @s[tag=terf_stfr,tag=!terf_coreexploding] at @s run function terf:entity/machines/mainframe/check_stfr_logic_cables

data modify storage terf:temp args set value {arg1:"execute if block ",arg3:" red_glazed_terracotta run function terf:entity/machines/mainframe/add_id"}
data modify storage terf:temp args.arg2 set from entity @s data.terf.mainframe_logistics.config.input_coords
function datapipes_lib:require/with_args/3 with storage terf:temp args