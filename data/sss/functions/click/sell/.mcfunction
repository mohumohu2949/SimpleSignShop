#> sss:click/sell/
#
#   # 看板クリック時処理(売却)
#
# @within function sss:setting/modify/sell

# 額縁のアイテムをストレージに移す
    execute positioned ~ ~1 ~ run data modify storage sss: Sell set from entity @e[type=item_frame,sort=nearest,limit=1] Item
    $data modify storage sss: Sell.Count set value $(Count)
    $data modify storage sss: Sell.value set value $(value)
# tagがなかった時は適当なやつ入れとく
    execute unless data storage sss: Sell.tag run data modify storage sss: Sell.tag set value "" 
# 個数検出
    function sss:click/sell/count with storage sss: Sell
# 必要な個数がなければエラー
    $execute unless score _ sss matches $(Count).. run tellraw @s [{"text": "アイテムが足りません","color": "red"}]
    $execute unless score _ sss matches $(Count).. run playsound minecraft:block.note_block.bass master @s ~ ~ ~ 1 1
# 必要な個数があれば処理
    $execute if score _ sss matches $(Count).. run function sss:click/sell/process with storage sss: Sell

# reset
    data remove storage sss: Sell
    scoreboard players reset _ sss