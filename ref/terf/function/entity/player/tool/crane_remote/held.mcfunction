execute unless data entity @s SelectedItem.components.minecraft:custom_data.terf.linked_machine run return run title @s actionbar {"text":"Right Click on a crane to bind","color":"red"}

execute if entity @s[x_rotation=70..90] if predicate datapipes_lib:pressing_sneak run return run title @s actionbar {"text":"Winch: Raise","color":"gold"}

execute if entity @s[x_rotation=70..90] run return run title @s actionbar {"text":"Winch: Lower","color":"gold"}
execute if entity @s[x_rotation=-90..-45] run return run title @s actionbar {"text":"Winch: Detach & Raise","color":"gold"}

execute if entity @s[y_rotation=-45..45] run title @s actionbar {"text":"Move: South","color":"yellow"}
execute if entity @s[y_rotation=-135..-45] run title @s actionbar {"text":"Move: East","color":"yellow"}
execute if entity @s[y_rotation=135..-135] run title @s actionbar {"text":"Move: North","color":"yellow"}
execute if entity @s[y_rotation=45..135] run title @s actionbar {"text":"Move: West","color":"yellow"}

