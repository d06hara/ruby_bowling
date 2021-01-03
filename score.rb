# 現在のフレームに関わる処理だけ
class Score

  # 定数をimport
  include Property

  # アクセサ
  attr_accessor :frame_score
  
  def initialize(score = 0, frame_score = [], remaining_pins = MAX_PINS)
    @score = score
    @frame_score = frame_score
    @remaining_pins = remaining_pins
  end

  def ball_throw
    @score = rand(0..@remaining_pins)
  end

  #フレームスコアにスコアを入れる
  def score_to_frame_score
    @frame_score.push(@score)
  end

  #残りのピンを計算する(frameによって異なる)
  def calc_remaining_pins(frame)
    frame == LAST_FRAME && @frame_score.sum == 10 ? @remaining_pins : @remaining_pins = MAX_PINS - @score
  end

  #１投目を出力
  def first_throw
    @frame_score[0]
  end

  #２投目を出力
  def second_throw
    @frame_score[1]
  end

end