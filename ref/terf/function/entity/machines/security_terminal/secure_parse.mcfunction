$execute if data entity @s data.terf.security_config[{i:$(id)}] run scoreboard players set succeeded terf_states 1
return fail
$scoreboard players set test terf_states $(id)
