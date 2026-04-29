execute unless block ~ ~ ~ #minecraft:air unless block ~ ~ ~ minecraft:moving_piston run return fail
scoreboard players set tick_prismarine_bits terf_states 3

setblock ~ ~ ~ moving_piston
execute if items entity @s weapon minecraft:carrot_on_a_stick[minecraft:custom_data~{id:"terf:dark_prismarine_bit"}] run item modify entity @s weapon.mainhand datapipes_lib:decrement_item
execute if items entity @s weapon.offhand minecraft:carrot_on_a_stick[minecraft:custom_data~{id:"terf:dark_prismarine_bit"}] run item modify entity @s weapon.offhand datapipes_lib:decrement_item

execute positioned ~ ~ ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.25,z:0}
execute positioned ~ ~ ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0,z:0.25}
execute positioned ~ ~ ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0,z:0.25}
execute positioned ~ ~ ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0,z:0.25}
execute positioned ~.25 ~ ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0,z:0}
execute positioned ~.25 ~ ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.25 ~ ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.25 ~ ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.5 ~ ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0,z:0}
execute positioned ~.5 ~ ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.5 ~ ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.5 ~ ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.75 ~ ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0,z:0}
execute positioned ~.75 ~ ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.75 ~ ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}
execute positioned ~.75 ~ ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.15,y:0,z:0.15}

execute positioned ~ ~.25 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.25,z:0}
execute positioned ~ ~.25 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.25 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.25 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~.25 ~.25 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.25 ~.25 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.25 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.25 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.25 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.5 ~.25 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.25 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.25 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.25 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.75 ~.25 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.25 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.25 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}

execute positioned ~ ~.5 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.25,z:0}
execute positioned ~ ~.5 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.5 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.5 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~.25 ~.5 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.25 ~.5 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.5 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.5 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.5 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.5 ~.5 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.5 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.5 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.5 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.75 ~.5 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.5 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.5 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}

execute positioned ~ ~.75 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.25,z:0}
execute positioned ~ ~.75 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.75 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~ ~.75 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0,y:0.15,z:0.15}
execute positioned ~.25 ~.75 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.25 ~.75 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.75 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.25 ~.75 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.75 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.5 ~.75 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.75 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.5 ~.75 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.75 ~ unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.25,y:0.25,z:0}
execute positioned ~.75 ~.75 ~.25 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.75 ~.5 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run return run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}
execute positioned ~.75 ~.75 ~.75 unless entity @e[type=item_display,tag=terf_dark_prismarine_bit,distance=..0.01] run function terf:entity/player/tool/prismarine_bit/summon {x:0.1,y:0.1,z:0.1}

setblock ~ ~ ~ air
