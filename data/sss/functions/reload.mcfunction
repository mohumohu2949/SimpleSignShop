#> sss:reload
#
#   # リロード時処理
#
# @within tag/function minecraft:reload

# 必要なスコアボード
    scoreboard objectives add point dummy "ポイント"
    scoreboard objectives add sss dummy
    tag mohumohu2949 add mohu

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