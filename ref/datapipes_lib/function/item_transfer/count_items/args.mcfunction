$execute store result score count datapipes_lib run data get storage datapipes_lib:temp temp[{id:'$(id)'}].count
$scoreboard players add count datapipes_lib $(count)
$execute store result storage datapipes_lib:temp temp[{id:'$(id)'}].count int 1 run scoreboard players get count datapipes_lib
