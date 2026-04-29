execute as @e[distance=..1024,type=!marker,type=!item_display,type=!block_display,type=!text_display,type=!falling_block] facing entity @s eyes run function terf:entity/explosion/nuclear/entity_raycast
function terf:require/run_n_times {n:63,command:'function terf:require/run_in_random_direction_ext {max_pitch:100000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:78,command:'function terf:require/run_in_random_direction_ext {max_pitch:200000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:63,command:'function terf:require/run_in_random_direction_ext {max_pitch:300000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:50,command:'function terf:require/run_in_random_direction_ext {max_pitch:400000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:37,command:'function terf:require/run_in_random_direction_ext {max_pitch:500000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:26,command:'function terf:require/run_in_random_direction_ext {max_pitch:600000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:17,command:'function terf:require/run_in_random_direction_ext {max_pitch:700000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:10,command:'function terf:require/run_in_random_direction_ext {max_pitch:800000,command:"function terf:entity/explosion/nuclear/raycast"}'}
function terf:require/run_n_times {n:5,command:'function terf:require/run_in_random_direction {command:"function terf:entity/explosion/nuclear/raycast"}'}
