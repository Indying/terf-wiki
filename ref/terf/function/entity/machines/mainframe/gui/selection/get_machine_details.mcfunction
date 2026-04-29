data modify storage terf:temp args.machine_name set from entity @s data.terf.machine_name
execute store result score x terf_states run data get entity @s Pos[0]
execute store result score y terf_states run data get entity @s Pos[1]
execute store result score z terf_states run data get entity @s Pos[2]
execute store result score calc terf_states run data get entity @s data.terf.mainframe_logistics.connected_machines
execute store result score calc2 terf_states run data get entity @s data.terf.machine_id