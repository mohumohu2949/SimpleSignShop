#> sss:click/buy/
#
#   # 看板クリック時処理(購入)
#
# @within function sss:setting/modify/buy

# アイテム投下
    execute in overworld positioned ~ ~1 ~ run item replace block 2949 -64 2949 container.0 from entity @e[type=item_frame,sort=nearest,limit=1] container.0
# data modify
    $execute in overworld run data modify block 2949 -64 2949 Items[0].Count set value $(Count)

# マクロめんどいのでスコア移動
    $scoreboard players set _ sss $(value)
# mohuタグ付いてたら無料
    execute if entity @s[tag=mohu] run scoreboard players set _ sss 0
# 購入不可の場合
    execute if score @s point < _ sss run tellraw @s [{"text": "ポイントが足りません","color": "red"}]
    execute if score @s point < _ sss run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 1
# 購入可能なら実行
    execute if score @s point >= _ sss run function sss:click/buy/process
# reset
    scoreboard players reset _ sss