scoreboard players add neutron_flux terf_states 1
execute store result score temp terf_states run data get entity @s data.terf.nSpeed 1000
scoreboard players operation average_neutron_speed terf_states += temp terf_states