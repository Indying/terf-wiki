scoreboard players operation time terf_states = @s terf_data_E
scoreboard players remove time terf_states 7840
scoreboard players operation time terf_states /= -1 terf_states
execute if score time terf_states matches ..-1 run scoreboard players set time terf_states 0

#tick to M:SS:TT
scoreboard players operation T2 terf_states = time terf_states
scoreboard players operation T2 terf_states %= 20 terf_states
scoreboard players set T1 terf_states 0
execute if score T2 terf_states matches 10.. run scoreboard players reset T1 terf_states

scoreboard players operation S2 terf_states = time terf_states
scoreboard players operation S2 terf_states /= 20 terf_states
scoreboard players operation S2 terf_states %= 60 terf_states
scoreboard players set S1 terf_states 0
execute if score S2 terf_states matches 10.. run scoreboard players reset S1 terf_states

scoreboard players operation M terf_states = time terf_states
scoreboard players operation M terf_states /= 1200 terf_states

execute if score T2 terf_states matches 0 run playsound terf:alarms.beep master @a[distance=0..] ~ ~ ~ 1 2

#countdowns
data merge block ^-1 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^ ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-4 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-3 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-2 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^1 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^2 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^3 ^4 ^-1 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-3 ^3 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-4 ^3 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-5 ^3 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"CORE DETONATION","color":"red"},[{"text":"IN T-","color":"red"},{"score":{"objective":"terf_states","name":"M"},"color":"red"},{"text":":"},{"score":{"objective":"terf_states","name":"S1"},"color":"red"},{"score":{"objective":"terf_states","name":"S2"},"color":"red"},{"text":":","color":"red"},{"score":{"objective":"terf_states","name":"T1"},"color":"red"},{"score":{"objective":"terf_states","name":"T2"},"color":"red"}],{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}

#infos
data merge block ^3 ^4 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"}]}}
data merge block ^2 ^4 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"}]}}
data merge block ^1 ^4 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"}]}}
data merge block ^ ^4 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"}]}}
data merge block ^-1 ^4 ^2 {front_text:{color:red,messages:[{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"}]}}

data merge block ^3 ^3 ^2 {front_text:{color:yellow,messages:[{"text":"Required Actions:"},{"text":"! DO NOT !","color":"gold"},{"text":"DISCONNECT THE","color":"gold"},{"text":"COOLING SYSTEM!","color":"gold"}]}}
data merge block ^2 ^3 ^2 {front_text:{color:orange,messages:[{"text":"Connect Up At","color":"gold"},{"text":"Least 4 Of The","color":"gold"},{"text":"Stabilizers To","color":"gold"},{"text":"The Power Grid","color":"gold"}]}}
data merge block ^1 ^3 ^2 {front_text:{color:orange,messages:[{"text":"And Give Them","color":"gold"},{"text":"100 MW Each!","color":"gold"},{"text":"The Core Systems","color":"gold"},{"text":"Will Try To","color":"gold"}]}}
data merge block ^ ^3 ^2 {front_text:{color:orange,messages:[{"text":"Re-Project","color":"gold"},{"text":"The Shield And","color":"gold"},{"text":"Get The Reactor","color":"gold"},{"text":"To A Stable State.","color":"gold"}]}}
data merge block ^-1 ^3 ^2 {front_text:{color:orange,messages:[{"text":"You Have Until","color":"gold"},{"text":"The Emergency","color":"gold"},{"text":"Capacitor Runs","color":"gold"},{"text":"Out","color":"gold"}]}}

data merge block ^3 ^2 ^2 {front_text:{color:red,messages:[{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^2 ^2 ^2 {front_text:{color:red,messages:[{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^1 ^2 ^2 {front_text:{color:red,messages:[{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^ ^2 ^2 {front_text:{color:red,messages:[{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
data merge block ^-1 ^2 ^2 {front_text:{color:red,messages:[{"text":"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!","color":"red"},{"text":"SHIELD CREATION","color":"red"},{"text":"FAILURE!","color":"red"},{"text":"⚠⚠⚠⚠⚠⚠⚠⚠⚠"}]}}
