$execute unless entity @e[type=item_display,tag=terf_owner_$(player_id)] run return run summon item_display ~ ~ ~ {Tags:["terf_custom_button","terf_owner_$(player_id)"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]},item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/selection_cube"}},brightness:{sky:12,block:12}}

#get data
$data modify storage terf:temp temp set from entity @n[type=item_display,tag=terf_owner_$(player_id)] transformation

#fail if size is 0 in any axis
execute store result score temp terf_states run data get storage terf:temp temp.scale[0] 16
execute if score temp terf_states matches 0 run return fail
execute store result score temp terf_states run data get storage terf:temp temp.scale[1] 16
execute if score temp terf_states matches 0 run return fail
execute store result score temp terf_states run data get storage terf:temp temp.scale[2] 16
execute if score temp terf_states matches 0 run return fail

#==========| turn selection into button
data modify storage terf:temp args set value {x:0,y:0,z:0,iy:0,width:0,height:0}

#since interactions are not centered height wise, "height" is height unless y translation is negative
execute store result score iy terf_states run data get storage terf:temp temp.translation[1] 32
execute if score iy terf_states matches ..-1 store result storage terf:temp args.iy float 0.0625 run data get storage terf:temp temp.translation[1] 32

execute store result storage terf:temp args.x float 0.03125 run data get storage terf:temp temp.translation[0] 32
execute store result storage terf:temp args.y float 0.03125 run data get storage terf:temp temp.translation[1] 32
execute if score iy terf_states matches ..-1 store result storage terf:temp args.y float 0.03125 run data get storage terf:temp temp.translation[1] -32
execute store result storage terf:temp args.z float 0.03125 run data get storage terf:temp temp.translation[2] 32

execute store result storage terf:temp args.width float 0.0625 run data get storage terf:temp temp.scale[0] 16
execute store result storage terf:temp args.height float 0.0625 run data get storage terf:temp temp.scale[1] 16
$execute at @n[type=item_display,tag=terf_owner_$(player_id)] run function terf:entity/player/tool/custom_button/activated/at_pos_args with storage terf:temp args

$kill @n[type=item_display,tag=terf_owner_$(player_id)]