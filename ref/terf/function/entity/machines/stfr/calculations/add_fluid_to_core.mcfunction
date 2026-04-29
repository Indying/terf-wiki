data modify storage terf:temp temp set value {error:1}
$data modify storage terf:temp temp set from storage terf:constants fluid_dictionary.$(result)
execute if data storage terf:temp temp.error run return fail
$data modify storage terf:temp temp.id set value '$(result)'
data modify storage terf:temp temp.core_amount set value 1

data modify storage terf:temp stfr_dedicated.array append from storage terf:temp temp
data modify entity @s data.terf.core_contents append from storage terf:temp temp