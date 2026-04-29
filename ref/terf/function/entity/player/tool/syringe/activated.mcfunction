#detect sneaking and pressing ctrl
scoreboard players set sneaking terf_states 0
execute if predicate datapipes_lib:pressing_sneak run scoreboard players set sneaking terf_states 1

#set transfer amount
scoreboard players set transfer_amount terf_states 1000
execute if predicate datapipes_lib:pressing_sprint run scoreboard players set transfer_amount terf_states 10

#save the syringe to a temp entity so it can be modified
item replace entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0 from entity @s weapon

#run stuff
scoreboard players set error terf_states 0
execute store result score terminated terf_states run attribute @s minecraft:block_interaction_range base get 5
function terf:entity/player/tool/syringe/raycast

function terf:entity/player/tool/syringe/set_name

execute unless score error terf_states matches 0 run return run title @p[tag=terf_currententity] actionbar {"text":"This tank is currently locked!","color":"yellow"}

#save item back into the players hand
item replace entity @s weapon from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0

##Insert oxygen into hazmat suit if the player is wearing one
execute if entity @s[tag=!terf_full_hazmat] run return fail

#load data
data modify storage terf:temp syringe_tanks set value [{id:"terf.oxygen",amount:0,max:1000}]
execute store result storage terf:temp syringe_tanks[0].amount int 1 run scoreboard players get @s terf_data_O
function terf:entity/player/tool/syringe/insert_fluid
function terf:entity/player/tool/syringe/set_name

execute store result score @s terf_data_O run data get storage terf:temp syringe_tanks[0].amount
item replace entity @s weapon from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0

playsound minecraft:entity.puffer_fish.blow_out player @a[distance=0..] ~ ~ ~ 1 0
