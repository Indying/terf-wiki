scoreboard players set @s terf_data_A 1
scoreboard players set @s terf_data_E 0

function terf:require/run_n_times {command:'playsound terf:charge_up.rocketlaunch master @a[distance=0..] ~ ~ ~ 10 1',n:10}

data modify storage terf:temp args set value {}
execute store result storage terf:temp args.axis_x int 1 run scoreboard players get @s terf_data_U
execute store result storage terf:temp args.axis_y int 1 run scoreboard players get @s terf_data_V
execute store result storage terf:temp args.axis_z int 1 run scoreboard players get @s terf_data_W

scoreboard players operation y terf_states = @s terf_data_V
scoreboard players operation y terf_states *= 4 terf_states
scoreboard players add y terf_states 1
execute store result storage terf:temp args.Uaxis_y float 0.25 run scoreboard players get y terf_states

scoreboard players operation x terf_states = @s terf_data_U
scoreboard players operation z terf_states = @s terf_data_W
scoreboard players operation x terf_states *= 2 terf_states
scoreboard players operation z terf_states *= 2 terf_states
scoreboard players add x terf_states 1
scoreboard players add z terf_states 1
execute store result storage terf:temp args.Daxis_x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args.Daxis_z int 1 run scoreboard players get z terf_states
execute positioned ~ ~.5 ~ run function terf:entity/machines/warp_core/visuals/summon_text_displays with storage terf:temp args

scoreboard players set @s terf_data_B 0
scoreboard players set @s terf_data_C 0

playsound terf:alarms.beep5 master @a[distance=0..] ~ ~ ~ 10 1

tag @s add terf_indestructible