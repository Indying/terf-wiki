#this function requires the array to be stored in terf:temp array
data remove storage terf:temp array[0]
data modify storage terf:temp args.array set from storage terf:temp array[0]
function terf:require/cmb_text_array/combine with storage terf:temp args
execute if data storage terf:temp array[0] run function terf:require/cmb_text_array/iterate