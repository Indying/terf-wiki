execute unless items entity @s weapon.* #terf:explosive run return fail
summon tnt ~ ~ ~ {fuse:0}
execute if items entity @s weapon.mainhand #terf:explosive run item replace entity @s weapon.mainhand with air
execute if items entity @s weapon.offhand #terf:explosive run item replace entity @s weapon.offhand with air