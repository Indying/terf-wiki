scoreboard players set temp terf_states 0

execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[0] float 0.001 run random value 1..360000
execute store result entity 0010ccd2-0010-cd37-0010-cd360010c8e1 Rotation[1] float 0.001 run random value -90000..90000
execute rotated as 0010ccd2-0010-cd37-0010-cd360010c8e1 run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/raycast

scoreboard players add temp terf_states 5

execute if score temp terf_states matches 55.. rotated as 0010ccd2-0010-cd37-0010-cd360010c8e1 summon item_display run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/summon with storage terf:temp args

scoreboard players remove terminated terf_states 1
execute if score terminated terf_states matches 1.. run function terf:entity/machines/stfr/states/overload/shield_explosion_beams/iterate