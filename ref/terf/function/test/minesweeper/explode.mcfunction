summon tnt ~ ~1 ~ {fuse:80}
summon tnt ~ ~1 ~ {fuse:80}
summon tnt ~ ~1 ~ {fuse:80}
summon tnt ~ ~1 ~ {fuse:80}
summon tnt ~ ~1 ~ {fuse:80}

execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle end_rod ~ ~ ~ ^ ^5000000 ^100000000 0.00000001 0 force'}
execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle end_rod ~ ~ ~ ^ ^5000000 ^500000000 0.00000001 0 force'}
execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle firework ~ ~ ~ ^ ^ ^30000000 0.00000001 0 force'}
execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle totem_of_undying ~ ~ ~ ^ ^200000000 ^300000000 0.00000001 0 force'}

execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle campfire_cosy_smoke ~ ~ ~ ^ ^ ^100000000 0.00000001 0 force'}
execute positioned ~ ~1.6 ~ run function datapipes_lib:require/run_in_all_directions {accuracy:1000,command:'particle campfire_signal_smoke ~ ~ ~ ^ ^ ^60000000 0.00000001 0 force'}

playsound terf:major_achievement master @a[distance=0..] ~ ~ ~ 8 1
playsound terf:major_achievement master @a[distance=0..] ~ ~ ~ 8 1

function terf:test/minesweeper/explode_floodfill
