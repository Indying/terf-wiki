playsound terf:keypress master @a[distance=0..] ~ ~ ~ 1 0.7
$execute as @e[type=marker,tag=terf_security_terminal,tag=terf_machineid_$(machine_id)] at @s run function terf:entity/machines/security_terminal/update_linked_machines with entity @s data.terf
