execute if block ~ ~ ~ lever[powered=false] run return run function terf:require/turn_on_lever
execute if block ~ ~ ~ lever[powered=true] run function terf:require/turn_off_lever
scoreboard players set on terf_states 1