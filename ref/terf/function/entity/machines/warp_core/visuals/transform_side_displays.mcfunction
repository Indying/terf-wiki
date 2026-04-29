$data merge entity @s[tag=terf_warp_core_vfx_hor_z_pos_scale] {interpolation_duration:30,start_interpolation:0,transformation:{scale:[$(Daxis_x)f,$(Uaxis_y)f,1f]}}
$data merge entity @s[tag=terf_warp_core_vfx_hor_z_neg_scale] {interpolation_duration:30,start_interpolation:0,transformation:{scale:[-$(Daxis_x)f,$(Uaxis_y)f,1f]}}
$data merge entity @s[tag=terf_warp_core_vfx_hor_x_pos_scale] {interpolation_duration:30,start_interpolation:0,transformation:{scale:[$(Daxis_z)f,$(Uaxis_y)f,1f]}}
$data merge entity @s[tag=terf_warp_core_vfx_hor_x_neg_scale] {interpolation_duration:30,start_interpolation:0,transformation:{scale:[-$(Daxis_z)f,$(Uaxis_y)f,1f]}}

$data merge entity @s[tag=terf_warp_core_vfx_hor_x_top] {interpolation_duration:30,start_interpolation:0,transformation:{translation:[0f,$(Haxis_y)f,$(axis_x)f]}}
$data merge entity @s[tag=terf_warp_core_vfx_hor_z_top] {interpolation_duration:30,start_interpolation:0,transformation:{translation:[0f,$(Haxis_y)f,$(axis_z)f]}}

$data merge entity @s[tag=terf_warp_core_vfx_hor_x_bottom] {interpolation_duration:30,start_interpolation:0,transformation:{translation:[0f,-$(Haxis_y)f,$(axis_x)f]}}
$data merge entity @s[tag=terf_warp_core_vfx_hor_z_bottom] {interpolation_duration:30,start_interpolation:0,transformation:{translation:[0f,-$(Haxis_y)f,$(axis_z)f]}}
