execute store result score myuuid0 terf_states run data get entity @s Owner[0]
execute store result score myuuid1 terf_states run data get entity @s Owner[1]
execute store result score myuuid2 terf_states run data get entity @s Owner[2]
execute store result score myuuid3 terf_states run data get entity @s Owner[3]
execute if score myuuid0 terf_states = uuid0 terf_states if score myuuid1 terf_states = uuid1 terf_states if score myuuid2 terf_states = uuid2 terf_states if score myuuid3 terf_states = uuid3 terf_states run kill @s
