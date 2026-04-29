$data modify storage terf:temp temp set from storage terf:constants fluid_dictionary.$(id)
execute unless data storage terf:temp temp.antimatter run return fail

$scoreboard players set amount terf_states $(amount)
execute if score amount terf_states matches 2000.. run advancement grant @p only terf:antimatter_explosion

item replace entity @s container.0 with air
$function terf:entity/explosion/antimatter/summon {power:$(amount)}
damage @s 100 terf:antimatter