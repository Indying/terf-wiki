scoreboard players add raytermination terf_states 1
execute unless block ~ ~ ~ #terf:laser_can_go_through run function terf:require/ceiling_dust/display
execute if score raytermination terf_states matches ..10 positioned ~ ~1 ~ run function terf:require/ceiling_dust/raycast