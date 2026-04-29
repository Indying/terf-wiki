#load data
data modify storage terf:temp temp set from block ~ ~ ~ front_text.messages[3].extra

#remove old line
data remove storage terf:temp temp[0]

#add new line
execute if score temp terf_states matches ..-1 run scoreboard players set temp terf_states 0
execute if score temp terf_states matches 256.. run scoreboard players set temp terf_states 255
execute store result storage terf:temp args.int int 1 run scoreboard players get temp terf_states
function terf:test/graph/args with storage terf:temp args

#save data
data modify block ~ ~ ~ front_text.messages[3].extra set from storage terf:temp temp
