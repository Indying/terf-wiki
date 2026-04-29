#move down
scoreboard players add @s terf_data_D 500000

execute if score @s terf_data_D matches 5000000..15000000 run fill ^3 ^5 ^3 ^-2 ^5 ^-4 barrier
execute if score @s terf_data_D matches 5000000..15000000 run fill ^4 ^5 ^2 ^-3 ^5 ^-3 barrier

execute if score @s terf_data_D matches 15000000..25000000 run fill ^3 ^4 ^3 ^-2 ^4 ^-4 barrier
execute if score @s terf_data_D matches 15000000..25000000 run fill ^4 ^4 ^2 ^-3 ^4 ^-3 barrier

execute if score @s terf_data_D matches 25000000..35000000 run fill ^3 ^3 ^3 ^-2 ^3 ^-4 barrier
execute if score @s terf_data_D matches 25000000..35000000 run fill ^4 ^3 ^2 ^-3 ^3 ^-3 barrier

execute if score @s terf_data_D matches 35000000..45000000 run fill ^3 ^2 ^3 ^-2 ^2 ^-4 barrier
execute if score @s terf_data_D matches 35000000..45000000 run fill ^4 ^2 ^2 ^-3 ^2 ^-3 barrier

execute if score @s terf_data_D matches 45000000..55000000 run fill ^3 ^1 ^3 ^-2 ^1 ^-4 barrier
execute if score @s terf_data_D matches 45000000..55000000 run fill ^4 ^1 ^2 ^-3 ^1 ^-3 barrier

execute if score @s terf_data_D matches 55000000..65000000 run fill ^3 ^ ^3 ^-2 ^ ^-4 barrier
execute if score @s terf_data_D matches 55000000..65000000 run fill ^4 ^ ^2 ^-3 ^ ^-3 barrier

execute positioned ~-4 ~ ~-4 as @e[type=!item,dx=7,dy=7,dz=7] at @s if block ~ ~ ~ barrier run damage @s 100 terf:crush

execute if score @s terf_data_D matches 60000000 run stopsound @a[distance=..32] * terf:elevator_start
execute if score @s terf_data_D matches 60000000 run playsound terf:elevator_stop master @a[distance=0..] ~ ~ ~ 2 0
execute if score @s terf_data_D matches 60000000 run data merge block ^-2 ^1 ^5 {front_text:{has_glowing_text:1b,messages:[{text:"    Assembler    ",color:"yellow",underlined:1b},"",{text:"Loading",color:green},{text:"Blueprint...",color:green}],has_glowing_text:1b,color:"yellow"},is_waxed:1b}

execute unless score @s terf_data_D matches 100000000.. run return run function terf:entity/machines/assembler/visuals_tick with entity @s data.terf
scoreboard players set @s terf_data_D 60000000
scoreboard players set @s terf_data_A 2

$$(s)
tag @e[tag=terf_currententity] add terf_assembler_start_entity
$tag @e[tag=terf_currententity] add terf_related_$(machine_id)
tag @e remove terf_currententity