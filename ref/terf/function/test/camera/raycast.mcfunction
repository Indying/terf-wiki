execute if block ~ ~ ~ #terf:laser_can_go_through positioned ^-.5 ^-.5 ^-.5 positioned ^.5 ^.5 ^.5 positioned ^ ^ ^-.5 run return run function terf:test/camera/raycast

item replace entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 container.0 with light_blue_concrete
loot replace entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 container.0 mine ~ ~ ~ netherite_pickaxe[enchantments={silk_touch:1}]

data modify storage terf:temp args2.arg2 set string entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 item.id 10
function datapipes_lib:require/with_args/2 with storage terf:temp args2
