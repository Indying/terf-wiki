$particle $(p) ~.5 ~-1 ~-1.5 0.4 0.2 0 $(s) 10 force
$particle $(p) ~.5 ~-1 ~2.5 0.4 0.2 0 $(s) 10 force

$particle $(p) ~2.5 ~-1 ~.5 0 0.2 0.4 $(s) 10 force
$particle $(p) ~-1.5 ~-1 ~.5 0 0.2 0.4 $(s) 10 force

$data modify storage terf:temp args set value {p:'$(p)',s:'$(s)'}
data modify storage terf:temp args.height set from entity @s data.terf.height
function terf:entity/machines/mcfr/visuals/vent_particle_top with storage terf:temp args