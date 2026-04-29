$data modify storage terf:temp output append value [{text:'$(id)',italic:0b,color:'#FF0000'},{text:': $(amount)mb / $(max)mb'}]
$data modify storage terf:temp output[-1][0].color set from storage terf:constants fluid_dictionary.$(id).color_hex
$data modify storage terf:temp output[-1][0].text set from storage terf:constants fluid_dictionary.$(id).name

data remove storage terf:temp temp[0]
function terf:require/make_fluid_lore_iterate with storage terf:temp temp[0]
