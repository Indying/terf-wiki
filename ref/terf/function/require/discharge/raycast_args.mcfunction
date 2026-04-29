$summon item_display ~ ~ ~ {brightness:{block:15,sky:15},Tags:["terf_lightning","$(tag)"],item:{id:"minecraft:carrot_on_a_stick",count:1,components:{"minecraft:item_model":"terf:visual/discharge"}},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,$(offset)f]}}
$execute facing $(x) $(y) $(z) rotated ~$(yaw) ~$(pitch) run rotate @n[type=minecraft:item_display,tag=terf_lightning] ~ ~
$scoreboard players add length terf_states $(adder)
$execute facing $(x) $(y) $(z) rotated ~$(yaw) ~$(pitch) positioned ^ ^ ^$(offset) run function terf:require/discharge/raycast with storage terf:temp args
