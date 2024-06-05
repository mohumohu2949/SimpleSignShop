#> sss:setting/get.data
#
#   # 手持ちアイテムと看板を参照して必要なデータを取得
#
# @within function sss:setting/check

# 2行目の数字抜き取り
    data modify storage sss: Item.value set string storage sss: Sign.messages[1] 9 -2
# 3行目の数字抜き取り
    data modify storage sss: Item.Count set string storage sss: Sign.messages[2] 9 -2

## 買うか売るかで処理変更
    data modify storage sss: Item.price set string storage sss: Sign.messages[3] 9 -2
    # 買う
        execute if data storage sss: Item{price:buy} run function sss:setting/modify/buy with storage sss: Item
    # 売る
        execute if data storage sss: Item{price:sell} run function sss:setting/modify/sell with storage sss: Item
# reset
    data remove storage sss: Item