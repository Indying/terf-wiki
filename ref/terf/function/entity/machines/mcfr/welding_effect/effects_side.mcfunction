function terf:require/play_with_random_pitch {s:'terf:welding master @a ~ ~ ~ 1',min:8000,max:10000}

function terf:entity/machines/mcfr/welding_effect/particle_line
execute positioned ^ ^ ^1 run function terf:entity/machines/mcfr/welding_effect/particle_line

execute positioned ^ ^1 ^.1 run function terf:entity/machines/mcfr/welding_effect/particle_line
execute positioned ^ ^1 ^1.1 run function terf:entity/machines/mcfr/welding_effect/particle_line

execute positioned ^ ^ ^ rotated 0 -90 run function terf:entity/machines/mcfr/welding_effect/particle_line
execute positioned ^ ^ ^2 rotated 0 -90 run function terf:entity/machines/mcfr/welding_effect/particle_line
