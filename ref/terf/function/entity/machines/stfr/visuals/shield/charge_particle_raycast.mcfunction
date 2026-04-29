$execute if score core_shield_limit terf_states matches 2.. run particle minecraft:small_gust ^ ^ ^$(arg2)
scoreboard players add core_shield_limit terf_states 1
$execute if score core_shield_limit terf_states matches ..22 rotated ~-16 $(pitch) run function terf:entity/machines/stfr/visuals/shield/charge_particle_raycast with storage terf:temp args