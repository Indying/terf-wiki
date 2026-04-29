#start iterating as all tanks of a machine
data modify storage terf:temp syringe_tanks set from entity @s data.fluids
function terf:entity/player/tool/syringe/as_machine_tanks with storage terf:temp syringe_tanks[0]
