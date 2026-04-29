scoreboard players remove test terf_states 1
data modify storage terf:temp test set value {}
execute store result storage terf:temp test.slot int 1 run scoreboard players get test terf_states
function terf:test/port_linker/port_link with storage terf:temp test

execute if score test terf_states matches 1.. run function terf:test/port_linker/iterate