execute if score @s terf_data_H matches 50000.. run advancement grant @s only terf:radiation

#nausea
execute if score @s terf_data_H matches 50000..100000 if predicate datapipes_lib:chances/0.3 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 100001..200000 if predicate datapipes_lib:chances/1 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 200001..300000 if predicate datapipes_lib:chances/2 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 300001..400000 if predicate datapipes_lib:chances/3 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 400001..1200000 if predicate datapipes_lib:chances/10 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 1200001..1300000 if predicate datapipes_lib:chances/3 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 1300001..1400000 if predicate datapipes_lib:chances/2 run effect give @s minecraft:nausea 5 0 true
execute if score @s terf_data_H matches 1400001.. if predicate datapipes_lib:chances/1 run effect give @s minecraft:nausea 5 0 true

#hunger
execute if score @s terf_data_H matches 53000..103000 if predicate datapipes_lib:chances/0.3 unless predicate terf:has_hunger run effect give @s minecraft:hunger 5 5 true
execute if score @s terf_data_H matches 103001..203000 if predicate datapipes_lib:chances/1 unless predicate terf:has_hunger run effect give @s minecraft:hunger 5 5 true
execute if score @s terf_data_H matches 203001..303000 if predicate datapipes_lib:chances/2 unless predicate terf:has_hunger run effect give @s minecraft:hunger 5 5 true
execute if score @s terf_data_H matches 303001..403000 if predicate datapipes_lib:chances/3 unless predicate terf:has_hunger run effect give @s minecraft:hunger 5 5 true
execute if score @s terf_data_H matches 403001.. if predicate datapipes_lib:chances/10 unless predicate terf:has_hunger run effect give @s minecraft:hunger 5 6 true

#slowness
execute if score @s terf_data_H matches 320001..420000 run effect give @s minecraft:slowness 5 0 true
execute if score @s terf_data_H matches 420001..520000 run effect give @s minecraft:slowness 5 1 true
execute if score @s terf_data_H matches 520001..620000 run effect give @s minecraft:slowness 5 2 true
execute if score @s terf_data_H matches 620001..720000 run effect give @s minecraft:slowness 5 3 true
execute if score @s terf_data_H matches 720001.. run effect give @s minecraft:slowness 5 4 true

#poison
execute if score @s terf_data_H matches 550001..650000 if predicate datapipes_lib:chances/0.3 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 650001..750000 if predicate datapipes_lib:chances/1 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 750001..850000 if predicate datapipes_lib:chances/2 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 850001..950000 if predicate datapipes_lib:chances/3 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 950001..1050000 if predicate datapipes_lib:chances/4 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 1050001..1150000 if predicate datapipes_lib:chances/5 run effect give @s minecraft:poison 2 0 true
execute if score @s terf_data_H matches 1150001.. if predicate datapipes_lib:chances/10 run effect give @s minecraft:poison 2 0 true

#damage
execute if score @s terf_data_H matches 1400001..1500000 if predicate datapipes_lib:chances/0.3 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 1500001..1600000 if predicate datapipes_lib:chances/1 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 1600001..1700000 if predicate datapipes_lib:chances/2 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 1700001..1800000 if predicate datapipes_lib:chances/3 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 1800001..1900000 if predicate datapipes_lib:chances/6 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 1900001..2000000 if predicate datapipes_lib:chances/12 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 2000001..2100000 if predicate datapipes_lib:chances/24 run damage @s 1 terf:radiation
execute if score @s terf_data_H matches 2100001.. run damage @s 1 terf:radiation

#particles
execute if score @s terf_data_H matches 770001.. if predicate datapipes_lib:chances/50 run particle minecraft:block{block_state:red_concrete} ~ ~1 ~ 0.1 0.3 0.1 0 1 force


