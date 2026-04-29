execute if items entity @s armor.head * run return fail
item replace entity @s armor.head from entity @s weapon
playsound minecraft:item.armor.equip_leather player @a[distance=0..] ~ ~ ~ 1
item replace entity @s weapon with minecraft:air