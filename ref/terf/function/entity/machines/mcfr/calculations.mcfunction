#terf_data_A = reactor temperature (accuracy * 10000)
#terf_data_B = height
#terf_data_C = waste stuck inside of catalyst
#terf_data_D = fuel per waste
#terf_data_E = waste buffer
#terf_data_F = fuel buffer
#terf_data_G = ignition temperature
#terf_data_H = power output

#this function will never run below ignition temperature
tag @s add terf_indestructible

#give advancement to nearby players
execute if score NETratetimer terf_states >= NETrate terf_states run advancement grant @a[distance=..32] only terf:mcfr/mcfr_startup

#==================== calculate stress ====================
#scoreboard players operation stress terf_states = @s terf_data_D
#scoreboard players operation stress terf_states += @s terf_data_C

#==================== sound ====================
execute store result score pitch terf_states run random value -1000..1000
scoreboard players operation pitch terf_states += pressure terf_states
scoreboard players add pitch terf_states 5000000

data modify storage terf:temp args set value {arg1:'playsound terf:mcfr_hum ambient @a[distance=0..] ~.5 ~3 ~.5 ',arg3:' '}
execute if score pitch terf_states matches 20000000.. run data modify storage terf:temp args.arg1 set value 'playsound terf:mcfr_hum_2 ambient @a[distance=0..] ~.5 ~3 ~.5 '
execute if score pitch terf_states matches 20000000.. run scoreboard players remove pitch terf_states 15000000
execute if score pressure terf_states matches 25000000.. run function terf:entity/machines/mcfr/detonation/detonate_reactor

scoreboard players operation volume terf_states = @s terf_data_A
scoreboard players operation volume terf_states -= @s terf_data_G
execute if score volume terf_states matches 200001.. run scoreboard players set volume terf_states 200000

execute store result storage terf:temp args.arg2 float 0.00001 run scoreboard players get volume terf_states
execute store result storage terf:temp args.arg4 float 0.0000001 run scoreboard players get pitch terf_states
function datapipes_lib:require/with_args/4 with storage terf:temp args

#==================== visuals ====================
data modify storage terf:temp args set value {x:0,z:0,command:'execute positioned ~ ~1 ~ run function terf:entity/machines/mcfr/online/top_tick'}
execute store result storage terf:temp args.y int 1 run scoreboard players get @s terf_data_B
function datapipes_lib:require/run_relative with storage terf:temp args

execute if score core_temp_divided terf_states matches 1000.. run function terf:entity/machines/mcfr/visuals/overheating_effects with entity @s data.terf
execute if score pressure terf_states matches 10000000.. run function terf:entity/machines/mcfr/visuals/overpressure_effects

#==================== boil water and cool the reactor ====================
#exponential increase with heat so the cooling rate increases faster than reaction rate, making it stabilizable
scoreboard players operation cooling_rate terf_states = core_temp_divided terf_states
scoreboard players operation cooling_rate terf_states /= 10 terf_states
scoreboard players operation cooling_rate terf_states *= core_temp_divided terf_states
scoreboard players operation cooling_rate terf_states /= 100 terf_states
#(cooling_rate is max 1,171,008 here)
#the more water the reactor has, the faster it cools
scoreboard players operation cooling_rate terf_states *= coolant_amount terf_states
#(cooling_rate is max 1,171,008,000 here)
scoreboard players operation cooling_rate terf_states /= mcfr_cooling_rate_divider terf_states
execute if score cooling_rate terf_states matches ..-1 run scoreboard players set cooling_rate terf_states 2147483647

#standard coolant boiling function
execute if score cooling_rate terf_states > coolant_amount terf_states run scoreboard players set cooling_rate terf_states 0
scoreboard players operation cooling_rate terf_states *= 40 terf_states
scoreboard players operation steam_amount terf_states += cooling_rate terf_states
scoreboard players operation cooling_rate terf_states /= 40 terf_states
scoreboard players operation coolant_amount terf_states -= cooling_rate terf_states

#boil rate stays the same with height, it just cools less meaning you get more steam per temperature
scoreboard players operation cooling_rate terf_states *= mcfr_cooling_multiplier terf_states
scoreboard players operation cooling_rate terf_states /= @s terf_data_B
scoreboard players operation @s terf_data_A -= cooling_rate terf_states

execute if score steam_amount terf_states matches 200001.. run scoreboard players set steam_amount terf_states 200000

#==================== calculate reaction rate ====================
#divide ignition temp
scoreboard players operation temp2 terf_states = @s terf_data_G
scoreboard players operation temp2 terf_states /= 10000 terf_states

scoreboard players operation reaction_rate terf_states = fuel_amount terf_states
scoreboard players operation reaction_rate terf_states /= @s terf_data_B
scoreboard players operation temp terf_states = core_temp_divided terf_states
scoreboard players operation temp terf_states -= temp2 terf_states
scoreboard players operation reaction_rate terf_states *= temp terf_states
#(reaction_rate is max 342,200,000 here)
scoreboard players operation reaction_rate terf_states /= 200 terf_states
#(reaction_rate is max 342,200 here)
scoreboard players operation reaction_rate terf_states *= @s terf_data_H
#(reaction_rate is max 2,121,640,000 here until i make a fuel more powerful than hydrogen)
scoreboard players operation reaction_rate terf_states /= 5600 terf_states

#==================== increase temperature by reaction rate ====================
scoreboard players operation @s terf_data_A += reaction_rate terf_states

#==================== convert fuel ====================
execute if score @s terf_data_D matches 0 run return fail

scoreboard players operation fuel_usage terf_states = reaction_rate terf_states
scoreboard players operation fuel_usage terf_states *= @s terf_data_B

#increase fuel buffer, if it reaches fuel_usage_divider it uses 1 mb of fuel
scoreboard players operation fuel_usage_divider terf_states = @s terf_data_H
scoreboard players operation fuel_usage_divider terf_states *= mcfr_fuel_usage_divider terf_states

scoreboard players operation @s terf_data_F += fuel_usage terf_states
scoreboard players operation fuel_used terf_states = @s terf_data_F
scoreboard players operation fuel_used terf_states /= fuel_usage_divider terf_states 
scoreboard players operation @s terf_data_F %= fuel_usage_divider terf_states

scoreboard players operation fuel_amount terf_states -= fuel_used terf_states

#if waste per fuel is negative, just multiply
scoreboard players operation temp terf_states = fuel_used terf_states
execute if score @s terf_data_D matches ..-1 run scoreboard players operation temp terf_states *= @s terf_data_D
execute if score @s terf_data_D matches ..-1 run return run scoreboard players operation @s terf_data_C -= temp terf_states

#if waste per fuel is positive, add to the waste buffer, and add divided waste buffer to waste
scoreboard players operation @s terf_data_E += fuel_used terf_states
scoreboard players operation temp terf_states = @s terf_data_E
scoreboard players operation temp terf_states /= @s terf_data_D
scoreboard players operation @s terf_data_C += temp terf_states
scoreboard players operation @s terf_data_E %= @s terf_data_D
