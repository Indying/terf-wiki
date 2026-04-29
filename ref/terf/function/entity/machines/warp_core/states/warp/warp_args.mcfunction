$execute positioned ~$(offset_x) ~$(offset_y) ~$(offset_z) run function terf:entity/machines/warp_core/states/warp/teleport_area with storage terf:temp args
$execute in $(dimension) positioned $(target_x) $(target_y) $(target_z) run function terf:require/run_n_times {command:'playsound terf:explosion.warp_stop master @a[distance=0..] ~ ~ ~ 20 1',n:10}
