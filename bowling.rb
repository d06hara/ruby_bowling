# ボウリングゲーム

# --ルール
# 全１０フレーム
# 1~9フレーム：２投、10フレーム：３投
# 1~9フレームは、ストライクだったら1投,1~9フレームは、ストライクだったら、後の2投を加算する,1~9フレームは、スペアだったら、後の1投を加算する
# 10 フレームは、1,2投目で、10ピン倒したら、3投目が投げられる。

# -----ファイルの読み込み----------

require './ball_throws_20201209.rb' #投球クラス

# ------------------------------



# class Bowling
#   ### TODO
# end

# bowling = new Bowling
# bowling.xxxxx 


(1..FINISH_FRAME).each do |frame|

  # インスタンス化
  ball_throw = BallThrow.new
  # フレーム数によって最大投球数を変える
  max_throw = (ball_throw.last_frame?) ? 3 : 2

  (1..max_throw).each do |throws|
    ball_throw.calc_pins #残りの球を計算する
    ball_throw.one_throw #球を投げる
    ball_throw.fill_in_score #スコアを記入する
    if (ball_throw.finish_frame?) #投球終了するかの判定
      break
    end
  end

  puts ''
  print ball_throw.scores_to_total_scores
end