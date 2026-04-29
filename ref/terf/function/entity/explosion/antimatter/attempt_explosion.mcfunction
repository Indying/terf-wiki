#input is an array of fluids like [{id:a,amount:69,max:420},{id:b,amount:69,max:420}] in terf:temp args.array
scoreboard players set succeeded terf_states 0
function terf:entity/explosion/antimatter/attempt_explosion_iterate with storage terf:temp args.array[0]
execute if score succeeded terf_states matches 1 run return 1