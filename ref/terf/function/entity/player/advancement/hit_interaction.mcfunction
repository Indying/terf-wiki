advancement revoke @s only terf:internal/hit_interaction
execute as @e[type=interaction] if data entity @s attack at @s run function terf:entity/as_hit_interaction with entity @s data
