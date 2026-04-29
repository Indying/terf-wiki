#slower tick
execute if score NETratetimer terf_states >= NETrate terf_states run function terf:entity/machines/security_terminal/slower_tick

#display
execute if data block ^ ^1 ^ {front_text:{color:"gray"}} run function terf:entity/machines/security_terminal/screen_clicked
execute if score @s terf_data_A matches 1 run function terf:entity/machines/security_terminal/enter_id with entity @s data.terf
