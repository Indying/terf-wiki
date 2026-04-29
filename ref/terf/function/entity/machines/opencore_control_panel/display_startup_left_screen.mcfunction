$scoreboard players set needed_power terf_states $(x)
scoreboard players operation calc terf_states = @s datapipes_lib_power_storage
scoreboard players operation calc terf_states += needed_power terf_states
execute if score @s datapipes_lib_power_storage matches 0 run scoreboard players set calc terf_states 0

$execute unless score calc terf_states >= needed_power terf_states run data merge block ^1 ^1 ^1 {front_text:{messages:[[{"score":{"name":"calc","objective":"terf_states"},"color":"red"},{"text":"-$(x)MWt","color":"aqua"}],{"text":"$(a)x $(in_desc)"},{"text":"output:","color":"aqua"},{"text":"$(out_desc)"}]}}
$execute if score calc terf_states >= needed_power terf_states run data merge block ^1 ^1 ^1 {front_text:{messages:[[{"score":{"name":"calc","objective":"terf_states"},"color":"green"},{"text":"-$(x)MWt","color":"aqua"}],{"text":"$(a)x $(in_desc)"},{"text":"output:","color":"aqua"},{"text":"$(out_desc)"}]}}
