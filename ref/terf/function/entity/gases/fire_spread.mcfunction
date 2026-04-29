execute unless function terf:require/is_dimension_not_space unless predicate terf:is_in_air run return fail
execute store result score run_n_times terf_states run fill ~-1 ~-1 ~-1 ~1 ~1 ~1 fire replace #terf:flammable
scoreboard players operation run_n_times terf_states *= 5 terf_states
function terf:require/runnt {command:'summon bat ~ ~ ~ {HasVisualFire:1b,Silent:1b,Invulnerable:1b,Tags:["terf_gas","terf_fire"],active_effects:[{id:"minecraft:invisibility",duration:-1,show_particles:0b},{id:"minecraft:levitation",duration:-1,show_particles:0b}]}'}