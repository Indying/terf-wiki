tag @s remove datapipes_lib_tagged_uuid
data modify storage datapipes_lib:temp args.uuid set from entity @s UUID

execute store result score u0 datapipes_lib store result score u1 datapipes_lib run data get storage datapipes_lib:temp args.uuid[0]
execute store result storage datapipes_lib:temp args.u0 int 1 run scoreboard players operation u0 datapipes_lib %= 256 datapipes_lib
execute store result score u2 datapipes_lib run scoreboard players operation u1 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u1 int 1 run scoreboard players operation u1 datapipes_lib %= 256 datapipes_lib
execute store result score u3 datapipes_lib run scoreboard players operation u2 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u2 int 1 run scoreboard players operation u2 datapipes_lib %= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u3 int 1 run scoreboard players operation u3 datapipes_lib /= 256 datapipes_lib

execute store result score u0 datapipes_lib store result score u1 datapipes_lib run data get storage datapipes_lib:temp args.uuid[1]
execute store result storage datapipes_lib:temp args.u4 int 1 run scoreboard players operation u0 datapipes_lib %= 256 datapipes_lib
execute store result score u2 datapipes_lib run scoreboard players operation u1 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u5 int 1 run scoreboard players operation u1 datapipes_lib %= 256 datapipes_lib
execute store result score u3 datapipes_lib run scoreboard players operation u2 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u6 int 1 run scoreboard players operation u2 datapipes_lib %= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u7 int 1 run scoreboard players operation u3 datapipes_lib /= 256 datapipes_lib

execute store result score u0 datapipes_lib store result score u1 datapipes_lib run data get storage datapipes_lib:temp args.uuid[2]
execute store result storage datapipes_lib:temp args.u8 int 1 run scoreboard players operation u0 datapipes_lib %= 256 datapipes_lib
execute store result score u2 datapipes_lib run scoreboard players operation u1 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.u9 int 1 run scoreboard players operation u1 datapipes_lib %= 256 datapipes_lib
execute store result score u3 datapipes_lib run scoreboard players operation u2 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.ua int 1 run scoreboard players operation u2 datapipes_lib %= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.ub int 1 run scoreboard players operation u3 datapipes_lib /= 256 datapipes_lib

execute store result score u0 datapipes_lib store result score u1 datapipes_lib run data get storage datapipes_lib:temp args.uuid[3]
execute store result storage datapipes_lib:temp args.uc int 1 run scoreboard players operation u0 datapipes_lib %= 256 datapipes_lib
execute store result score u2 datapipes_lib run scoreboard players operation u1 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.ud int 1 run scoreboard players operation u1 datapipes_lib %= 256 datapipes_lib
execute store result score u3 datapipes_lib run scoreboard players operation u2 datapipes_lib /= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.ue int 1 run scoreboard players operation u2 datapipes_lib %= 256 datapipes_lib
execute store result storage datapipes_lib:temp args.uf int 1 run scoreboard players operation u3 datapipes_lib /= 256 datapipes_lib

function datapipes_lib:require/uuid_converter/convert_hex with storage datapipes_lib:temp args
function datapipes_lib:require/uuid_converter/combine_uuid with storage datapipes_lib:temp args