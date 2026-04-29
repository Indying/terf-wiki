scoreboard players add temp terf_states 1

data modify storage terf:temp temp.appender set value {"text":"","color":"#000000"}
execute facing entity 0010cd2c-0010-cd2d-0010-c8e10010cd37 feet run function terf:test/camera/raycast
data modify storage terf:temp temp.string append from storage terf:temp temp.appender

execute unless score temp terf_states > hres terf_states positioned ^-.01 ^ ^ run return run function terf:test/camera/shoot

scoreboard players set temp terf_states 0
scoreboard players add temp2 terf_states 1

execute store result storage terf:temp args.hpos float 0.01 run scoreboard players get hres terf_states
execute unless score temp2 terf_states > vres terf_states run function terf:test/camera/vsync with storage terf:temp args
