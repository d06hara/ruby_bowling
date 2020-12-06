#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
# total_score = []
scores = []
# MAX_PINS = 10
# STRIKE = 10
# SPARE = 10
# MAX_FRAME = 10
# SPARE_ELEMENTS = 2
#---------------------

# スコア集計用
class CollectScore

  # 確認用のアクセサ
  attr_accessor :total_scores

  # 初期化
  def initialize(total_score = [])
    # @scores = scores
    @total_score = total_score
  end

  def fill_in_score(scores)
    @total_score.push(scores)
    # puts "#{@scores}"
  end

end

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
    # puts "#{@scores}"
  end
  # def fill_in_score(scores, score)
  #   scores.push(score)
  # end
  def scores_to_total_scores
    @@total_scores.push(@scores)
  end

  # 集計結果を受け取って、残りのピンを計算する
  def calc_pins(frame)
    puts 'aaa'
    # if frame == MAX_FRAME && (@scores.sum == STRIKE || @scores.sum == SPARE)
    if frame == MAX_FRAME
      puts 'bbb'
      # return @remaining_pins
      @remaining_pins
    else
      puts 'ccc'
      puts "#{@score}"
      # return MAX_PINS - @score #return が必要だったのはなぜ？
      @remaining_pins = MAX_PINS - @score #return が必要だったのはなぜ？
    end
  end

  # ストライクを判定する
  def strike?
    if(@scores.sum == STRIKE && @scores.length == STRIKE_ELEMENT)
      puts 'ストライクです'
      true
    else
      false
    end
  end

  # スペアを判定する
  def spare?
    if(@scores.sum == SPARE && @scores.length == SPARE_ELEMENTS)
      puts 'スペアです'
      true
    else
      false
    end
  end

end

#------------------------

# totalスコアのインスタンスを最初に生成
collect_score = CollectScore.new

(1..4).each do |frame|

  # インスタンス化
  ball_throw = BallThrow.new
  puts BallThrow::MAX_PINS
  (1..3).each do |throws|
    puts '残りの球を計算する'
    ball_throw.calc_pins(frame)

    puts '球を投げる'
    ball_throw.one_throw
    puts 'スコアを記入する'
    ball_throw.fill_in_score
    
    if(ball_throw.strike? || ball_throw.spare?)
      break
    end


    # 最終フレーム以外でかつスコアの合計が10であればbreak、2投目でかつスコアの合計がスペア以下の場合break
    # if (frame != MAX_FRAME && (scores.sum == (STRIKE || SPARE))) || (throws == 2 && scores.sum < SPARE)
    #   break
    # end
    ball_throw.scores
  end

  b = ball_throw.scores_to_total_scores
  print b
end


# print total_scores
