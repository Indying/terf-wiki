$execute in $(ns):$(dim) run scoreboard players set succeeded terf_states 1
$data modify entity @s data.terf.warp_core.dim set value "$(ns):$(dim)"
return 1
$clone from $(ns):$(dim) ~ ~ ~ ~ ~ ~ to $(ns):$(dim) ~ ~ ~ replace move