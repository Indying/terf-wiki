summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}

particle minecraft:flame ~ ~ ~ 1 1 1 2 500 force
particle minecraft:campfire_cosy_smoke ~ ~ ~ 1 1 1 0.1 100 force
particle minecraft:explosion_emitter ~ ~ ~ 1 1 1 1 10 force

summon minecraft:marker ~ ~ ~ {Tags:["terf_small_explosion","terf_explosion"]}