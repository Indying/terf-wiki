tag @s remove terf_toggle

execute if score @s terf_trigger matches 3 run tag @s[tag=!terf_music_crediting] add terf_toggle
execute if score @s terf_trigger matches 3 run tag @s[tag=terf_toggle] add terf_music_crediting
execute if score @s terf_trigger matches 3 run tag @s[tag=!terf_toggle] remove terf_music_crediting

execute if score @s terf_trigger matches 4 run tag @s[tag=!terf_epilepsy_mode] add terf_toggle
execute if score @s terf_trigger matches 4 run tag @s[tag=terf_toggle] add terf_epilepsy_mode
execute if score @s terf_trigger matches 4 run tag @s[tag=!terf_toggle] remove terf_epilepsy_mode

execute if score @s terf_trigger matches 5 run tag @s[tag=!terf_disable_music] add terf_toggle
execute if score @s terf_trigger matches 5 run tag @s[tag=terf_toggle] add terf_disable_music
execute if score @s terf_trigger matches 5 run tag @s[tag=!terf_toggle] remove terf_disable_music

execute if score @s terf_trigger matches 6 run scoreboard players set @s terf_shake_frequency 0
execute if score @s terf_trigger matches 6 run scoreboard players set @s terf_shake_magnitude 0
execute if score @s terf_trigger matches 6 run scoreboard players set @s terf_data_P 0
execute if score @s terf_trigger matches 6 run scoreboard players set @s terf_data_L 0

data modify storage terf:temp args set value {epilepsymode:"red",disablemusic:"red",musiccrediting:"red"}

execute as @s[tag=terf_music_crediting] run data modify storage terf:temp args.musiccrediting set value green
execute as @s[tag=terf_epilepsy_mode] run data modify storage terf:temp args.epilepsymode set value green
execute as @s[tag=terf_disable_music] run data modify storage terf:temp args.disablemusic set value green

function terf:entity/player/menu/send_normal_menu with storage terf:temp args

tag @s remove terf_toggle
playsound minecraft:ui.button.click master @s ~ ~ ~ 1 1
scoreboard players set @s terf_trigger 0
scoreboard players enable @s terf_trigger