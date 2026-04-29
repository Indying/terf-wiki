advancement revoke @s only terf:internal/open_ender_chest

scoreboard players set succeeded terf_states 0
execute anchored eyes positioned ^ ^ ^ run function terf:entity/player/ender_chest/raycast

#if the raycast cannot find the ender chest
execute if score succeeded terf_states matches 1 run return fail
particle reverse_portal ~ ~1 ~ 0.3 0.5 0.3 1 5000 force
damage @s 1000000 terf:ender_chest_failure
kill @s
