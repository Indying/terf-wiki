execute store result score uuid0 terf_states run data get entity @s UUID[0]
execute store result score uuid1 terf_states run data get entity @s UUID[1]
execute store result score uuid2 terf_states run data get entity @s UUID[2]
execute store result score uuid3 terf_states run data get entity @s UUID[3]
execute as @e[type=ender_pearl] run function terf:require/kill_related_epearls/as_pearls
