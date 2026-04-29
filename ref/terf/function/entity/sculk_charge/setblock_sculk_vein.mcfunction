data modify storage terf:temp args set value {arg1:"setblock ~ ~ ~ minecraft:sculk_vein[down=", arg2:"false", arg3:",east=", arg4:"false", arg5:",north=", arg6:"false", arg7:",south=", arg8:"false", arg9:",up=", arg10:"false", arg11:",west=", arg12:"false", arg13:"] destroy"}
kill @e[type=item,distance=..1]

scoreboard players set temp terf_states 0
execute positioned ~ ~-1 ~ unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg2 set value "true"
execute positioned ~1 ~ ~ unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg4 set value "true"
execute positioned ~ ~ ~-1 unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg6 set value "true"
execute positioned ~ ~ ~1 unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg8 set value "true"
execute positioned ~ ~1 ~ unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg10 set value "true"
execute positioned ~-1 ~ ~ unless block ~ ~ ~ #terf:sculk_nonsolid unless block ~ ~ ~ #terf:sculk_transmitter store success score temp terf_states run data modify storage terf:temp args.arg12 set value "true"

execute unless score temp terf_states matches 0 run function datapipes_lib:require/with_args/13 with storage terf:temp args