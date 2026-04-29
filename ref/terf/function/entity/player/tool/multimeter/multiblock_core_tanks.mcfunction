#execute unless data storage datapipes_lib:temp args.array[0].id run return run tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"text":" empty","color":"gold"}]

data modify storage terf:temp args set value {id:empty,amount:0,max:0,temperature:0}
data modify storage terf:temp args.id set string storage datapipes_lib:temp args.array[0].id 16
data modify storage terf:temp args.color set string storage datapipes_lib:temp args.array[0].id 0 6
data modify storage terf:temp args.amount set from storage datapipes_lib:temp args.array[0].amount
data modify storage terf:temp args.max set from storage datapipes_lib:temp args.array[0].max
data modify storage terf:temp args.temperature set string storage datapipes_lib:temp args.array[0].id 11 14

$execute unless data storage terf:constants fluid_dictionary.$(id) run tellraw @a[distance=..6,tag=terf_currententity] [{"text":"[Multimeter]","color":"green"},{"text":" $(id)","color":"gold"},{"text":" | Amount: ","color":"yellow"},{"text":"$(amount)/$(max)","color":"gold"},{"text":" | ","color":"yellow"},{"text":"No Dict. Data!","color":"red"}]

$data modify storage terf:temp args set from storage terf:constants fluid_dictionary.$(id)
data modify storage terf:temp args merge from storage terf:temp temp[0]
data modify storage terf:temp args.temp set from storage terf:temp args.temperature
function terf:entity/player/tool/multimeter/tank_message with storage terf:temp args

data remove storage terf:temp temp[0]
execute if data storage terf:temp temp[0] run function terf:entity/player/tool/multimeter/multiblock_core_tanks with storage terf:temp temp[0]
