$data merge entity @s {data:{terf:{rid:$(rid)}},Tags:["terf_related_$(machine_id)","terf_receptacle","terf_receptacle_$(rid)","terf_drop_when_destroyed"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,1f],scale:[1f,1f,1f]}}
data modify entity @s Rotation set from storage terf:temp args.Rotation
item replace entity @s container.0 from entity 0010ccd2-0010-cd37-0010-cd360010c8e1 container.0
