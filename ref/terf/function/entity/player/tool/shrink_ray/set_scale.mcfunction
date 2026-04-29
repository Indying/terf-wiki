$data modify storage terf:temp args.amount set value $(scale)

#set attributes
data modify storage terf:temp args.type set value 'minecraft:scale'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:block_break_speed'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:attack_damage'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:attack_knockback'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:max_health'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

#set attributes that only get smaller with scale
execute store result score scale terf_states run data get storage terf:temp args.amount 1000000
execute if score scale terf_states matches 1.. run scoreboard players set scale terf_states 0
execute store result storage terf:temp args2.amount float 0.000001 run scoreboard players get scale terf_states

data modify storage terf:temp args2.type set value 'minecraft:fall_damage_multiplier'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

#set attributes that only get larger with scale
execute store result score scale terf_states run data get storage terf:temp args.amount 1000000
execute if score scale terf_states matches ..-1 run scoreboard players set scale terf_states 0
execute store result storage terf:temp args2.amount float 0.000001 run scoreboard players get scale terf_states

data modify storage terf:temp args2.type set value 'minecraft:jump_strength'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

data modify storage terf:temp args2.type set value 'minecraft:block_interaction_range'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

data modify storage terf:temp args2.type set value 'minecraft:entity_interaction_range'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

data modify storage terf:temp args2.type set value 'minecraft:safe_fall_distance'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

data modify storage terf:temp args2.type set value 'minecraft:movement_speed'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

data modify storage terf:temp args2.type set value 'minecraft:step_height'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args2

#special cases for mobs
execute store result score scale terf_states run data get storage terf:temp args.amount 1000000
scoreboard players add scale terf_states 1000000
execute store result entity @s[type=minecraft:creeper] ExplosionRadius byte 0.000003 run scoreboard players get scale terf_states