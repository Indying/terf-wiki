$scoreboard players set real_time terf_states $(hours)
scoreboard players operation real_time terf_states *= 60 terf_states

$scoreboard players set minutes terf_states $(minutes)
scoreboard players operation real_time terf_states += minutes terf_states

scoreboard players operation real_time terf_states *= 60 terf_states

$scoreboard players set seconds terf_states $(seconds)
scoreboard players operation real_time terf_states += seconds terf_states
