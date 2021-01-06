# -----ファイルの読み込み----------

require './property.rb' #定数のモジュール
require './bowling_class.rb' #bowlingクラス
require './score.rb' #scoreクラス
require './judge_score.rb' #judge_scoreクラス
require './manage_score.rb' #manage_scoreクラス

# ------------------------------


# -----メイン処理----------

bowling = Bowling.new

(bowling.first_frame..bowling.last_frame).each do |frame|
  # フレームをクラスに読み込ませる
  bowling.frame = frame

  #投球処理
  score = Score.new
  judge_score = JudgeScore.new
  manage_score = ManageScore.new

  #最大投球数
  last_throw = (frame == bowling.last_frame) ? 3 : 2

  (bowling.first_throw..last_throw).each do |throw|
    score.calc_remaining_pins(bowling.frame)  #場にあるピンを計算
    score.ball_throw #球を投げる
    score.score_to_frame_score #フレームスコアに入れる
    judge_score.frame_score = score.frame_score #判定用クラスに読み込ませる
    # 投球を終わるか判定(最終フレームは２投の合計が10以下、それ以外のフレームはストライクの場合)
    if(bowling.last_frame? && judge_score.last_frame_two_throw?) || (!(bowling.last_frame?) && judge_score.strike?)
      break
    end
  end

  manage_score.total_score.push(score.frame_score)

  #加点処理

  #1フレーム目はスキップ
  if frame == bowling.first_frame
    next
  end

  #前のフレームスコアを確認する
  #前のフレームがスペアだった場合、現在の１投目を追加
  judge_score.frame_score = manage_score.before_frame_score
  if(judge_score.spare?)
    manage_score.before_frame_score.push(score.first_throw)

  elsif(judge_score.strike?)
    #現在のスコアをチェック
    judge_score.frame_score = manage_score.now_frame_score
    if(judge_score.strike?)
      manage_score.before_frame_score.push(score.first_throw)
    else
      manage_score.before_frame_score.push(score.first_throw).push(score.second_throw)
    end
  end

  # ダブルのチェック
  if frame >= 3
    judge_score.frame_score = manage_score.two_before_frame_score
    if(judge_score.double?)
      manage_score.two_before_frame_score.push(score.first_throw)
    end
  end

  #最終フレームでbowlingクラスに全て値を渡す(なぜかループを抜けた後にundefiendになるから)
  if frame == bowling.last_frame
    bowling.total_score = manage_score.total_score
  end

end

puts ''
print bowling.total_score
# print manage_score.total_score #直接表示させようとするとundefiendになるのはなぜ？
puts ''
puts bowling.sum_total_score

bowling.score_board