$kill @e[tag=terf_assembler,type=minecraft:item_display,tag=terf_related_$(machine_id)]

setblock ^-2 ^6 ^-3 polished_blackstone
setblock ^-1 ^6 ^-3 granite_slab[type=bottom]
setblock ^ ^6 ^-3 granite_slab[type=bottom]
setblock ^1 ^6 ^-3 granite_slab[type=bottom]
setblock ^2 ^6 ^-3 granite_slab[type=bottom]
setblock ^3 ^6 ^-3 polished_blackstone

setblock ^-2 ^6 ^-2 granite_slab[type=bottom]
setblock ^-1 ^6 ^-2 granite_slab[type=bottom]
setblock ^ ^6 ^-2 granite_slab[type=bottom]
setblock ^1 ^6 ^-2 granite_slab[type=bottom]
setblock ^2 ^6 ^-2 granite_slab[type=bottom]
setblock ^3 ^6 ^-2 granite_slab[type=bottom]

setblock ^-2 ^6 ^-1 granite_slab[type=bottom]
setblock ^-1 ^6 ^-1 granite_slab[type=bottom]
setblock ^ ^6 ^-1 granite_slab[type=bottom]
setblock ^1 ^6 ^-1 granite_slab[type=bottom]
setblock ^2 ^6 ^-1 granite_slab[type=bottom]
setblock ^3 ^6 ^-1 granite_slab[type=bottom]

setblock ^-2 ^6 ^ granite_slab[type=bottom]
setblock ^-1 ^6 ^ granite_slab[type=bottom]
setblock ^ ^6 ^ granite_slab[type=bottom]
setblock ^1 ^6 ^ granite_slab[type=bottom]
setblock ^2 ^6 ^ granite_slab[type=bottom]
setblock ^3 ^6 ^ granite_slab[type=bottom]

setblock ^-2 ^6 ^1 granite_slab[type=bottom]
setblock ^-1 ^6 ^1 granite_slab[type=bottom]
setblock ^ ^6 ^1 granite_slab[type=bottom]
setblock ^1 ^6 ^1 granite_slab[type=bottom]
setblock ^2 ^6 ^1 granite_slab[type=bottom]
setblock ^3 ^6 ^1 granite_slab[type=bottom]

setblock ^-2 ^6 ^2 polished_blackstone
setblock ^-1 ^6 ^2 granite_slab[type=bottom]
setblock ^ ^6 ^2 granite_slab[type=bottom]
setblock ^1 ^6 ^2 granite_slab[type=bottom]
setblock ^2 ^6 ^2 granite_slab[type=bottom]
setblock ^3 ^6 ^2 polished_blackstone

$setblock ^-2 ^6 ^3 piston[facing=$(RTMnorth)]
$setblock ^-1 ^6 ^3 piston[facing=$(RTMnorth)]
$setblock ^ ^6 ^3 piston[facing=$(RTMnorth)]
$setblock ^1 ^6 ^3 piston[facing=$(RTMnorth)]
$setblock ^2 ^6 ^3 piston[facing=$(RTMnorth)]
$setblock ^3 ^6 ^3 piston[facing=$(RTMnorth)]

$setblock ^-2 ^6 ^-4 piston[facing=$(RTMsouth)]
$setblock ^-1 ^6 ^-4 piston[facing=$(RTMsouth)]
$setblock ^ ^6 ^-4 piston[facing=$(RTMsouth)]
$setblock ^1 ^6 ^-4 piston[facing=$(RTMsouth)]
$setblock ^2 ^6 ^-4 piston[facing=$(RTMsouth)]
$setblock ^3 ^6 ^-4 piston[facing=$(RTMsouth)]

$setblock ^-3 ^6 ^-3 piston[facing=$(RTMeast)]
$setblock ^-3 ^6 ^-2 piston[facing=$(RTMeast)]
$setblock ^-3 ^6 ^-1 piston[facing=$(RTMeast)]
$setblock ^-3 ^6 ^ piston[facing=$(RTMeast)]
$setblock ^-3 ^6 ^1 piston[facing=$(RTMeast)]
$setblock ^-3 ^6 ^2 piston[facing=$(RTMeast)]

$setblock ^4 ^6 ^-3 piston[facing=$(RTMwest)]
$setblock ^4 ^6 ^-2 piston[facing=$(RTMwest)]
$setblock ^4 ^6 ^-1 piston[facing=$(RTMwest)]
$setblock ^4 ^6 ^ piston[facing=$(RTMwest)]
$setblock ^4 ^6 ^1 piston[facing=$(RTMwest)]
$setblock ^4 ^6 ^2 piston[facing=$(RTMwest)]

setblock ^4 ^6 ^3 anvil
setblock ^-3 ^6 ^3 anvil

setblock ^4 ^6 ^-4 anvil
setblock ^-3 ^6 ^-4 anvil

$setblock ^4 ^6 ^4 iron_trapdoor[open=true,facing=$(RTMsouth)]
$setblock ^-3 ^6 ^4 iron_trapdoor[open=true,facing=$(RTMsouth)]

$setblock ^4 ^6 ^-5 iron_trapdoor[open=true,facing=$(RTMnorth)]
$setblock ^-3 ^6 ^-5 iron_trapdoor[open=true,facing=$(RTMnorth)]

$setblock ^5 ^6 ^3 iron_trapdoor[open=true,facing=$(RTMeast)]
$setblock ^5 ^6 ^-4 iron_trapdoor[open=true,facing=$(RTMeast)]

$setblock ^-4 ^6 ^3 iron_trapdoor[open=true,facing=$(RTMwest)]
$setblock ^-4 ^6 ^-4 iron_trapdoor[open=true,facing=$(RTMwest)]
