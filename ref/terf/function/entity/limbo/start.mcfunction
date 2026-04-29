playsound terf:music.limbo ui @a[distance=0..] ~ ~ ~ 1 1
summon minecraft:marker ~ ~ ~ {Tags:["terf_limbo"]}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_1"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_2"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_3"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_4"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_5"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_6"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_7"],interpolation_duration:9}
summon minecraft:item_display ~ ~ ~ {item:{id:"minecraft:trial_key"},Tags:["terf_limbo","terf_key_8"],interpolation_duration:9}

execute as @a[distance=..16] run function terf:entity/player/title_music {music:"NightHawk22 - Isolation"}