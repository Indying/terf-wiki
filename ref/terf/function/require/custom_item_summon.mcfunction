# Default components
$data modify storage terf:temp temp set value {id:"minecraft:recovery_compass",count:$(count),components:{rarity:"common",custom_data:{id:'$(id)'},item_model:"error",item_name:"Cant find name for \"$(id)\", Please report this to datapack developers."}}
$data modify storage terf:temp temp.components merge from storage terf:constants materials.$(id)

data modify storage terf:temp temp.id set from storage terf:temp temp.components.id
data remove storage terf:temp temp.components.id

function terf:require/custom_item_summon_args with storage terf:temp temp