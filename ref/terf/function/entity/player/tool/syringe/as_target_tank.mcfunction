#stop the raycast
scoreboard players set terminated terf_states -1

execute if score sneaking terf_states matches 0 run function terf:entity/player/tool/syringe/insert_fluid
execute if score sneaking terf_states matches 1 run function terf:entity/player/tool/syringe/extract_fluid
$data modify entity @s data.fluids[{outpos:'$(outpos)'}] set from storage terf:temp syringe_tanks[0]
