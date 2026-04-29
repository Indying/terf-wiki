particle poof ~ ~ ~ 0 0 0 1 1000 force
scoreboard players set @a[distance=..80] terf_data_P 20
particle flash{color:[1,1,1,1]} ~ ~ ~ 0 0 0 0 10 force
particle explosion_emitter ~ ~ ~ 0 0 0 0 1 force
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 10 1
playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 10 0.5
execute if block ~ ~.5 ~ barrier run setblock ~ ~.5 ~ air

scoreboard players set terminated terf_states 50
execute positioned ~ ~.5 ~ run function terf:entity/machines/stfr/states/shutdown_failure/rays/specific_random_direction

$kill @e[type=item_display,tag=terf_related_$(machine_id),distance=..2]
kill @s
