particle minecraft:explosion ~ ~ ~ 0 0 0 5 10 force
summon tnt ~ ~ ~ {fuse:0}
data modify storage terf:temp args.arg1 set value 'playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ 2 '
execute store result storage terf:temp args.arg2 float 0.01 run random value 60..100
function datapipes_lib:require/with_args/2 with storage terf:temp args