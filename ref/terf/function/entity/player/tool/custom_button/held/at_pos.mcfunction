$execute unless entity @e[type=item_display,tag=terf_owner_$(player_id)] run return run particle dust{color:[0,1,0],scale:0.1}
particle dust{color:[1,0,0],scale:0.1}

#get positions
data modify storage terf:temp args.pos2 set from entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos
$data modify storage terf:temp args.pos1 set from entity @e[type=item_display,tag=terf_owner_$(player_id),limit=1] Pos

execute store result score x2 terf_states run data get storage terf:temp args.pos1[0] 16
execute store result score y2 terf_states run data get storage terf:temp args.pos1[1] 16
execute store result score z2 terf_states run data get storage terf:temp args.pos1[2] 16

execute store result score x1 terf_states run data get storage terf:temp args.pos2[0] 16
execute store result score y1 terf_states run data get storage terf:temp args.pos2[1] 16
execute store result score z1 terf_states run data get storage terf:temp args.pos2[2] 16

#calculate scale and translation for item display
data modify storage terf:temp output set value {scale:[0f,0f,0f],translation:[0f,0f,0f]}

scoreboard players operation x1 terf_states -= x2 terf_states
scoreboard players operation y1 terf_states -= y2 terf_states
scoreboard players operation z1 terf_states -= z2 terf_states

#make the coordinates be 1 pixel above surface normal
execute unless block ~0.01 ~ ~ #minecraft:air run scoreboard players remove x1 terf_states 1
execute unless block ~-0.01 ~ ~ #minecraft:air run scoreboard players add x1 terf_states 1
execute unless block ~ ~0.01 ~ #minecraft:air run scoreboard players remove y1 terf_states 1
execute unless block ~ ~-0.01 ~ #minecraft:air run scoreboard players add y1 terf_states 1
execute unless block ~ ~ ~0.01 #minecraft:air run scoreboard players remove z1 terf_states 1
execute unless block ~ ~ ~-0.01 #minecraft:air run scoreboard players add z1 terf_states 1

#limit scale to 16 pixels
execute if score x1 terf_states matches 17.. run scoreboard players set x1 terf_states 16
execute if score y1 terf_states matches 17.. run scoreboard players set y1 terf_states 16
execute if score z1 terf_states matches 17.. run scoreboard players set z1 terf_states 16
execute if score x1 terf_states matches ..-17 run scoreboard players set x1 terf_states -16
execute if score y1 terf_states matches ..-17 run scoreboard players set y1 terf_states -16
execute if score z1 terf_states matches ..-17 run scoreboard players set z1 terf_states -16

#make x,z always be the square
function terf:entity/player/tool/custom_button/held/squarify

#push the square into the block if on a wall
scoreboard players operation tx terf_states = x1 terf_states
scoreboard players operation tz terf_states = z1 terf_states

function terf:entity/player/tool/custom_button/held/push_into_wall

#calculate scale and translation
execute store result storage terf:temp output.translation[0] float 0.03125 run scoreboard players get tx terf_states
execute store result storage terf:temp output.translation[1] float 0.03125 run scoreboard players get y1 terf_states
execute store result storage terf:temp output.translation[2] float 0.03125 run scoreboard players get tz terf_states

execute if score x1 terf_states matches ..-1 run scoreboard players operation x1 terf_states *= -1 terf_states
execute if score y1 terf_states matches ..-1 run scoreboard players operation y1 terf_states *= -1 terf_states
execute if score z1 terf_states matches ..-1 run scoreboard players operation z1 terf_states *= -1 terf_states

execute store result storage terf:temp output.scale[0] float 0.0625 run scoreboard players get x1 terf_states
execute store result storage terf:temp output.scale[1] float 0.0625 run scoreboard players get y1 terf_states
execute store result storage terf:temp output.scale[2] float 0.0625 run scoreboard players get z1 terf_states

#save scale and translation
$data modify entity @e[type=item_display,tag=terf_owner_$(player_id),limit=1] transformation merge from storage terf:temp output