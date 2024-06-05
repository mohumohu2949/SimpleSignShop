#> sss:click/sell/process
#
#   # 売却成功時処理
#
# @within function sss:click/sell/

# clear
    $clear @s $(id)$(tag) $(Count)
# ポイント加算
    $scoreboard players add @s point $(value)
# 合計購入金額に加算
    $scoreboard players add 合計売却金額 sss $(value)
# playsound
    playsound minecraft:ui.button.click master @s ~ ~ ~ 1 2