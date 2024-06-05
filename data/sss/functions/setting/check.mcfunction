#> sss:setting/check
#
#   # 看板に設定できるかチェック
#
# @public

# 看板のデータを移動
    data modify storage sss: Sign set from block ~ ~ ~ front_text
# チェックボックスにデータを抽出
    data modify storage sss: Check.1 set string storage sss: Sign.messages[0] 9 -2
    data modify storage sss: Check.2 set string storage sss: Sign.messages[1] 9 -2
    data modify storage sss: Check.3 set string storage sss: Sign.messages[2] 9 -2
    data modify storage sss: Check.4 set string storage sss: Sign.messages[3] 9 -2
# 判定用トリガーon
    data modify storage sss: Check.Trigger set value true

# 一行目に「func」があるか
    execute unless data storage sss: Check{1:"func"} run data modify storage sss: Check.Trigger set value false
    execute unless data storage sss: Check{1:"func"} run tellraw @s [{"text": "Error","color": "red"},{"text": "：引数が足りません"},{"text": " ( func )","color": "yellow"}]
# 二行目に価格が設定されているか
    execute unless data storage sss: Check.2 run data modify storage sss: Check.Trigger set value false
    execute unless data storage sss: Check.2 run tellraw @s [{"text": "Error","color": "red"},{"text": "：引数が足りません"},{"text": " ( value )","color": "yellow"}]
# 三行目に個数が設定されているか
    execute unless data storage sss: Check.3 run data modify storage sss: Check.Trigger set value false
    execute unless data storage sss: Check.3 run tellraw @s [{"text": "Error","color": "red"},{"text": "：引数が足りません"},{"text": " ( Count )","color": "yellow"}]
# 四行目に方法が記述されているか
    execute unless data storage sss: Check{4:"buy"} unless data storage sss: Check{4:"sell"} run data modify storage sss: Check.Trigger set value false
    execute unless data storage sss: Check{4:"buy"} unless data storage sss: Check{4:"sell"} run tellraw @s [{"text": "Error","color": "red"},{"text": "：引数が足りません"},{"text": " ( buy or sell )","color": "yellow"}]

# 額縁にアイテムがあるか
    execute positioned ~ ~1 ~ unless data entity @e[type=item_frame,sort=nearest,limit=1] Item run data modify storage sss: Check.Trigger set value false
    execute positioned ~ ~1 ~ unless data entity @e[type=item_frame,sort=nearest,limit=1] Item run tellraw @s [{"text": "Error","color": "red"},{"text": "：額縁にアイテムをセットしてください"},{"text": " ( Item )","color": "yellow"}]

# 全て成功で実行
    execute if data storage sss: Check{Trigger:true} run function sss:setting/get.data

# reset
    data remove storage sss: Check
    data remove storage sss: Sign