scoreboard players remove @s terf_data_A 1
$execute if score @s terf_data_B matches 50.. run playsound minecraft:entity.lightning_bolt.thunder master @a[distance=0..] ~ ~ ~ $(volume) 0



#destruction
function terf:entity/explosion/antimatter/upcast

$particle minecraft:explosion ~ ~ ~ 5 5 5 $(particle_scale) 10 force
execute if score @s terf_data_A matches ..0 run kill @s



















return fail
#sound
data modify storage terf:temp args set value {arg1:'execute as @a[distance=',arg3:'..',arg5:'] run function terf:entity/explosion/antimatter/reach_player'}

scoreboard players operation temp terf_states = @s terf_data_A
scoreboard players remove temp terf_states 1
scoreboard players operation temp terf_states *= 3 terf_states
execute store result storage terf:temp args.arg2 int 1 run scoreboard players get temp terf_states
scoreboard players add temp terf_states 6
execute store result storage terf:temp args.arg4 int 1 run scoreboard players get temp terf_states

scoreboard players set temp2 terf_states 1000
scoreboard players operation temp2 terf_states -= @s terf_data_A

function datapipes_lib:require/with_args/5 with storage terf:temp args

data modify storage terf:temp args merge value {arg1:'playsound minecraft:entity.lightning_bolt.thunder master @a[distance=..',arg3:'] ~ ~ ~ 10000 0'}
function datapipes_lib:require/with_args/3 with storage terf:temp args

execute if score @s terf_data_A matches 100.. run return fail
summon minecraft:text_display ~ ~ ~ {Tags:["terf_random_vel","terf_particle","terf_humongous_fire"],billboard:"center",text:{"text":"\ueff5","color":"#111111"},background:0,view_range:730,brightness:{sky:15,block:15},teleport_duration:2,alignment:center}
