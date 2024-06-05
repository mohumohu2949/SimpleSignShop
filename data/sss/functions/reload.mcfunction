#> sss:reload
#
#   # リロード時処理
#
# @within tag/function minecraft:reload

#> Scoreboard
    scoreboard objectives add point dummy "ポイント"
    scoreboard objectives add sss dummy
    tag mohumohu2949 add mohu

#> シュルカー読み込み
    execute in overworld run forceload add 2949 2949
#> シュルカー設置
    execute in overworld unless block 2949 -64 2949 minecraft:white_shulker_box run setblock 2949 -64 2949 white_shulker_box

#> Storage
# @within function sss:**
    #declare storage sss:

#> Score_holder
# @within function sss:**
    #declare score_holder _

#> メモ・閲覧用
# @within function sss:click/**/process
    #declare score_holder 合計購入金額
    #declare score_holder 合計売却金額