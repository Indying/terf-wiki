data modify storage terf:temp args set value {arg1:'data modify block ~ ~ ~ front_text.messages[1] set value "',arg3:"",arg4:'"'}
data modify storage terf:temp args.arg2 set from block ~ ~ ~ front_text.messages[1]

#set the character adder
execute as @s[tag=terf_0] run data modify storage terf:temp args.arg3 set value 0
execute as @s[tag=terf_1] run data modify storage terf:temp args.arg3 set value 1
execute as @s[tag=terf_2] run data modify storage terf:temp args.arg3 set value 2
execute as @s[tag=terf_3] run data modify storage terf:temp args.arg3 set value 3
execute as @s[tag=terf_4] run data modify storage terf:temp args.arg3 set value 4
execute as @s[tag=terf_5] run data modify storage terf:temp args.arg3 set value 5
execute as @s[tag=terf_6] run data modify storage terf:temp args.arg3 set value 6
execute as @s[tag=terf_7] run data modify storage terf:temp args.arg3 set value 7
execute as @s[tag=terf_8] run data modify storage terf:temp args.arg3 set value 8
execute as @s[tag=terf_9] run data modify storage terf:temp args.arg3 set value 9
#the backspace key
execute as @s[tag=terf_red] run data modify storage terf:temp args.arg2 set string storage terf:temp args.arg2 0 -1

#if there are too many characters, set character adder to ""
execute store result score temp terf_states run data get storage terf:temp args.arg2
execute if score temp terf_states matches 14.. run data modify storage terf:temp args.arg3 set value ""

#set the text of the screen
function datapipes_lib:require/with_args/4 with storage terf:temp args

#sounds
execute as @s[tag=terf_red] run return run playsound terf:keypress master @a[distance=0..] ~ ~ ~ 1 0.8
playsound terf:keypress master @a[distance=0..] ~ ~ ~ 1 1
