data modify storage terf:temp args.custom_data set value {}

# Litteraly turn the x,y and z vectors into binary values for the players saddle
function terf:require/launch_player/binary/x
function terf:require/launch_player/binary/y
function terf:require/launch_player/binary/z

#save binary data onto the item and put it on the player
item replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 with saddle[enchantments={"terf:apply_impulse":1,"minecraft:vanishing_curse":1,"minecraft:binding_curse":1},minecraft:equippable={slot:saddle,equip_sound:"intentionally_empty"}]
data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.custom_data set from storage terf:temp args.custom_data
item replace entity @s saddle from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0
