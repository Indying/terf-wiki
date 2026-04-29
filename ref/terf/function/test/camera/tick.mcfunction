scoreboard players set temp terf_states 0
scoreboard players set temp2 terf_states 0
$scoreboard players set vres terf_states $(vres)
$scoreboard players set hres terf_states $(hres)

data modify storage terf:temp args2 set value {arg1:'data modify storage terf:temp temp.appender.color set from storage terf:constants block_colors.'}

$summon item_display ^ ^ ^-$(fov) {UUID:[I;1101100,1101101,1100001,1101111]}
data modify storage terf:temp temp.string set value []

execute store result storage terf:temp args.hpos float 0.005 run scoreboard players get hres terf_states
execute store result storage terf:temp args.vpos float 0.005 run scoreboard players get vres terf_states
function terf:test/camera/center with storage terf:temp args

kill 0010cd2c-0010-cd2d-0010-c8e10010cd37

scoreboard players add hres terf_states 2
execute as @e[tag=terf_camera] run data modify entity @s text set from storage terf:temp temp.string
execute as @e[tag=terf_camera] store result entity @s line_width float 10 run scoreboard players get hres terf_states

data modify storage terf:test test set from storage terf:temp temp.string
#tellraw @s "Complete!"