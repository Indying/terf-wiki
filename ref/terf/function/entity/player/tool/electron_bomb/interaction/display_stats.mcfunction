#calculate percentage
scoreboard players operation temp terf_states = power_max terf_states
scoreboard players operation temp terf_states /= 10000 terf_states

scoreboard players operation decimal_0 terf_states = power_storage terf_states
scoreboard players operation decimal_0 terf_states /= temp terf_states

scoreboard players operation decimal_1 terf_states = decimal_0 terf_states
scoreboard players operation decimal_2 terf_states = decimal_0 terf_states

scoreboard players operation decimal_0 terf_states /= 100 terf_states
scoreboard players operation decimal_1 terf_states /= 10 terf_states

scoreboard players operation decimal_1 terf_states %= 10 terf_states
scoreboard players operation decimal_2 terf_states %= 10 terf_states

#calculate charge rate
scoreboard players operation temp terf_states = gametime terf_states
scoreboard players operation temp terf_states -= @s terf_data_B

scoreboard players operation charge_rate terf_states = power_storage terf_states
scoreboard players operation charge_rate terf_states -= @s terf_data_C
scoreboard players operation charge_rate terf_states /= temp terf_states

#display message
playsound terf:alarms.toolbeep master @a[distance=0..] ~ ~ ~ 1 1

execute on target run tellraw @s [\
"[",{text:"Electron Bomb","color":"gold",underlined:1b},"]\n\n",\
\
{"score":{"name":"power_storage","objective":"terf_states"},color:"gold"}, "MWt /\n",\
{"score":{"name":"power_max","objective":"terf_states"},color:"gold"}, "MWt\n",\
{"score":{"name":"decimal_0","objective":"terf_states"},color:"gold"}, ".", {"score":{"name":"decimal_1","objective":"terf_states"},color:"gold"}, {"score":{"name":"decimal_2","objective":"terf_states"},color:"gold"}, "% Charged\n",\
"Avg. Rate: ",{"score":{"name":"charge_rate","objective":"terf_states"},color:"gold"}, "MW\n",\
]
