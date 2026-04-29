gamemode creative
tp @s ~ ~10000 ~
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
execute at @s anchored eyes positioned ^ ^ ^5 summon end_crystal run damage @s 0
tp @s ~ ~ ~
gamemode survival

advancement revoke @s only terf:internal/cd_tau_cannon
rotate @s ~ ~-90
scoreboard players add @s terf_data_P 50
title @s times 0 0 5
title @s title "                       \ueef2"

function terf:entity/player/tool/tau_cannon/shoot

playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.1
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.2
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.3
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.4
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.5
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.6
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.7
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.8
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 1.9
playsound terf:explosion.tau_cannon_shoot player @s ~ ~1000000 ~ 1000000 2
