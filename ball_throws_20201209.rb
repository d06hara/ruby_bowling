#===================
# 共通の定数
#===================

FINISH_FRAME = 10

#---------------------

class BallThrow

  # クラス定数
  MAX_PINS = 10
  STRIKE = 10
  SPARE = 10
  MAX_FRAME = 10
  STRIKE_ELEMENT = 1
  SPARE_ELEMENTS = 2

  # クラス変数
  @@total_scores = []
  @@total_frames = 0

  # 確認用のアクセサ
  attr_accessor :score
  attr_accessor :scores
  attr_accessor :remaining_pins

  # 初期化
  def initialize(score = 0, scores = [], remaining_pins = 10)
    @score = score
    @scores = scores
    @remaining_pins = remaining_pins
    @@total_scores
    # total_framesはインスタンス生成するたびに1をたす
    @@total_frames += 1
  end

  # 残りのピンに対し球を投げる
  def one_throw
    @score = rand(0..@remaining_pins)
  end

  # 投げられた球を受け取って記入
  def fill_in_score
    @scores.push(@score)
  end

  # フレームスコアを合計スコアに入れる
  def scores_to_total_scores
    @@total_scores.push(@scores)
  end

  # 残りのピンを計算する
  def calc_pins
    (last_frame? && (strike? || spare?)) ? @remaining_pins = MAX_PINS : @remaining_pins = MAX_PINS - @score
  end

  # スコアの合計を計算する
  def sum_scores
    @scores.sum
  end

  # ストライクを判定する
  def strike?
    @scores.sum == STRIKE && @scores.length == STRIKE_ELEMENT ? true : false
  end

  # スペアを判定する
  def spare?
    @scores.sum == SPARE && @scores.length == SPARE_ELEMENTS ? true : false
  end
  
  # フレームの終了を判定する (最終フレーム以外はstrikeになった時、最終フレームは2投の合計が10以下の時)
  def finish_frame?
    (!(last_frame?) && strike?) || (last_frame? && (@scores.length == SPARE_ELEMENTS && sum_scores < SPARE)) ? true : false
  end

  # 最終フレームの判定
  def last_frame?
    @@total_frames == MAX_FRAME ? true : false
  end

end
