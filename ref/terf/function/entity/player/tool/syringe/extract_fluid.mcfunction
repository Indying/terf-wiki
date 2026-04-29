#requires:
#terf:temp syringe_tanks[0] to be the tank
#0010ccd2-0010-cd37-0010-cd360010c8e1 to have the syringe
#transfer_amount in terf_states

##Load data
#syringe data
execute store result score syringe_amount terf_states run data get entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0].amount
execute if score syringe_amount terf_states matches 0 run data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids set value []
#tank data
execute store result score fluid_amount terf_states run data get storage terf:temp syringe_tanks[0].amount
execute store result score fluid_max terf_states run data get storage terf:temp syringe_tanks[0].max

##Fail
#if syringe is full
execute if score syringe_amount terf_states matches 1000.. run return fail
#fail if tank is empty
execute if score fluid_amount terf_states matches ..0 run return run playsound minecraft:item.bucket.fill_powder_snow player @a[distance=0..] ~ ~ ~ 1 2
#fail if types dont match
data modify storage terf:temp args.type set from storage terf:temp syringe_tanks[0].id
execute store success score succeeded terf_states run data modify storage terf:temp args.type set from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0].id
execute unless score succeeded terf_states matches 0 unless score syringe_amount terf_states matches 0 run return run playsound minecraft:item.bucket.fill_tadpole player @a[distance=0..] ~ ~ ~ 1 1
#if changetype returns error
data modify storage terf:temp syringe_tanks[0].new_id set from storage terf:temp syringe_tanks[0].id
scoreboard players set error terf_states 0
function terf:entity/player/tool/syringe/run_changetype with storage terf:temp syringe_tanks[0]
execute unless score error terf_states matches 0 run return fail

##Transfer fluids
#clamp transfer amount
execute if score transfer_amount terf_states > fluid_amount terf_state run scoreboard players operation transfer_amount terf_states = fluid_amount terf_states
#standard fluid transfer function
scoreboard players operation syringe_amount terf_states += transfer_amount terf_states
scoreboard players operation fluid_amount terf_states -= transfer_amount terf_states
execute if score fluid_amount terf_states matches ..-1 run scoreboard players operation syringe_amount terf_states += fluid_amount terf_states
execute if score fluid_amount terf_states matches ..-1 run scoreboard players set fluid_amount terf_states 0
execute if score syringe_amount terf_states matches 1000.. run scoreboard players operation fluid_amount terf_states += syringe_amount terf_states
execute if score syringe_amount terf_states matches 1000.. run scoreboard players remove fluid_amount terf_states 1000
execute if score syringe_amount terf_states matches 1000.. run scoreboard players set syringe_amount terf_states 1000

##Explode if antimatter
function terf:require/get_fluid_dictionary with storage terf:temp syringe_tanks[0]
execute store result storage terf:temp args.power int 1 run scoreboard players get syringe_amount terf_states
execute if data storage terf:temp output.antimatter run function terf:entity/explosion/antimatter/summon with storage terf:temp args
execute if data storage terf:temp output.antimatter run scoreboard players set syringe_amount terf_states 0

##Save data
playsound minecraft:item.bucket.fill_lava player @a[distance=0..] ~ ~ ~ 1 2
#tank data
execute store result storage terf:temp syringe_tanks[0].amount int 1 run scoreboard players get fluid_amount terf_states
#syringe data
data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_model_data set value {colors:[16711935],floats:[1000]}
data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_model_data.colors[0] set from storage terf:temp output.color_dec
execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_model_data.floats[0] int 1 run scoreboard players get syringe_amount terf_states

data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids set value [{amount:0,id:"ERROR"}]
execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0].amount int 1 run scoreboard players get syringe_amount terf_states
data modify entity 0010ccd2-0010-cd37-0010-cd360010c8e1 item.components.minecraft:custom_data.fluids[0].id set from storage terf:temp syringe_tanks[0].id
