execute if block ~ ~ ~ granite run return fail
execute if block ~ ~ ~ andesite run return fail

summon marker ~ ~ ~ {UUID:[I;1101100,1101101,1100001,1101111]}
execute store result score x terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[0] 10
execute store result score y terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[1] 10
execute store result score z terf_states run data get entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 Pos[2] 10
scoreboard players operation x terf_states %= 10 terf_states
scoreboard players operation y terf_states %= 10 terf_states
scoreboard players operation z terf_states %= 10 terf_states

$execute if score x terf_states matches 5.. if score y terf_states matches 5.. if score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left]
$execute unless score x terf_states matches 5.. if score y terf_states matches 5.. if score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,facing=east]
$execute if score x terf_states matches 5.. if score y terf_states matches 5.. unless score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,facing=west]
$execute unless score x terf_states matches 5.. if score y terf_states matches 5.. unless score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,facing=south]
$execute if score x terf_states matches 5.. unless score y terf_states matches 5.. if score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,half=top]
$execute unless score x terf_states matches 5.. unless score y terf_states matches 5.. if score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,half=top,facing=east]
$execute if score x terf_states matches 5.. unless score y terf_states matches 5.. unless score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,half=top,facing=west]
$execute unless score x terf_states matches 5.. unless score y terf_states matches 5.. unless score z terf_states matches 5.. run setblock ~ ~ ~ $(type)_stairs[shape=inner_left,half=top,facing=south]

kill 0010cd2c-0010-cd2d-0010-c8e10010cd37
