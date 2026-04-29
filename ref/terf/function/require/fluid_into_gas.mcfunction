#The inputs of this function must be stored in storage terf:temp args!
scoreboard players set amount terf_states 0
execute store result score amount terf_states run data get storage terf:temp args.amount
execute unless score amount terf_states matches 50.. run return fail

execute unless entity @e[type=bat,tag=terf_gas,distance=..7] run summon bat ~ ~.1 ~ {Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_currententity"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}

data modify storage terf:temp args2 set value {command:'summon bat ~ ~ ~ {Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_currententity"],active_effects:[{id:"minecraft:invisibility",amplifier:1b,duration:-1,show_particles:0b}]}'}
execute store result storage terf:temp args2.n int 0.02001 run scoreboard players get amount terf_states
function terf:require/run_n_times with storage terf:temp args2

scoreboard players set toxicity terf_states 0
execute store result score toxicity terf_states run data get storage terf:temp args.toxicity
scoreboard players operation @e[type=bat,tag=terf_currententity] terf_data_A = toxicity terf_states
execute if score toxicity terf_states matches 1.. run tag @e[type=bat,tag=terf_currententity] add terf_toxic

scoreboard players set flammability terf_states 0
execute store result score flammability terf_states run data get storage terf:temp args.flammability
scoreboard players operation @e[type=bat,tag=terf_currententity] terf_data_B = flammability terf_states
execute if score flammability terf_states matches 1.. run tag @e[type=bat,tag=terf_currententity] add terf_flammable

tag @e[type=bat] remove terf_currententity