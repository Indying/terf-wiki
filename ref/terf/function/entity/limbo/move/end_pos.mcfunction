execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[-0.5f,1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:20,start_interpolation:0,transformation:{translation:[-0.6f,1.0f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[0.5f,1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:25,start_interpolation:0,transformation:{translation:[0.6f,1.0f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[-0.5f,0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:30,start_interpolation:0,transformation:{translation:[-1.5f,0.4f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[0.5f,0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:35,start_interpolation:0,transformation:{translation:[1.5f,0.4f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[-0.5f,-0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:40,start_interpolation:0,transformation:{translation:[-1.5f,-0.4f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[0.5f,-0.51f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:45,start_interpolation:0,transformation:{translation:[1.5f,-0.4f,0f]}}

execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[-0.5f,-1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:50,start_interpolation:0,transformation:{translation:[-0.6f,-1.0f,0f]}}
execute as @e[type=minecraft:item_display,tag=terf_limbo,nbt={item:{count:1},transformation:{translation:[0.5f,-1.5f,0f]}}] run data merge entity @s {item:{count:2},interpolation_duration:55,start_interpolation:0,transformation:{translation:[0.6f,-1.0f,0f]}}


execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^.6 ^1 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_1"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^-.6 ^1 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_2"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^1.5 ^.4 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_3"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^-1.5 ^.4 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_4"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^1.5 ^-.4 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_5"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^-1.5 ^-.4 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_6"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^.6 ^-1 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_7"]}
execute positioned ~ ~-0.25 ~ run summon minecraft:interaction ^-.6 ^-1 ^ {response:1b,width:0.5,height:0.5,Tags:["terf_limbo","terf_key_8"]}
