data remove storage terf:temp args
data modify storage terf:temp args.sculk_move set value []

execute positioned ~1 ~ ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~1 ~ ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~-1 ~ ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~-1 ~ ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "tp @s ~ ~1 ~"
execute positioned ~ ~-1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "tp @s ~ ~-1 ~"
execute positioned ~ ~ ~1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~ ~1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~ ~-1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~ ~-1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~1 ~1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~1 ~1 ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~-1 ~1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~-1 ~1 ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~1 ~1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~1 ~1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~1 ~-1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~1 ~-1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~1 ~-1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~1 ~-1 ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~-1 ~-1 ~ if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~-1 ~-1 ~ if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~-1 ~1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~-1 ~1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~ ~-1 ~-1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~ ~-1 ~-1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~1 ~ ~1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~1 ~ ~1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~-1 ~ ~1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~-1 ~ ~1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~1 ~ ~-1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~1 ~ ~-1 if loaded ~ ~ ~ run tp @s ~ ~ ~"
execute positioned ~-1 ~ ~-1 if function terf:entity/sculk_charge/can_spread_to run data modify storage terf:temp args.sculk_move append value "execute positioned ~-1 ~ ~-1 if loaded ~ ~ ~ run tp @s ~ ~ ~"


execute store result score temp terf_states run data get storage terf:temp args.sculk_move
scoreboard players remove temp terf_states 1

data modify storage terf:temp args2.arg1 set value "data modify storage terf:temp args.command set from storage terf:temp args.sculk_move["
data modify storage terf:temp args2.arg3 set value "]"

	data modify storage terf:temp args.arg1 set value "execute store result storage terf:temp args2.arg2 int 1 run random value 0.."
	execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
	function datapipes_lib:require/with_args/2 with storage terf:temp args

function datapipes_lib:require/with_args/3 with storage terf:temp args2

function datapipes_lib:require/complex_function/1 with storage terf:temp args
