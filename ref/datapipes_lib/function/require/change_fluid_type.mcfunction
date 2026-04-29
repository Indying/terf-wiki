$data modify storage datapipes_lib:temp args set from entity @s data.fluids[$(tank)]
execute unless data storage datapipes_lib:temp args.changetype run return fail

scoreboard players set error datapipes_lib 0

$data modify storage datapipes_lib:temp args.new_id set value '$(id)'
function datapipes_lib:require/change_fluid_type_args with storage datapipes_lib:temp args
execute unless score error datapipes_lib matches 0 run return run scoreboard players get error datapipes_lib 

$tag @s add fluid_filter_$(id)
$data modify entity @s data.fluids[$(tank)].id set value '$(id)'