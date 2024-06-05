#> sss:setting/modify/sell
#
#   # 看板変更(売却)
#
# @within function sss:setting/get.data

# テキスト発光
    data modify block ~ ~ ~ front_text.has_glowing_text set value true
# テキスト変更不可に
    #data modify block ~ ~ ~ is_waxed set value true

# 一行目は消す
    data modify block ~ ~ ~ front_text.messages[0] set value '{"text":""}'
# 二行目にアイテム名
    $data modify block ~ ~ ~ front_text.messages[1] set value '{"text":"売却($(Count)個)","clickEvent":{"action":"run_command","value":"/function sss:click/sell/ {Count:$(Count),value:$(value)}"}}'
# 三行目に価格    
    $data modify block ~ ~ ~ front_text.messages[2] set value '{"text":"$(value)ポイント"}'
# 四行目は消す
    data modify block ~ ~ ~ front_text.messages[3] set value '{"text":""}'