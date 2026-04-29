$execute store result score storage_count datapipes_lib run data get storage datapipes_lib:temp temp[{id:'$(id)'}].count
#if it cant find the item in the slot in the array, return
execute if score storage_count datapipes_lib matches 0 run return fail

$scoreboard players set count datapipes_lib $(count)

#remove from the slot count and remove from the items storage count
scoreboard players operation count datapipes_lib -= storage_count datapipes_lib
scoreboard players operation storage_count datapipes_lib = count datapipes_lib
scoreboard players operation storage_count datapipes_lib /= -1 datapipes_lib
execute if score count datapipes_lib matches 0.. run scoreboard players set storage_count datapipes_lib 0

#remove the item from the slot if slot count is 0, otherwise set its count
$execute if score count datapipes_lib matches 1.. store result storage datapipes_lib:temp Items[{Slot:$(Slot)b}].count int 1 run scoreboard players get count datapipes_lib
$execute if score count datapipes_lib matches ..0 run data remove storage datapipes_lib:temp Items[{Slot:$(Slot)b}]

#remove the item from the storage if its count is 0, otherwise set its count
$execute if score storage_count datapipes_lib matches 1.. store result storage datapipes_lib:temp temp[{id:'$(id)'}].count int 1 run return run scoreboard players get storage_count datapipes_lib
$data remove storage datapipes_lib:temp temp[{id:'$(id)'}]
