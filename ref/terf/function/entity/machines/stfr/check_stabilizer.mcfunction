$execute unless block ^ ^ ^4 waxed_lightning_rod[facing=$(south)] run return fail
execute unless block ^ ^ ^5 redstone_lamp[lit=true] run return fail
execute unless block ^ ^ ^10 #terf:neth_and_barrier run return fail
execute unless block ^ ^ ^11 glowstone unless score @s terf_data_A matches 8 unless score @s terf_data_A matches 13 run return fail
execute unless block ^ ^ ^12 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^ ^ ^13 #terf:valid_stfr_stabilizer_blocks run return fail

execute unless block ^ ^1 ^5 andesite_stairs run return fail
execute unless block ^ ^-1 ^5 andesite_stairs run return fail
execute unless block ^1 ^1 ^5 andesite_stairs run return fail
execute unless block ^1 ^-1 ^5 andesite_stairs run return fail
execute unless block ^-1 ^1 ^5 andesite_stairs run return fail
execute unless block ^-1 ^-1 ^5 andesite_stairs run return fail

execute unless block ^1 ^1 ^7 andesite_stairs run return fail
execute unless block ^1 ^-1 ^7 andesite_stairs run return fail
execute unless block ^-1 ^1 ^7 andesite_stairs run return fail
execute unless block ^-1 ^-1 ^7 andesite_stairs run return fail
execute positioned ^ ^1 ^7 unless block ~ ~ ~ andesite_stairs unless block ~ ~ ~ petrified_oak_slab[type=double] run return fail
execute positioned ^ ^-1 ^7 unless block ~ ~ ~ andesite_stairs unless block ~ ~ ~ petrified_oak_slab[type=double] run return fail
execute positioned ^1 ^ ^7 unless block ~ ~ ~ andesite_stairs unless block ~ ~ ~ petrified_oak_slab[type=double] run return fail
execute positioned ^-1 ^ ^7 unless block ~ ~ ~ andesite_stairs unless block ~ ~ ~ petrified_oak_slab[type=double] run return fail

execute positioned ^ ^1 ^6 unless block ~ ~ ~ polished_blackstone unless block ~ ~ ~ barrier run return fail
execute positioned ^ ^-1 ^6 unless block ~ ~ ~ polished_blackstone unless block ~ ~ ~ barrier run return fail
execute positioned ^1 ^ ^6 unless block ~ ~ ~ polished_blackstone unless block ~ ~ ~ barrier run return fail
execute positioned ^-1 ^ ^6 unless block ~ ~ ~ polished_blackstone unless block ~ ~ ~ barrier run return fail
execute positioned ^1 ^1 ^6 unless block ~ ~ ~ polished_blackstone_stairs unless block ~ ~ ~ polished_blackstone run return fail
execute positioned ^1 ^-1 ^6 unless block ~ ~ ~ polished_blackstone_stairs unless block ~ ~ ~ polished_blackstone run return fail
execute positioned ^-1 ^1 ^6 unless block ~ ~ ~ polished_blackstone_stairs unless block ~ ~ ~ polished_blackstone run return fail
execute positioned ^-1 ^-1 ^6 unless block ~ ~ ~ polished_blackstone_stairs unless block ~ ~ ~ polished_blackstone run return fail

execute unless block ^1 ^ ^4 #terf:any_copper_trapdoor run return fail
execute unless block ^-1 ^ ^4 #terf:any_copper_trapdoor run return fail
execute unless block ^ ^1 ^4 #terf:any_copper_trapdoor run return fail
execute unless block ^ ^-1 ^4 #terf:any_copper_trapdoor run return fail

$execute unless block ^2 ^ ^4 observer[facing=$(south)] run return fail
$execute unless block ^-2 ^ ^4 observer[facing=$(south)] run return fail
$execute unless block ^ ^2 ^4 observer[facing=$(south)] run return fail
$execute unless block ^ ^-2 ^4 observer[facing=$(south)] run return fail

$execute unless block ^2 ^ ^5 piston[facing=$(north)] run return fail
$execute unless block ^-2 ^ ^5 piston[facing=$(north)] run return fail
$execute unless block ^ ^2 ^5 piston[facing=$(north)] run return fail
$execute unless block ^ ^-2 ^5 piston[facing=$(north)] run return fail

execute unless block ^1 ^ ^8 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^-1 ^ ^8 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^ ^1 ^8 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^ ^-1 ^8 #terf:valid_stfr_stabilizer_blocks run return fail

$execute positioned ^2 ^ ^3 unless block ~ ~ ~ waxed_lightning_rod[facing=$(south)] unless block ~ ~ ~ barrier run return fail
$execute positioned ^-2 ^ ^3 unless block ~ ~ ~ waxed_lightning_rod[facing=$(south)] unless block ~ ~ ~ barrier run return fail
$execute positioned ^ ^2 ^3 unless block ~ ~ ~ waxed_lightning_rod[facing=$(south)] unless block ~ ~ ~ barrier run return fail
$execute positioned ^ ^-2 ^3 unless block ~ ~ ~ waxed_lightning_rod[facing=$(south)] unless block ~ ~ ~ barrier run return fail

execute unless block ^1 ^ ^10 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^-1 ^ ^10 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^ ^1 ^10 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^ ^-1 ^10 #terf:stfr_stabilizer_rotor_copper run return fail

execute unless block ^1 ^ ^9 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^-1 ^ ^9 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^ ^1 ^9 #terf:stfr_stabilizer_rotor_copper run return fail
execute unless block ^ ^-1 ^9 #terf:stfr_stabilizer_rotor_copper run return fail

execute unless block ^1 ^1 ^10 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^-1 ^1 ^10 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^1 ^-1 ^10 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^-1 ^-1 ^10 #terf:stfr_stabilizer_rotor_stairs run return fail

execute unless block ^1 ^1 ^9 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^-1 ^1 ^9 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^1 ^-1 ^9 #terf:stfr_stabilizer_rotor_stairs run return fail
execute unless block ^-1 ^-1 ^9 #terf:stfr_stabilizer_rotor_stairs run return fail

execute unless block ^1 ^ ^11 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^-1 ^ ^11 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^ ^1 ^11 #terf:valid_stfr_stabilizer_blocks run return fail
execute unless block ^ ^-1 ^11 #terf:valid_stfr_stabilizer_blocks run return fail

$execute unless block ^1 ^ ^12 waxed_lightning_rod[facing=$(east)] run return fail
$execute unless block ^-1 ^ ^12 waxed_lightning_rod[facing=$(west)] run return fail
$execute unless block ^ ^1 ^12 waxed_lightning_rod[facing=$(up)] run return fail
$execute unless block ^ ^-1 ^12 waxed_lightning_rod[facing=$(down)] run return fail

$execute unless block ^1 ^ ^13 waxed_lightning_rod[facing=$(east)] run return fail
$execute unless block ^-1 ^ ^13 waxed_lightning_rod[facing=$(west)] run return fail
$execute unless block ^ ^1 ^13 waxed_lightning_rod[facing=$(up)] run return fail
$execute unless block ^ ^-1 ^13 waxed_lightning_rod[facing=$(down)] run return fail

$tag @s add $(tag)