data modify storage terf:temp temp set value 'empty'
$execute store success score succeeded terf_states run data modify storage terf:temp temp set value '$(id)'

data remove storage terf:temp args.array[0]
execute if score succeeded terf_states matches 0 run return run function terf:entity/machines/stfr/receptacles/make_injection_list_add with storage terf:temp args.array[0]
$tag @s add terf_receptacle_contains_$(id)

$execute store result score amount terf_states run data get storage terf:temp array[{id:'$(id)'}].amount
scoreboard players add amount terf_states 1
$execute store result storage terf:temp array[{id:'$(id)'}].amount int 1 run scoreboard players get amount terf_states

function terf:entity/machines/stfr/receptacles/make_injection_list_add with storage terf:temp args.array[0]
