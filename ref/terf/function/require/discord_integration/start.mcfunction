#discord integration
execute unless dimension minecraft:overworld run return fail
$data modify storage terf:temp args set value {prefix:'$(prefix)'}
$data modify storage terf:temp array set value $(text_components)
function terf:require/discord_integration/iterate with storage terf:temp array[0]
execute if score oldmapadditions_installed terfmap_states matches 1 run function terf:require/discord_integration/send_command with storage terf:temp args
