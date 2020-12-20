#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
# total_score = []
scores = []
# MAX_PINS = 10
# STRIKE = 10
# SPARE = 10
MAX_FRAME = 4
# SPARE_ELEMENTS = 2
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
  end

  # 残りのピンを受け取ってそれに対し球を投げて返すだけ
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

  # 集計結果を受け取って、残りのピンを計算する
  def calc_pins(frame)
    frame == MAX_FRAME ? @remaining_pins : @remaining_pins = MAX_PINS - @score
    # # if frame == MAX_FRAME && (@scores.sum == STRIKE || @scores.sum == SPARE)
    # if frame == MAX_FRAME

    #   @remaining_pins
    # else
    #   # return MAX_PINS - @score #return が必要だったのはなぜ？
    #   @remaining_pins = MAX_PINS - @score #return が必要だったのはなぜ？
    # end
  end

  # ストライクを判定する
  def strike?
    @scores.sum == STRIKE && @scores.length == STRIKE_ELEMENT ? true : false
  end

  # スペアを判定する
  def spare?
    @scores.sum == SPARE && @scores.length == SPARE_ELEMENTS ? true : false
  end

end

#------------------------

# totalスコアのインスタンスを最初に生成
# collect_score = CollectScore.new

(1..MAX_FRAME).each do |frame|

  # インスタンス化
  ball_throw = BallThrow.new


  if (frame == MAX_FRAME)
    (1..3).each do |throws|
      puts '残りの球を計算する'
      ball_throw.calc_pins(frame)
  
      puts '球を投げる'
      ball_throw.one_throw
      puts 'スコアを記入する'
      ball_throw.fill_in_score

    end
  else
    (1..2).each do |throws|
      puts '残りの球を計算する'
      ball_throw.calc_pins(frame)
  
      puts '球を投げる'
      ball_throw.one_throw
      puts 'スコアを記入する'
      ball_throw.fill_in_score
      
      if(ball_throw.strike?)
        break
      end

      # 最終フレーム以外でかつスコアの合計が10であればbreak、2投目でかつスコアの合計がスペア以下の場合break
      # if (frame != MAX_FRAME && (scores.sum == (STRIKE || SPARE))) || (throws == 2 && scores.sum < SPARE)
      #   break
      # end
    end
  end

  print ball_throw.scores_to_total_scores
end


# print total_scores
