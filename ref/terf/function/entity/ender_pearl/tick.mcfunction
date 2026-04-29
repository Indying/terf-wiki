scoreboard players add @s terf_data_A 1
execute if score @s terf_data_A matches ..129 run return fail
particle reverse_portal ~ ~ ~ 0 0 0 1 1 force
execute if score @s terf_data_A matches 130 run playsound block.portal.trigger master @a[distance=0..] ~ ~ ~ 1 1
execute if score @s terf_data_A matches ..200 run return fail
kill @s

playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ 2 1

particle flash{color:[1,0,1,1]} ~ ~ ~ 0 0 0 1 3 force
particle minecraft:dragon_breath ~ ~ ~ 0.1 0.1 0.1 1 300 force
scoreboard players set terminated terf_states 10000
function terf:entity/ender_pearl/raycast
summon tnt ~ ~ ~ {fuse:0}