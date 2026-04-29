scoreboard players set right_click_iron terf_states 1
playsound minecraft:entity.iron_golem.repair player @a[distance=0..] ~ ~ ~ 1 0.7
playsound minecraft:block.anvil.use player @a[distance=0..] ~ ~ ~ 1 2
item modify entity @s weapon.mainhand datapipes_lib:decrement_item