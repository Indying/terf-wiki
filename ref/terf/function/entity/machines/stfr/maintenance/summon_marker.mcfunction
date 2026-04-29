$execute if block $(pos) #terf:indestructible run return fail
$summon minecraft:marker $(pos) {Tags:["terf_currententity","terf_maintenance","terf_related_$(machine_id)"]}

scoreboard players operation @n[type=minecraft:marker,tag=terf_currententity] terf_data_B = component terf_states
data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.machine_id set from entity @s data.terf.machine_id

#give it a random particle
execute store result score temp terf_states run random value 1..10
execute if score temp terf_states matches 1 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:trial_spawner_detection ~ ~ ~ 0 0 0 0.1 1 force'
execute if score temp terf_states matches 2 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:firework ~ ~ ~ 0 0 0 0.2 1 force'
execute if score temp terf_states matches 3 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:electric_spark ~ ~ ~ 0 0 0 1 2 force'
execute if score temp terf_states matches 4 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:large_smoke ~ ~ ~ 0 0 0 0.1 1 force'
execute if score temp terf_states matches 5 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:lava ~ ~ ~ 0 0 0 0.1 1 force'
execute if score temp terf_states matches 6 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:poof ~ ~ ~ 0 0 0 0.5 3 force'
execute if score temp terf_states matches 7 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:flame ~ ~ ~ 0 0 0 0.2 3 force'
execute if score temp terf_states matches 8 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:white_smoke ~ ~ ~ 0 0 0 0.2 3 force'
execute if score temp terf_states matches 9 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:wax_off ~ ~ ~ 0 0 0 8 1 force'
execute if score temp terf_states matches 10 run data modify entity @n[type=minecraft:marker,tag=terf_currententity] data.terf.maintenance.particle set value 'particle minecraft:white_ash ~ ~ ~ 0 0 0 10 3 force'
tag @n[type=minecraft:marker,tag=terf_currententity] remove terf_currententity

execute if score component terf_states matches 0 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.case_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Case","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 1 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab1_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer U","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 2 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab2_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer S","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 3 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab3_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer E","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 4 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab4_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer N","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 5 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab5_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer W","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
execute if score component terf_states matches 6 run function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.maintenance.stab6_require',text:'{"text":"Fusion Reactor ","color":"yellow"},{"text":"Stabilizer D","color":"gold"},{"text":" Requires Maintenance","color":"yellow"}',level:1}
tag @s add terf_alarm_maintenance