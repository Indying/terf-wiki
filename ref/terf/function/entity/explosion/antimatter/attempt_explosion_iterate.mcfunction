data remove storage terf:temp args.array[0]
function terf:entity/explosion/antimatter/attempt_explosion_iterate with storage terf:temp args.array[0]

$execute unless data storage terf:constants fluid_dictionary.$(id).antimatter run return fail
$function terf:entity/explosion/antimatter/summon {power:$(amount)}
scoreboard players set succeeded terf_states 1
