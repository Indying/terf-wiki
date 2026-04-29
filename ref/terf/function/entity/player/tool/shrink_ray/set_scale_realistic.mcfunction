#THIS FUNCTION IS EXPERIMENTAL AND UNUPDATED
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

data modify storage terf:temp args.type set value 'minecraft:fall_damage_multiplier'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:jump_strength'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:block_interaction_range'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:entity_interaction_range'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:safe_fall_distance'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:movement_speed'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:step_height'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args

data modify storage terf:temp args.type set value 'minecraft:gravity'
function terf:entity/player/tool/shrink_ray/set_attribute with storage terf:temp args
