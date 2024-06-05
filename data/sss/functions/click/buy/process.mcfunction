#> sss:click/buy/process
#
#   # 購入成功時処理
#
# @within function sss:click/buy/

# ポイント減算
    scoreboard players operation @s point -= _ sss
# 合計購入金額に加算
    scoreboard players operation 合計購入金額 sss += _ sss
# item give
    loot give @s mine 588 71 -547 debug_stick
# playsound
    playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2