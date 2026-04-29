tellraw @a ["",{"text":"["},{"text":"S","color":"red"},{"text":"Y","color":"gold"},{"text":"S","color":"yellow"},{"text":"T","color":"green"},{"text":"E","color":"aqua"},{"text":"M","color":"green"},{"text":"] Gametime-Syncer Activated!"}]
scoreboard players set gametime_syncer terf_states 1

execute in terf:intermediary_technical_storage_dimension run data modify storage terf:temp temp set from block 29999999 255 29999999 LastOutput
data modify storage terf:temp args.hours set string storage terf:temp temp 10 12
data modify storage terf:temp args.minutes set string storage terf:temp temp 13 15
data modify storage terf:temp args.seconds set string storage terf:temp temp 16 18
function terf:get_real_time with storage terf:temp args
scoreboard players operation game_time terf_states = real_time terf_states