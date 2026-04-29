advancement revoke @s only terf:internal/click_interaction
execute as @e[type=interaction] if data entity @s interaction at @s run function terf:entity/as_clicked_interaction with entity @s data
