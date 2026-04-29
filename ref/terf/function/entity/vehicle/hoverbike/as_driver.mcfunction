scoreboard players set has_driver terf_states 1

#controls
execute if predicate datapipes_lib:pressing_jump rotated ~ ~-90 on vehicle if score @s terf_data_A matches ..99 run scoreboard players add @s terf_data_A 1
execute if predicate datapipes_lib:pressing_sprint rotated ~ ~90 on vehicle if score @s terf_data_A matches 2.. run scoreboard players remove @s terf_data_A 1

#strafing while going forwards or backwards
execute if predicate datapipes_lib:pressing_left run particle minecraft:end_rod ^-.35 ^.4 ^.38 ^-20000000000 ^ ^ 0.00000000001 0 force
execute if predicate datapipes_lib:pressing_right run particle minecraft:end_rod ^.35 ^.4 ^.38 ^20000000000 ^ ^ 0.00000000001 0 force

execute if predicate datapipes_lib:pressing_forwards if predicate datapipes_lib:pressing_left rotated ~-45 0 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_forwards if predicate datapipes_lib:pressing_right rotated ~45 0 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_backwards if predicate datapipes_lib:pressing_left rotated ~45 ~180 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_backwards if predicate datapipes_lib:pressing_right rotated ~-45 ~180 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust

execute if predicate datapipes_lib:pressing_forwards on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_backwards rotated ~ ~180 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_left rotated ~-90 0 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
execute if predicate datapipes_lib:pressing_right rotated ~90 0 on vehicle run return run function terf:entity/vehicle/hoverbike/thrust
