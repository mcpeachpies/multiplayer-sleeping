# player with sleep_since_rest score above zero
# @s = player out of bed
# run from clock

execute if predicate mcpeachpies:multiplayer_sleeping/morning_check run function mcpeachpies:multiplayer_sleeping/advancement_count

#Daylight control link
function mcpeachpies:multiplayer_sleeping/gamerule_set_false

tag @s[tag=mpp_sleep_advlate] remove mpp_sleep_advlate
tag @s remove mpp_in_bed
function mcpeachpies:multiplayer_sleeping/player_count

execute unless score value_gamerule mpp_sleep_count > value_100 mpp_sleep_count run tellraw @a[scores={mpp_sleep_awake=0}] ["",{selector:"@s"},{text:" is no longer sleeping (",color:"gray"},{score:{name:"value_sleepers",objective:"mpp_sleep_count"}},{text:"/",color:"gray"},{score:{name:"value_required",objective:"mpp_sleep_count"}},{text:")",color:"gray"}]

execute if score value_gamerule mpp_sleep_count > value_100 mpp_sleep_count run tellraw @a[scores={mpp_sleep_awake=0}] ["",{selector:"@s"},{text:" is no longer sleeping (",color:"gray"},{text:"Sleeping disabled",color:"white",hover_event:{action:"show_text",value:[{text:"No amount of rest can pass this night",color:"white"}]}},{text:")",color:"gray"}]