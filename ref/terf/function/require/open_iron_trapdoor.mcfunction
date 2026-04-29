execute if block ~ ~ ~ iron_trapdoor[open=false] run playsound minecraft:block.iron_trapdoor.open block @a[distance=0..] ~ ~ ~ 1
execute if block ~ ~ ~ iron_trapdoor[facing=north,half=bottom,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=north,half=bottom,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=north,half=top,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=north,half=top,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=south,half=bottom,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=south,half=bottom,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=south,half=top,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=south,half=top,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=east,half=bottom,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=east,half=bottom,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=east,half=top,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=east,half=top,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=west,half=bottom,open=false] run return run setblock ~ ~ ~ iron_trapdoor[facing=west,half=bottom,open=true]
execute if block ~ ~ ~ iron_trapdoor[facing=west,half=top,open=false] run setblock ~ ~ ~ iron_trapdoor[facing=west,half=top,open=true]