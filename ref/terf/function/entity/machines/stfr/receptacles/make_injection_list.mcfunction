execute unless function terf:entity/machines/stfr/receptacles/all_receptacles_locked run return fail

data modify storage terf:temp array set value []
$execute as @e[type=item_display,tag=terf_related_$(machine_id),tag=terf_receptacle] run function terf:entity/machines/stfr/receptacles/make_injection_list_as

data modify storage terf:temp array[].machine_id set from entity @s data.terf.machine_id
data modify entity @s data.terf.injection_list set from storage terf:temp array
