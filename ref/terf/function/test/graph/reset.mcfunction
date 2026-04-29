data modify storage terf:temp temp set value {text:"",extra:[]}
function terf:require/run_n_times {n:59,command:'data modify storage terf:temp temp.extra append value {text:"\ued00\ueefc"}'}
data modify block ~ ~ ~ front_text.messages[3] set from storage terf:temp temp
