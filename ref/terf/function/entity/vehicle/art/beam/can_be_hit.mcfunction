execute if entity @s[type=player,scores={terf_data_C=1}] run return fail
execute if entity @s[tag=terf_art_target] run return 1
execute if data entity @s {Invulnerable:1b} run return fail
#dont hit non-living entities
execute unless entity @s[type=!item_display,type=!block_display,type=!text_display,type=!marker,type=!interaction] run return fail
return 1
