scoreboard players operation bullets_exists terf_states = photon_beam_last terf_states
tag @s remove terf_bullet_head

#get the current rotation
execute store result score yaw terf_states run data get entity @s Rotation[0] 1000
execute store result score pitch terf_states run data get entity @s Rotation[1] 1000

scoreboard players set length terf_states 0
scoreboard players operation terminated terf_states = photon_beam_speed terf_states

function terf:entity/vehicle/mrt/beam/step with storage terf:temp args
