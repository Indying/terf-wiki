summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_small_flash"],billboard:"center",text:{"text":"\ueef2"},background:0,view_range:32,brightness:{sky:15,block:15},alignment:center}
summon minecraft:text_display ~ ~ ~ {Tags:["terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:1,alignment:center}

function terf:require/play_with_random_pitch {s:'terf:explosion.tank_shot master @a[distance=0..] ~ ~ ~ 10',min:10000,max:15000}
function terf:require/play_with_random_pitch {s:'terf:explosion.bang master @a[distance=0..] ~ ~ ~ 3',min:14000,max:20000}
function terf:require/play_with_random_pitch {s:'terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 7',min:5000,max:6000}

setblock ~ ~ ~ air
particle minecraft:flame ~ ~ ~ 0 0 0 1 1000 force
particle minecraft:large_smoke ~ ~ ~ 0 0 0 1 1000 force

summon bat ~ ~.1 ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}
summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}

data merge block ^-1 ^ ^1 {is_waxed:1b,front_text:{messages:[{text:"   Solar Panel   ",underlined:1b},"","Critical Failure:","Short Circuit"],color:red,has_glowing_text:1b}}

function terf:entity/machines/multiblock_core_destroy