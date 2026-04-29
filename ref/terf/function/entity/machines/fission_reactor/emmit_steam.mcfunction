execute unless block ~ ~ ~ water if predicate datapipes_lib:chances/10 run playsound minecraft:block.fire.extinguish master @a[distance=..15] ~ ~ ~ 0.2 0 0.2
execute unless block ~ ~ ~ water run return run particle poof ~ ~ ~ 0.8 0 0.8 0 3 force
execute positioned ~ ~1 ~ run function terf:entity/machines/fission_reactor/emmit_steam