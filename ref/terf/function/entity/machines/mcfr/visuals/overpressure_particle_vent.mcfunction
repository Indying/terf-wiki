execute store result storage terf:temp args.x float 0.001 run random value 0..2000
execute store result storage terf:temp args.y float 0.001 run random value 0..1000

$execute positioned ~ ~$(height) ~ run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent_top

execute rotated 0 0 positioned ^-.5 ^-1.5 ^2.5 run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent_args with storage terf:temp args
execute rotated 90 0 positioned ^-.5 ^-1.5 ^1.5 run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent_args with storage terf:temp args
execute rotated 180 0 positioned ^-1.5 ^-1.5 ^1.5 run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent_args with storage terf:temp args
execute rotated 270 0 positioned ^-1.5 ^-1.5 ^2.5 run function terf:entity/machines/mcfr/visuals/overpressure_particle_vent_args with storage terf:temp args
