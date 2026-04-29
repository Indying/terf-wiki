#make the tanks type unchangable
execute if score @s terf_data_A >= @s terf_data_G run return 2

#set fuel usage and outputs
$data modify storage terf:temp temp set from storage terf:constants fluid_dictionary.$(new_id)

#fail if not all data is found
execute unless data storage terf:temp temp.fusion.result run return 3
execute unless data storage terf:temp temp.fusion.in_per_out run return 3
execute unless data storage terf:temp temp.fusion.required_keV run return 3
execute unless data storage terf:temp temp.fusion.released_keV run return 3

#configure the machine for this recipe
data modify entity @s data.fluids[3].id set from storage terf:temp temp.fusion.result
execute store result score @s terf_data_D run data get storage terf:temp temp.fusion.in_per_out

execute store result score @s terf_data_G run data get storage terf:temp temp.fusion.required_keV
execute store result score @s terf_data_H run data get storage terf:temp temp.fusion.released_keV

#released power - required power
scoreboard players operation @s terf_data_H -= @s terf_data_G

#multiply for ignition temperature
scoreboard players operation @s terf_data_G *= 9000 terf_states