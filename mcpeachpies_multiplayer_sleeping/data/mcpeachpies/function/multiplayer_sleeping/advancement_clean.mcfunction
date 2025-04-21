#Debug clean
execute unless score @s mpp_sleep_adv = @s mpp_sleep_adv run advancement revoke @s from mcpeachpies:multiplayer_sleeping/the_wake_up_call
execute unless score @s mpp_sleep_adv = @s mpp_sleep_adv run advancement revoke @s from mcpeachpies:multiplayer_sleeping/the_courtesy_call

advancement revoke @s[scores={mpp_sleep_adv=0}] from mcpeachpies:multiplayer_sleeping/the_wake_up_call
advancement revoke @s[scores={mpp_sleep_adv=0}] from mcpeachpies:multiplayer_sleeping/the_courtesy_call