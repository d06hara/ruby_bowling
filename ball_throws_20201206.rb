#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
# total_score = []
scores = []
# MAX_PINS = 10
# STRIKE = 10
# SPARE = 10
FINISH_FRAME = 4
# SPARE_ELEMENTS = 2
#---------------------


class BallThrow

  # クラス定数
  MAX_PINS = 10
  STRIKE = 10
  SPARE = 10
  MAX_FRAME = 4
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

  # 残りのピンを受け取ってそれに対し球を投げて返すだけ
  def one_throw
    @score = rand(0..@remaining_pins)
  end

  # 投げられた球を受け取って記入
  def fill_in_score
    @scores.push(@score)
    puts "#{@scores}"
  end
  # フレームスコアを合計スコアに入れる
  def scores_to_total_scores
    @@total_scores.push(@scores)
  end

  # 集計結果を受け取って、残りのピンを計算する
  def calc_pins
    (last_frame?) ? @remaining_pins : @remaining_pins = MAX_PINS - @score
    # frame == MAX_FRAME ? @remaining_pins : @remaining_pins = MAX_PINS - @score
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

#------------------------


(1..FINISH_FRAME).each do |frame|

  # インスタンス化
  ball_throw = BallThrow.new
  # フレーム数によって最大投球数を変える
  max_throw = (ball_throw.last_frame?) ? 3 : 2
  (1..max_throw).each do |throws|
    ball_throw.calc_pins #残りの球を計算する
    ball_throw.one_throw #球を投げる
    ball_throw.fill_in_score #スコアを記入する
    if (ball_throw.finish_frame?)
      puts '終了します'
      break
    end
  end

  puts ''
  print ball_throw.scores_to_total_scores
end
