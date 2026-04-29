tag @s remove terf_currententity

#visuals
$title @a[distance=..$(power),tag=!terf_epilepsy_mode] times 3 0 3s
$title @a[distance=..$(power),tag=!terf_epilepsy_mode] title "\ueff4"

#far sound effects
$execute if score power terf_states matches 420 run playsound terf:explosion.atomfegyver master @a[distance=0..] ~ ~ ~ $(far_volume) 0

$playsound terf:explosion.explosion_far2 master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$playsound terf:explosion.explosion_far2 master @a[distance=0..] ~ ~ ~ $(far_volume) 0

$execute if score power terf_states matches 100.. run playsound terf:explosion.explosion_far master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 100.. run playsound terf:explosion.explosion_far master @a[distance=0..] ~ ~ ~ $(far_volume) 0

$execute if score power terf_states matches 50.. run playsound terf:explosion.tank_shot master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 50.. run playsound terf:explosion.tank_shot master @a[distance=0..] ~ ~ ~ $(far_volume) 0

$execute if score power terf_states matches 100.. run playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 100.. run playsound terf:explosion.huge_explosion master @a[distance=0..] ~ ~ ~ $(far_volume) 0

$execute if score power terf_states matches 300.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 500.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 700.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 900.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 1100.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 1300.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 1500.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 1700.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0
$execute if score power terf_states matches 1900.. run playsound terf:explosion.thunder master @a[distance=0..] ~ ~ ~ $(far_volume) 0

#close sound effects
$execute if score power terf_states matches 1500.. run return run playsound terf:explosion.reactorexplosion master @a[distance=0..] ~ ~ ~ $(volume) 2
$execute if score power terf_states matches 1000.. run return run playsound terf:explosion.demcollapse master @a[distance=0..] ~ ~ ~ $(volume) 0
$execute if score power terf_states matches 800.. run return run playsound terf:explosion.pressuregigaboom master @a[distance=0..] ~ ~ ~ $(volume) 1
$execute if score power terf_states matches 300.. run return run playsound terf:explosion.emrcollapse master @a[distance=0..] ~ ~ ~ $(volume) 1
$execute if score power terf_states matches 150.. run return run playsound terf:explosion.mega_explosion master @a ~ ~ ~ $(volume) 0
$execute if score power terf_states matches 100.. run return run playsound terf:explosion.missile master @a[distance=0..] ~ ~ ~ $(volume) 1
$execute if score power terf_states matches 50.. run return run playsound terf:explosion.bang master @a[distance=0..] ~ ~ ~ $(volume) .7

$playsound terf:explosion.bang2 master @a[distance=0..] ~ ~ ~ $(volume) .8
