scoreboard players set multimeter_block_in_sight terf_states 1
particle minecraft:electric_spark ~ ~ ~ 1 0 0 0 100 force
particle minecraft:electric_spark ~ ~ ~ 0 1 0 0 100 force
particle minecraft:electric_spark ~ ~ ~ 0 0 1 0 100 force

#measure power
execute if score @s datapipes_lib_power_max = @s datapipes_lib_power_max run tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"text":" Power Stored: ","color":"yellow"},{"score":{"name":"@s","objective":"datapipes_lib_power_storage"},"color":"gold"},{"text":"/","color":"yellow"},{"score":{"name":"@s","objective":"datapipes_lib_power_max"},"color":"gold"},{"text":" MWt","color":"yellow"}]

#measure fluids
execute if data entity @s data.fluids run tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter] ","color":"green"},{"text":"Fluid tanks:","color":"yellow","underlined":true}]
data modify storage terf:temp temp set from entity @s data.fluids
function terf:entity/player/tool/multimeter/multiblock_core_tanks with storage terf:temp temp[0]

#measure security config
data modify storage terf:temp args set value {arg1:'tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"color":"aqua","text":" Security Whitelist:"},{"color":"dark_aqua","text":"',arg2:'"}]'}
data modify storage datapipes_lib:temp args.array set from entity @s data.terf.security_config
data modify storage datapipes_lib:temp args.command set value "function terf:entity/player/tool/multimeter/multiblock_core_security"
function datapipes_lib:require/as_all_array_values with storage datapipes_lib:temp args
execute if data entity @s data.terf.security_config run function datapipes_lib:require/with_args/2 with storage terf:temp args

#measure errors
data modify storage terf:temp args set value {arg1:'tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"text":" Error Code: ","color":"#FF0000"},{"text":"',arg3:'","color":"red"}]'}
data modify storage terf:temp args.arg2 set from entity @s data.terf.error
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute unless score @s datapipes_lib_power_max = @s datapipes_lib_power_max unless data entity @s data.fluids unless data entity @s data.terf.security_config unless data entity @s data.terf.error run tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"text":" No data was found on this machine!","color":"red"}]
