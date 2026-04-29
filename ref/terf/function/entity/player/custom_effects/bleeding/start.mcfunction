scoreboard players reset @s terf_broke_glass_0
scoreboard players reset @s terf_broke_glass_1
execute unless score glass_break_bleeding terf_states matches 1 run return fail
execute if items entity @s weapon *[enchantments~[{minecraft:silk_touch}]] run return fail
execute if items entity @s weapon *[minecraft:custom_data~{id:"terf:plasma_pickaxe"}] run return fail

scoreboard players set @s terf_data_R 600
playsound minecraft:enchant.thorns.hit master @a[distance=0..]