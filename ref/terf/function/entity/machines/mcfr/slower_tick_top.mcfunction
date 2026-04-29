#check where fluid pipes are
$execute if block ~ ~1 ~ granite_slab[type=double] run data modify entity @s data.power set value {checks:"if block ~ ~$(above) ~ red_glazed_terracotta"}
$execute if block ~ ~1 ~1 granite_slab[type=double] run data modify entity @s data.power set value {checks:"if block ~ ~$(above) ~1 red_glazed_terracotta"}
$execute if block ~1 ~1 ~ granite_slab[type=double] run data modify entity @s data.power set value {checks:"if block ~1 ~$(above) ~ red_glazed_terracotta"}
$execute if block ~1 ~1 ~1 granite_slab[type=double] run data modify entity @s data.power set value {checks:"if block ~1 ~$(above) ~1 red_glazed_terracotta"}

#$execute if block ~ ~1 ~ waxed_cut_copper run data modify entity @s data.terf.mainframe_logistics.config.input_coords set value "~ ~$(above) ~"
#$execute if block ~ ~1 ~1 waxed_cut_copper run data modify entity @s data.terf.mainframe_logistics.config.input_coords set value "~ ~$(above) ~1"
#$execute if block ~1 ~1 ~ waxed_cut_copper run data modify entity @s data.terf.mainframe_logistics.config.input_coords set value "~1 ~$(above) ~"
#$execute if block ~1 ~1 ~1 waxed_cut_copper run data modify entity @s data.terf.mainframe_logistics.config.input_coords set value "~1 ~$(above) ~1"

$execute if block ~ ~1 ~ chiseled_quartz_block run data modify storage terf:temp temp[1] merge value {outpos:"~ ~$(above) ~", checks:"if block ~ ~$(above) ~ red_glazed_terracotta"}
$execute if block ~ ~1 ~1 chiseled_quartz_block run data modify storage terf:temp temp[1] merge value {outpos:"~ ~$(above) ~1", checks:"if block ~ ~$(above) ~1 red_glazed_terracotta"}
$execute if block ~1 ~1 ~ chiseled_quartz_block run data modify storage terf:temp temp[1] merge value {outpos:"~1 ~$(above) ~", checks:"if block ~1 ~$(above) ~ red_glazed_terracotta"}
$execute if block ~1 ~1 ~1 chiseled_quartz_block run data modify storage terf:temp temp[1] merge value {outpos:"~1 ~$(above) ~1", checks:"if block ~1 ~$(above) ~1 red_glazed_terracotta"}

$execute if block ~ ~1 ~ waxed_cut_copper run data modify storage terf:temp temp[2] merge value {outpos:"~ ~$(above) ~", checks:"if block ~ ~$(above) ~ red_glazed_terracotta"}
$execute if block ~ ~1 ~1 waxed_cut_copper run data modify storage terf:temp temp[2] merge value {outpos:"~ ~$(above) ~1", checks:"if block ~ ~$(above) ~1 red_glazed_terracotta"}
$execute if block ~1 ~1 ~ waxed_cut_copper run data modify storage terf:temp temp[2] merge value {outpos:"~1 ~$(above) ~", checks:"if block ~1 ~$(above) ~ red_glazed_terracotta"}
$execute if block ~1 ~1 ~1 waxed_cut_copper run data modify storage terf:temp temp[2] merge value {outpos:"~1 ~$(above) ~1", checks:"if block ~1 ~$(above) ~1 red_glazed_terracotta"}
