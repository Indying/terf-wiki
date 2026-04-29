scoreboard players set succeeded datapipes_lib 0
$execute $(checks) run scoreboard players set succeeded datapipes_lib 1
execute if score succeeded datapipes_lib matches 0 run return fail

$scoreboard players set tank_amount datapipes_lib $(amount)
$scoreboard players set tank_max datapipes_lib $(max)

#insert fluid
scoreboard players operation tank_amount datapipes_lib += total_amount datapipes_lib
scoreboard players operation total_amount datapipes_lib = tank_amount datapipes_lib
scoreboard players operation total_amount datapipes_lib -= tank_max datapipes_lib
execute if score total_amount datapipes_lib matches 1.. run scoreboard players operation tank_amount datapipes_lib = tank_max datapipes_lib

$execute store result entity @s data.fluids[{id:'$(id)'}].amount int 1 run scoreboard players get tank_amount datapipes_lib
