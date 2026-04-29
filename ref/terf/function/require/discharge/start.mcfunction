$data modify storage terf:temp args set value {x:$(x),y:$(y),z:$(z),tag:'$(tag)'}
scoreboard players set length terf_states 0
scoreboard players set distance terf_states 50000
function terf:require/discharge/raycast with storage terf:temp args
