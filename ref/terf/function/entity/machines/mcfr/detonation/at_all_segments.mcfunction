fill ~ ~ ~-1 ~1 ~ ~2 air
fill ~-1 ~ ~ ~2 ~ ~1 air

summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:levitation",duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:levitation",duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:levitation",duration:-1,show_particles:0b}]}

#visuals
particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 10 force
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

summon minecraft:text_display ~ ~ ~ {Tags:["terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}

summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_random_col","terf_particle","terf_humongous_smoke"],billboard:"center",text:{"text":"\ueff5","color":"#999999"},background:0,view_range:400,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}

#summon explosion creeper
data modify storage terf:temp args set value {command:'summon minecraft:creeper ~ ~ ~ {CustomName:"a runaway MCFR reactor explosion",ignited:1b,Tags:["terf_currententity"],Invulnerable:1b,PersistenceRequired:1b}'}
execute store result storage terf:temp args.x float 0.0001 run random value -5000..5000
execute store result storage terf:temp args.y float 0.0001 run random value -500..500
execute store result storage terf:temp args.z float 0.0001 run random value -5000..5000
function datapipes_lib:require/run_relative with storage terf:temp args

#set its explosion radius
scoreboard players operation radius terf_states = @s terf_data_B
scoreboard players add radius terf_states 2
execute if score radius terf_states matches 25.. run scoreboard players set radius terf_states 25
execute store result entity @n[type=minecraft:creeper,tag=terf_currententity] ExplosionRadius int 1 run scoreboard players get radius terf_states

#set its fuse time
execute store result entity @n[type=minecraft:creeper,tag=terf_currententity] Fuse int 1 run scoreboard players get height terf_states

#remove currententity tag
tag @e[type=creeper] remove terf_currententity

#run the explosion function for the next segment
scoreboard players add height terf_states 1
execute positioned ~ ~1 ~ if score height terf_states <= @s terf_data_B run return run function terf:entity/machines/mcfr/detonation/at_all_segments
fill ~ ~1 ~ ~1 ~1 ~1 air replace obsidian
