execute unless predicate datapipes_lib:chances/1 run return fail
execute unless block ~ ~-1 ~ green_glazed_terracotta run return fail
$execute unless block ~ ~$(height) ~ green_glazed_terracotta run return fail

function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}
function terf:require/play_with_random_pitch {s:"terf:dem.metal_2 master @a[distance=0..] ~ ~2 ~ 10",min:10000,max:20000}

execute store result score succeeded terf_states run random value 0..1
execute if score succeeded terf_states matches 1 run setblock ~ ~-1 ~ air
execute if score succeeded terf_states matches 1 run particle poof ~ ~-1 ~ 0.2 0.2 0.2 1 500 force
$execute if score succeeded terf_states matches 0 run setblock ~ ~$(height) ~ air
$execute if score succeeded terf_states matches 0 run particle poof ~ ~$(height) ~ 0.2 0.2 0.2 1 500 force

#instantly check the structure after the vent breaks
execute at @s run function terf:entity/machines/mcfr/checks/start