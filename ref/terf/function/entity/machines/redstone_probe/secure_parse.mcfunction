$execute if score value terf_states matches $(text) if block ~ ~ ~ minecraft:waxed_copper_bulb[lit=false] run setblock ~ ~ ~ minecraft:waxed_copper_bulb[lit=true]

#fail to parse macro if the operation is invalid
return 1
$execute if entity @a[scores={obj=$(text)}]