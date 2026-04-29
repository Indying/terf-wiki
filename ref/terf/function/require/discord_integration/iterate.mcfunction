data modify storage terf:temp args.suffix set value ""
execute if data storage terf:temp array[0].text run data modify storage terf:temp args.suffix set from storage terf:temp array[0].text
execute if data storage terf:temp array[0].score.name run function terf:require/discord_integration/get_score with storage terf:temp array[0].score

function terf:require/discord_integration/add_string with storage terf:temp args
data remove storage terf:temp array[0]
execute if data storage terf:temp array[0] run function terf:require/discord_integration/iterate