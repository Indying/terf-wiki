#terf_data_A = state | 0 = offline | 1 = initializing | 2 = running | 3 = finishing
#terf_data_B = extension remove per tick
#terf_data_C = min extension required to complete
#terf_data_D = current extension

execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/assembler/slower_tick

#stop if
execute unless entity @s[tag=terf_body] run return fail
execute unless score @s datapipes_lib_power_storage matches 500.. run return run data merge block ^-2 ^1 ^5 {front_text:{has_glowing_text:1b,messages:[{text:"    Assembler    ",color:"yellow",underlined:1b},"",{text:"Low Power!",color:red},{text:"",color:red}],has_glowing_text:1b,color:"yellow"},is_waxed:1b}
execute unless score @s terf_connected_mainframe = @s terf_connected_mainframe run return run data merge block ^-2 ^1 ^5 {front_text:{messages:["",{"text":"No Signal","bold":true,"color":"red"},{"text":"||||||||||||||||||||||||","bold":true,"color":"red"},""],has_glowing_text:1b,color:"orange"},is_waxed:1b}

scoreboard players remove @s datapipes_lib_power_storage 500

#move down at the start of the sequence and move up in the end
execute if score @s terf_data_A matches 1 run return run function terf:entity/machines/assembler/initializing with entity @s data.terf
execute if score @s terf_data_A matches 3 run return run function terf:entity/machines/assembler/finishing with entity @s data.terf

scoreboard players operation @s terf_data_D -= @s terf_data_B
execute if score @s terf_data_D <= @s terf_data_C run scoreboard players set @s terf_data_A 3

data modify storage terf:temp temp set from entity @s data.terf.n
data merge block ^-2 ^1 ^5 {front_text:{has_glowing_text:1b,messages:[{text:"    Assembler    ",color:"yellow",underlined:1b},"",{text:"Assembling",color:green},{"nbt":"temp","storage":"terf:temp",color:green}],has_glowing_text:1b,color:"yellow"},is_waxed:1b}

function terf:entity/machines/assembler/visuals_tick with entity @s data.terf

execute if predicate datapipes_lib:chances/50 run return fail
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'terf:welding master @a[distance=0..] ~ ~ ~ 1',min:10000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'terf:spotlight master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'crr:crr.crr_zap3 master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'crr:crr.crr_zap5 master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'crr:crr.steamburst1 master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'minecraft:entity.cat.hurt master @a[distance=0..] ~ ~ ~ 1',min:10000,max:10001}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'crr:crr.crr_burstglass1 master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
execute if predicate datapipes_lib:chances/30 run return run function terf:require/play_with_random_pitch {s:'terf:metal_pipe master @a[distance=0..] ~ ~ ~ 1',min:5000,max:20000}
