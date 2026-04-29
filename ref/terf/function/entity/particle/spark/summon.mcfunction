execute store result storage terf:temp args.yaw float 0.1 run random value -1800..1800
execute if entity @s[tag=!terf_test] store result storage terf:temp args.pitch float 0.1 run random value -900..900
execute if entity @s[tag=terf_test] store result storage terf:temp args.pitch float 0.1 run random value -900..-700
execute store result storage terf:temp args.speed float 0.001 run random value 5000..15000
execute store result storage terf:temp args.width float 0.001 run random value 100..500
execute store result storage terf:temp args.height float 0.001 run random value 100..500
execute store result storage terf:temp args.teleport_duration int 1 run random value 4..40
execute store result storage terf:temp args.fall_distance float 0.001 run random value -1000..2000
function terf:entity/particle/spark/summon_args with storage terf:temp args