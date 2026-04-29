#terf_data_A = ticks between hits
#terf_data_B = amount of hits
#terf_data_C = amount of blocks broken with current drill bit

#if the block below is not air nor indestructible then run:
execute if block ~ ~-3 ~ air run return run scoreboard players set @s terf_data_A 0
execute if block ~ ~-3 ~ #terf:indestructible run return run scoreboard players set @s terf_data_A 0

    scoreboard players add @s terf_data_A 1
    execute if score @s terf_data_A matches 2 if block ^ ^ ^1 minecraft:pink_glazed_terracotta run setblock ^ ^ ^1 minecraft:redstone_block
    execute if score @s terf_data_A matches 7 if block ^ ^ ^1 minecraft:redstone_block run setblock ^ ^ ^1 minecraft:pink_glazed_terracotta
    execute if score @s terf_data_A matches 10.. run scoreboard players set @s terf_data_A 0

    #when the drill bit hits the block then run:
    execute unless score @s terf_data_A matches 7 run return fail

        #if the piston is extended run:
        execute unless block ~ ~ ~ sticky_piston[extended=true] run return fail

            scoreboard players set fortune terf_states 1
            scoreboard players set durability terf_states 0
            scoreboard players set efficiency terf_states 0
            #######################################################################################################################
            #Set the properties of drill bits here
            execute if block ~ ~-2 ~ minecraft:polished_deepslate_wall run scoreboard players set fortune terf_states 1
            execute if block ~ ~-2 ~ minecraft:polished_deepslate_wall run scoreboard players set durability terf_states -1
            execute if block ~ ~-2 ~ minecraft:polished_deepslate_wall run scoreboard players set efficiency terf_states 5

            execute if block ~ ~-2 ~ minecraft:granite_wall run scoreboard players set fortune terf_states 3
            execute if block ~ ~-2 ~ minecraft:granite_wall run scoreboard players set durability terf_states 32
            execute if block ~ ~-2 ~ minecraft:granite_wall run scoreboard players set efficiency terf_states 20

            execute if block ~ ~-2 ~ minecraft:red_nether_brick_wall run scoreboard players set fortune terf_states 4
            execute if block ~ ~-2 ~ minecraft:red_nether_brick_wall run scoreboard players set durability terf_states 16
            execute if block ~ ~-2 ~ minecraft:red_nether_brick_wall run scoreboard players set efficiency terf_states 30

            execute if block ~ ~-2 ~ minecraft:resin_brick_wall run scoreboard players set fortune terf_states 3
            execute if block ~ ~-2 ~ minecraft:resin_brick_wall run scoreboard players set durability terf_states 128
            execute if block ~ ~-2 ~ minecraft:resin_brick_wall run scoreboard players set efficiency terf_states 10

            #######################################################################################################################

            #if there is a drill bit above the block then run:
            execute if score durability terf_states matches 0 run return fail
                scoreboard players add @s terf_data_B 1
                playsound minecraft:entity.item.break block @a[distance=0..] ~ ~ ~ 1 2
                playsound minecraft:entity.item.break block @a[distance=0..] ~ ~ ~ 1 0
                particle minecraft:block{block_state:"stone"} ~ ~-2 ~ 0.2 0 0.2 1 10

                #when block is supposed to break then run:
                execute unless score @s terf_data_B > efficiency terf_states run return fail
                    scoreboard players add @s terf_data_C 1
                    scoreboard players set @s terf_data_B 0
                    execute unless score durability terf_states matches -1 if score @s terf_data_C >= durability terf_states run return run function terf:entity/machines/ore_drill/break_drill_bit

                    playsound minecraft:block.stone.break block @a[distance=0..] ~ ~ ~ 1 0.7
                    playsound minecraft:block.stone.break block @a[distance=0..] ~ ~ ~ 1 0.7
                    playsound minecraft:block.stone.break block @a[distance=0..] ~ ~ ~ 1 0.7
                    playsound minecraft:block.stone.break block @a[distance=0..] ~ ~ ~ 1 0.7
                    particle minecraft:block{block_state:"stone"} ~ ~-2.5 ~ 0.2 0.2 0.2 1 100
                    data remove storage terf:temp args
                    execute store result storage terf:temp args.level int 1 run scoreboard players get fortune terf_states
                    execute positioned ~ ~-3 ~ run function terf:entity/machines/ore_drill/break with storage terf:temp args
                    setblock ~ ~-3 ~ air