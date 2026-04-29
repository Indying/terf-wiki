$function datapipes_lib:fluid_transfer/remove_fluid {tank:0,amount:$(a)}
data modify entity @s data.terf.stored_recipe set from storage terf:temp output.z
scoreboard players set @s terf_data_A 1

execute positioned ^ ^4 ^1 run function terf:entity/machines/lamp_controller/turn_on_lever
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
playsound terf:centrifuge master @a[distance=0..] ~ ~ ~ 1 0
