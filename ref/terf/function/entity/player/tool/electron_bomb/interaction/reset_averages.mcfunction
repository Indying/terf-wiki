scoreboard players operation @s terf_data_B = gametime terf_states
scoreboard players operation @s terf_data_C = power_storage terf_states

#display message
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 0.9
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 0.8

execute on target run tellraw @s ["[",{text:"Electron Bomb","color":"gold"},"] Reseted averages"]
