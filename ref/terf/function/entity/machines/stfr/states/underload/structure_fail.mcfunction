scoreboard players set @a[distance=..80] terf_shake_frequency 20
scoreboard players set @a[distance=..80] terf_shake_magnitude 10

effect give @a[distance=..35] minecraft:blindness 1 0 true

function terf_oldmapadditions:stfrphase_2

fill ~-7 ~-7 ~-7 ~7 ~7 ~7 air replace minecraft:powder_snow
summon tnt ~ ~ ~ {fuse:0}

execute if score dev_mode terf_states matches 0 positioned ~4 ~ ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~-4 ~-1 ~ unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~4 ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~-4 ~1 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~ ~1 ~4 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute if score dev_mode terf_states matches 0 positioned ~-1 ~ ~-4 unless block ~ ~ ~ air run function terf:entity/machines/stfr/states/meltdown/liquify_reactor
execute as @e[type=minecraft:falling_block,distance=..20] run data modify entity @s NoGravity set value 1b

function terf:entity/machines/stfr/broadcast {bcd:"return 1",voiceline:'stfr.underload.structural_failure',level:4,text:'{"text":"COMPLETE REACTOR STRUCTURAL FAILURE DETECTED! A HIGH ENERGY EXPLOSION WILL OCCOUR IN ~T-60 SECONDS! SEEK SHELTER IMMEDIATELY!","color":"red"}'}

function terf:entity/machines/stfr/case_explosion

summon minecraft:creeper ~ ~ ~ {CustomName:"an electromagnetic shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:20,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
summon minecraft:creeper ~ ~ ~ {CustomName:"an electromagnetic shockwave",CustomNameVisible:1,Silent:1,Invulnerable:1,ExplosionRadius:20,Fuse:0,ignited:1,ActiveEffects:[{Id:14,Amplifier:0,Duration:2147483647,ShowParticles:0b}]}
