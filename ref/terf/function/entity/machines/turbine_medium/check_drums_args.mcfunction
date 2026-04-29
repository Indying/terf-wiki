$data modify storage terf:temp args.steam_checks set value '$(steam_checks) if block ^$(sx) ^$(sy) ^$(slength) red_glazed_terracotta'
$data modify storage terf:temp args.water_checks set value '$(water_checks) if block ^$(wx) ^$(wy) ^$(wlength) red_glazed_terracotta'

$data modify storage terf:temp temp[0].outpos set value '^$(sx) ^$(sy) ^$(slength)'
$data modify storage terf:temp temp[1].outpos set value '^$(wx) ^$(wy) ^$(wlength)'
