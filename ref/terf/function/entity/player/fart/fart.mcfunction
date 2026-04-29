execute if entity @s[gamemode=spectator] run return fail
scoreboard players add @s terf_data_F 1
execute unless score @s terf_data_F matches 40.. run return fail
scoreboard players operation progress terf_states = @s terf_data_F

execute if score @s terf_data_I matches 100.. unless items entity @s armor.legs * run scoreboard players remove @s terf_data_A 50
execute if score @s terf_data_I matches 100.. if items entity @s armor.legs * run scoreboard players remove @s terf_data_A 25

##################################################################################################################################

scoreboard players set y_offset terf_states 680
scoreboard players set z_offset terf_states -140
execute if data entity @s {OnGround:0b} run scoreboard players set z_offset terf_states 0
execute if predicate datapipes_lib:pressing_sneak run scoreboard players set y_offset terf_states 480
execute if predicate datapipes_lib:pressing_sneak run scoreboard players set z_offset terf_states -360

##################################################################################################################################
execute store result score scale terf_states run attribute @s minecraft:scale get 1000
scoreboard players operation y_offset terf_states *= scale terf_states
scoreboard players operation z_offset terf_states *= scale terf_states

execute store result storage terf:temp args.y_offset float 0.000001 run scoreboard players get y_offset terf_states
execute store result storage terf:temp args.z_offset float 0.000001 run scoreboard players get z_offset terf_states
execute store result storage terf:temp args.angle float 1 run scoreboard players get @s terf_data_J
function terf:entity/player/fart/args with storage terf:temp args

scoreboard players set temp2 terf_states 0
tag @s add terf_currententity
execute as 0010cd2c-0010-cd2d-0010-c8e10010cd37 at @s run function terf:entity/player/fart/as_fart
tag @s remove terf_currententity
execute if items entity @s armor.legs * run scoreboard players operation temp2 terf_states /= 2 terf_states
execute if score temp2 terf_states matches 1.. if score @s terf_data_I > temp2 terf_states run scoreboard players operation @s terf_data_A -= temp2 terf_states
execute if score temp2 terf_states matches 1.. if score @s terf_data_H > temp2 terf_states run scoreboard players operation @s terf_data_H -= temp2 terf_states

execute if predicate datapipes_lib:chances/98 run return fail
scoreboard players set @s terf_data_F 1
function datapipes_lib:require/with_args/2 with storage terf:temp args2
