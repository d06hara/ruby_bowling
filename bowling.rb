# ボウリングゲーム

# -----ファイルの読み込み----------

require './ball_throws_20201215.rb' #投球クラス
require './add_score_20201215.rb' #加点クラス

# ------------------------------

class Bowling

  FIRST_FRAME = 1
  LAST_FRAME = 10

  # 最初のフレーム 呼び出し
  def first_frame
    FIRST_FRAME
  end

  #最終フレーム呼び出し
  def last_frame
    LAST_FRAME
  end

end

# -----メイン処理----------

# 変数を準備
added_total_score = [] #加点前の合計スコア
total_score = [] #加点前のスコアの集まり
# インスタンス生成
bowling = Bowling.new

(bowling.first_frame..bowling.last_frame).each do |frame|

  # ----投球処理------
  # 投球クラスインスタンス生成
  ball_throw = BallThrow.new
  # フレーム数によって最大投球数を変える
  max_throw = (ball_throw.last_frame?) ? 3 : 2
  # 投げる
  (1..max_throw).each do |throws|
    ball_throw.calc_pins #残りの球を計算する
    ball_throw.one_throw #球を投げる
    ball_throw.fill_in_score #スコアを記入する
    if (ball_throw.finish_frame?) #投球終了するかの判定
      break
    end
  end
  # 加点前合計スコアにフレームスコアを入れていく
  ball_throw.scores_to_total_scores(total_score)


  #  ---- 加点処理------
  # 加点クラスインスタンス生成
  add_score = AddScore.new([], total_score)
  add_score.frame_score_to_total_scores(added_total_score) #合計スコアにフレームスコアを入れていく

  # 最初のフレームは処理をnextする
  if frame == 1
    next
  end
  # 前のフレームを確認する

  # 前のフレームがスペアだった場合、現在のフレームの1投目を追加
  if(add_score.before_spare?)
    add_score.add_one_score_to_before_frame(added_total_score)
  end

  # # 前のフレームがストライクだった場合、現在のフレームの2投を追加、現在のフレームがストライクの場合は１投のみ追加
  if(add_score.before_strike?)
    (add_score.now_strike?) ? add_score.add_one_score_to_before_frame(added_total_score) : add_score.add_two_score_to_two_before_frame(added_total_score)
  end

  # ３フレーム以降の処理
  if frame >= 3 && (add_score.two_before_double?)
    add_score.add_one_score_to_two_before_frame(added_total_score)
  end

end

puts ''
print added_total_score
puts ''
