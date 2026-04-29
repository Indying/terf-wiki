data modify entity @s transformation.scale set value [10000f,10000f,10000f]

data merge entity @s {see_through:1b,Tags:["terf_seismic_explosion"],billboard:center,view_range:1000000,item:{id:"minecraft:carrot_on_a_stick",components:{item_model:"terf:visual/seismic_blast_flash",custom_model_data:{colors:[0]}}}}
