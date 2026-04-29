data modify storage terf:temp args.x set from storage terf:temp args.array[0].pos[0]
data modify storage terf:temp args.y set from storage terf:temp args.array[0].pos[1]
data modify storage terf:temp args.z set from storage terf:temp args.array[0].pos[2]
data modify storage terf:temp args.command set value "function terf:entity/machines/gear_elevator/button_checks/as_all_stone_buttons"
function datapipes_lib:require/run_at with storage terf:temp args

data remove storage terf:temp args.array[0]
execute if data storage terf:temp args.array[0] run function terf:entity/machines/gear_elevator/button_checks/as_all_stone_buttons_array