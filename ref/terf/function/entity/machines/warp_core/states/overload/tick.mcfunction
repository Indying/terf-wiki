scoreboard players add @s terf_data_E 1
execute if score @s[tag=terf_containment] terf_data_E matches ..1800 run scoreboard players remove @s terf_data_E 4
execute if score @s terf_data_E matches ..-1 run function terf:entity/machines/warp_core/states/overload/stop

execute if score @s terf_data_E matches 2000.. run function terf:entity/machines/warp_core/states/detonation/start

particle minecraft:large_smoke ~ ~ ~ 1 1 1 0 1 force
execute unless entity @s[tag=terf_containment] run particle minecraft:small_flame ~ ~ ~ 0 0 0 0.1 100 force

execute if score @s terf_data_E matches 1800..1802 run function terf:entity/explosion/small_explosion/summon
execute if score @s terf_data_E matches 1800.. run particle minecraft:large_smoke ~ ~ ~ 0 0 0 1 100 force
execute if score @s terf_data_E matches 1800.. run particle flash{color:[1,1,1,1]} ~ ~ ~ 0.1 0.1 0.1 0 1 force

execute if score @s terf_data_E matches 1810 run playsound terf:alarms.civil_alert_siren_4 master @a[distance=0..] ~ ~ ~ 50 1

#======================== Sound ========================

scoreboard players operation temp2 terf_states = @s terf_data_E
scoreboard players remove temp2 terf_states 1700
execute if score temp2 terf_states matches ..-1 run scoreboard players set temp2 terf_states 0
scoreboard players operation temp2 terf_states *= 10 terf_states

scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states += temp2 terf_states
scoreboard players add temp terf_states 5000

data modify storage terf:temp args set value {arg1:'playsound terf:alarms.alarm2 master @a[distance=0..] ~.5 ~3 ~.5 10 '}
execute store result storage terf:temp args.arg2 float 0.0001 run scoreboard players get temp terf_states
function datapipes_lib:require/with_args/2 with storage terf:temp args

#======================== Glow visuals ========================
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states *= 3 terf_states

scoreboard players operation opacity terf_states = temp terf_states

scoreboard players operation opacity terf_states = temp terf_states
scoreboard players operation opacity terf_states /= 40 terf_states
execute if score opacity terf_states matches ..27 run scoreboard players set opacity terf_states 26
execute if score opacity terf_states matches 255.. run scoreboard players set opacity terf_states 255

#calculate blackbody radiation
scoreboard players operation B terf_states = temp terf_states
scoreboard players remove B terf_states 4500
scoreboard players operation B terf_states /= 4 terf_states

scoreboard players set R terf_states 255

#raise temp to the power of 1.2
scoreboard players operation G terf_states = temp terf_states
scoreboard players operation G terf_states *= 1000 terf_states
scoreboard players operation G terf_states /= 800 terf_states
scoreboard players operation G terf_states *= temp terf_states
scoreboard players operation G terf_states /= 1000 terf_states

scoreboard players operation G terf_states /= 150 terf_states
scoreboard players operation Garg terf_states = temp terf_states
scoreboard players operation Garg terf_states /= -1 terf_states
scoreboard players add Garg terf_states 500
execute if score Garg terf_states matches ..-1 run scoreboard players set Garg terf_states 0
scoreboard players operation G terf_states -= Garg terf_states

scoreboard players operation Rarg terf_states = B terf_states
scoreboard players remove Rarg terf_states 400
scoreboard players operation Rarg terf_states /= 6 terf_states
execute if score Rarg terf_states matches ..-1 run scoreboard players set Rarg terf_states 0

execute if score R terf_states matches 256.. run scoreboard players set R terf_states 255
scoreboard players operation R terf_states -= Rarg terf_states
execute if score R terf_states matches ..-1 run scoreboard players set R terf_states 0

execute if score G terf_states matches 256.. run scoreboard players set G terf_states 255
scoreboard players operation G terf_states -= Rarg terf_states
execute if score G terf_states matches ..-1 run scoreboard players set G terf_states 0

execute if score B terf_states matches 256.. run scoreboard players set B terf_states 255
execute if score B terf_states matches ..-1 run scoreboard players set B terf_states 0

#convert blackbody color to RRGGBB in hex for displaying
data modify storage terf:temp args set value {arg1:'data modify storage terf:temp args.color set value "#',arg5:'"'}

execute store result storage terf:temp args.r int 1 run scoreboard players get R terf_states
execute store result storage terf:temp args.g int 1 run scoreboard players get G terf_states
execute store result storage terf:temp args.b int 1 run scoreboard players get B terf_states
function terf:require/rgb_to_hex with storage terf:temp args

function datapipes_lib:require/with_args/5 with storage terf:temp args
scoreboard players operation height terf_states = @s terf_data_B

#set color to text displays from args.color
$execute as @e[type=minecraft:text_display,tag=terf_warp_core_overheat_display,tag=terf_related_$(machine_id)] run function terf:entity/machines/warp_core/states/overload/as_text_displays
