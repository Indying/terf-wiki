$scoreboard players set x terf_states $(x)
$scoreboard players set y terf_states $(y)
$scoreboard players set z terf_states $(z)
$data modify storage terf:temp args.command set value '$(command)'

scoreboard players set tx terf_states 0
function terf:require/run_spatial/run_x