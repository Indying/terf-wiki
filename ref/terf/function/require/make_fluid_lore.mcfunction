#   this turns the inputted array of tanks from terf:temp temp for example:
#
#   [{id:"water",amount:100,max:1000},{id:"lava",amount:0,max:2000},{id:"air",amount:2000,max:2000}]
#
#   into:
#
#   water: 100mb / 1000mb
#   lava: 0mb / 2000mb
#   air: 2000mb / 2000mb

data modify storage terf:temp output set value []
function terf:require/make_fluid_lore_iterate with storage terf:temp temp[0]
