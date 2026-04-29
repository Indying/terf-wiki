data modify storage terf:temp temp set from entity @s

execute store result score x terf_states run data get storage terf:temp temp.Pos[0] 1000
execute store result score z terf_states run data get storage terf:temp temp.Pos[2] 1000
scoreboard players operation x terf_states -= @s terf_data_X
scoreboard players operation z terf_states -= @s terf_data_Z
execute store result score @s terf_data_X run data get storage terf:temp temp.Pos[0] 1000
execute store result score @s terf_data_Z run data get storage terf:temp temp.Pos[2] 1000

execute store result storage terf:temp args.x int 1 run scoreboard players get x terf_states
execute store result storage terf:temp args.z int 1 run scoreboard players get z terf_states
function terf:entity/player/fart/calculate_body_rotation_args with storage terf:temp args
execute store result score speed terf_states run data get entity 0010ccd2-0010-cd37-0010-cd360010c8e1 transformation.scale[0]
execute store result score vector terf_states run data get entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[0]
execute unless predicate datapipes_lib:pressing_forwards run scoreboard players add vector terf_states 180
execute unless predicate datapipes_lib:pressing_forwards if predicate datapipes_lib:pressing_left run scoreboard players remove vector terf_states 135
execute unless predicate datapipes_lib:pressing_forwards if predicate datapipes_lib:pressing_right run scoreboard players add vector terf_states 135
execute if score speed terf_states matches 60.. run scoreboard players operation @s terf_data_J = vector terf_states

execute store result score rotation terf_states run data get storage terf:temp temp.Rotation[0]

scoreboard players operation rotdiff terf_states = rotation terf_states
scoreboard players operation rotdiff terf_states -= @s terf_data_J
execute if score rotdiff terf_states matches 181.. run scoreboard players remove rotdiff terf_states 360
execute if score rotdiff terf_states matches ..-181 run scoreboard players add rotdiff terf_states 360

scoreboard players operation temp terf_states = rotation terf_states
execute unless score rotdiff terf_states matches ..-50 run scoreboard players remove temp terf_states 50
execute unless score rotdiff terf_states matches 50.. run scoreboard players add temp terf_states 50
execute unless score rotdiff terf_states matches -50..50 run scoreboard players operation @s terf_data_J = temp terf_states

execute if predicate datapipes_lib:pressing_sneak run return run function terf:entity/player/fart/fart
execute if predicate datapipes_lib:pressing_left if predicate datapipes_lib:pressing_right run return run function terf:entity/player/fart/fart

scoreboard players set @s terf_data_F 0

