#calculate blackbody color
scoreboard players operation temp terf_states = core_temp_divided terf_states
scoreboard players operation temp terf_states /= 150 terf_states
execute if score temp terf_states matches ..50 run scoreboard players set temp terf_states 51
execute if score temp terf_states matches 1983.. run scoreboard players set temp terf_states 1982

execute store result storage terf:temp args.temp int 1 run scoreboard players get temp terf_states
function terf:entity/machines/stfr/visuals/core/get_color with storage terf:temp args

execute store result storage terf:temp args.S float 0.0025 run scoreboard players get core_scale terf_states
function terf:entity/machines/stfr/visuals/core/display with storage terf:temp args

# OLD FUNCTION

#local B = (temp - 4500)/4
#local R = (temp - 500)/8
#local G = (temp ^ 1.2 / 150) - math.max(temp / -1 + 500,0)
#R = math.max(math.min(R,255) - math.max((B-400)/6,0),10)
#G = math.max(math.min(G,255) - math.max((B-400)/6,0),16)

#scoreboard players operation temp terf_states = core_temp_divided terf_states
#scoreboard players operation temp terf_states /= 15 terf_states

#scoreboard players operation B terf_states = temp terf_states
#scoreboard players remove B terf_states 4500
#scoreboard players operation B terf_states /= 4 terf_states

#scoreboard players operation R terf_states = temp terf_states
#scoreboard players remove R terf_states 500
#scoreboard players operation R terf_states /= 8 terf_states

#raise temp to the power of 1.2

#scoreboard players operation G terf_states = temp terf_states
#scoreboard players operation G terf_states *= 1000 terf_states
#scoreboard players operation G terf_states /= 800 terf_states
#scoreboard players operation G terf_states *= temp terf_states
#scoreboard players operation G terf_states /= 1000 terf_states

#scoreboard players operation G terf_states /= 150 terf_states
#scoreboard players operation Garg terf_states = temp terf_states
#scoreboard players operation Garg terf_states /= -1 terf_states
#scoreboard players add Garg terf_states 500
#execute if score Garg terf_states matches ..-1 run scoreboard players set Garg terf_states 0
#scoreboard players operation G terf_states -= Garg terf_states

#scoreboard players operation Rarg terf_states = B terf_states
#scoreboard players remove Rarg terf_states 400
#scoreboard players operation Rarg terf_states /= 6 terf_states
#execute if score Rarg terf_states matches ..-1 run scoreboard players set Rarg terf_states 0

#execute if score R terf_states matches 256.. run scoreboard players set R terf_states 255
#scoreboard players operation R terf_states -= Rarg terf_states
#execute if score R terf_states matches ..9 run scoreboard players set R terf_states 20

#execute if score G terf_states matches 256.. run scoreboard players set G terf_states 255
#scoreboard players operation G terf_states -= Rarg terf_states
#execute if score G terf_states matches ..15 run scoreboard players set G terf_states 20

#execute if score B terf_states matches 256.. run scoreboard players set B terf_states 255
#execute if score B terf_states matches ..-1 run scoreboard players set B terf_states 1

#make core turn purple when REALLY HOT
#scoreboard players operation P terf_states = temp terf_states
#scoreboard players operation P terf_states /= 100 terf_states
#scoreboard players remove P terf_states 100
#execute if score P terf_states matches ..-1 run scoreboard players set P terf_states 0
#scoreboard players operation R terf_states += P terf_states
#execute if score R terf_states matches 256.. run scoreboard players set R terf_states 255

#execute store result storage terf:temp args.R double 0.0039215686274509 run scoreboard players get R terf_states
#execute store result storage terf:temp args.G double 0.0039215686274509 run scoreboard players get G terf_states
#execute store result storage terf:temp args.B double 0.0039215686274509 run scoreboard players get B terf_states

#execute store result storage terf:temp args.S float 0.0025 run scoreboard players get core_scale terf_states

#function terf:entity/machines/stfr/visuals/core/display with storage terf:temp args