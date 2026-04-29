summon item_display ~ ~ ~ {UUID:[I;488379,-385755,-141876,-44509]}
item replace entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0 from entity @p[tag=terf_currententity] weapon

$data modify entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:custom_data.terf.fluid_type set value '$(id)'
$data modify entity 000773bb-fffa-1d25-fffd-d5ccffff5223 item.components.minecraft:item_name set value "Fluid ID Tool: $(id)"
$function terf:entity/player/tool/fluid_id/as_fluid_dictionary with storage terf:constants fluid_dictionary.$(id)

item replace entity @p[tag=terf_currententity] weapon from entity 000773bb-fffa-1d25-fffd-d5ccffff5223 container.0
kill 000773bb-fffa-1d25-fffd-d5ccffff5223

$title @p[tag=terf_currententity] actionbar {"text":"Copied fluid type $(id)","color":"yellow"}

playsound terf:alarms.toolbeep player @a[distance=0..] ~ ~ ~ 1 1

function terf:entity/player/tool/fluid_id/particle {color:"1,1,0"}