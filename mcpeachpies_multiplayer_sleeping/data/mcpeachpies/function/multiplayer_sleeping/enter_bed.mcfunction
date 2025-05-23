# player enters bed
# run from advancement, mcpeachpies:multiplayer_sleeping/sleep
# revoke advancement for reacquisition
execute if score value_daytime mpp_sleep_count matches 18000.. run tag @s add mpp_sleep_advlate
advancement revoke @s only mcpeachpies:multiplayer_sleeping/sleep

scoreboard players set @s mpp_sleep_awake 0

execute unless score value_sleepers mpp_sleep_count matches 1.. run schedule function mcpeachpies:multiplayer_sleeping/clock 10t

#Player Count
tag @s add mpp_in_bed
function mcpeachpies:multiplayer_sleeping/player_count

execute unless score value_gamerule mpp_sleep_count > value_100 mpp_sleep_count run tellraw @a ["",{selector:"@s"},{text:" is now sleeping (",color:"gray"},{score:{name:"value_sleepers",objective:"mpp_sleep_count"}},{text:"/",color:"gray"},{score:{name:"value_required",objective:"mpp_sleep_count"}},{text:")",color:"gray"},{text:" [Kick]",color:"red",click_event:{action:"run_command",command:"/trigger mpp_sleep_kick"},hover_event:{action:"show_text",value:[{text:"Kick ",color:"red"},{selector:"@a[tag=mpp_in_bed]"},{text:" out of bed",color:"red"}]}}]

execute if score value_gamerule mpp_sleep_count > value_100 mpp_sleep_count run tellraw @a ["",{selector:"@s"},{text:" is now sleeping (",color:"gray"},{text:"Sleeping disabled",color:"white",hover_event:{action:"show_text",value:[{text:"No amount of rest can pass this night",color:"white"}]}},{text:")",color:"gray"},{text:" [Kick]",color:"red",click_event:{action:"run_command",command:"/trigger mpp_sleep_kick"},hover_event:{action:"show_text",value:[{text:"Kick ",color:"red"},{selector:"@a[tag=mpp_in_bed]"},{text:" out of bed",color:"red"}]}}]

#Sleeping players vs required check
#Daylight Control link
execute if score value_sleepers mpp_sleep_count >= value_required mpp_sleep_count run schedule function mcpeachpies:multiplayer_sleeping/gamerule_set_true 100t
#Pass time if count is valid
execute if score value_sleepers mpp_sleep_count >= value_required mpp_sleep_count run schedule function mcpeachpies:multiplayer_sleeping/pass_time 120t