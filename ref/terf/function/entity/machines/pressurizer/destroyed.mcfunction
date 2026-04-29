execute if score @s terf_data_A matches -1 run function terf:entity/machines/pressurizer/depressurize with entity @s data.terf
$data remove storage terf:constants pressurizer_storage.$(machine_id)
