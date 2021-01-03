#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
# 練習用スコア配列
answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 10, 3], [10, 3, 3], [3, 3], [10, 10, 10], [10, 10, 8], [10, 8, 2]]

#---------------------

# 投げて、スコアを計算して、加点する
# スコアを出して、スコアを入れて、スコアを計算して、計算結果を判定して、スコアを追加する
# 現在のスコアを出して、現在のスコアを入れて、現在のスコアを計算して、過去のスコアを計算して、過去のスコアを判定して、現在のスコアを追加する

# 定数をまとめる
module Property
  
  MAX_PINS = 10
  STRIKE = 10
  SPARE = 10
  STRIKE_OR_SPARE = 10
  DOUBLE = 20
  SPARE_ELEMENTS = 2
  STRIKE_ELEMENT = 1
  DOUBLE_ELEMENTS = 2
  FIRST_FRAME = 1
  LAST_FRAME = 10
  ONE_THROW = 1
  TWO_THROW = 2

end


class Bowling

  FIRST_FRAME = 1
  LAST_FRAME = 10

  attr_accessor :total_score
  attr_accessor :frame

  # 全てに共通するもの
  def initialize(total_score = [], frame = 1)
    @total_score = total_score
    @frame = frame

    #インデックス用変数
    @now_frame_index = @frame - 1
    @before_frame_index = @now_frame_index - 1
    @two_before_frame_index = @before_frame_index - 1
  end

  # 最初のフレーム 呼び出し
  def first_frame
    FIRST_FRAME
  end

  #最終フレーム呼び出し
  def last_frame
    LAST_FRAME
  end

  #最終フレームかどうか
  def last_frame?
    @frame == LAST_FRAME ? true : false
  end

end

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

# 過去のフレームの判定をする
class JudgeScore

  #定数をimport
  include Property

  # アクセサ
  attr_accessor :frame_score

  def initialize(frame_score = [])
    @frame_score = frame_score
  end

  #スコアの合計を計算する
  def sum_frame_score
    @frame_score.sum
  end

  #フレームスコアの要素数を計算する
  def throw_count
    if @frame_score.length == 1
      ONE_THROW
    elsif @frame_score.length == 2
      TWO_THROW
    end
  end

  #ストライクを判定する
  def strike?
    (sum_frame_score == STRIKE) && (throw_count == ONE_THROW) ? true : false
  end
  
  #スペアを判定する
  def spare?
    (sum_frame_score == SPARE) && (throw_count == TWO_THROW) ? true : false
  end

  #ダブルの判定
  def double?
    (sum_frame_score == DOUBLE) && (throw_count == TWO_THROW) ? true : false
  end
end

class ManageScore

  # attr_accessor :total_score
  # attr_accessor :now_frame_score
  # attr_accessor :before_frame_score
  # attr_accessor :two_before_frame_score
  

  # この変数で全体スコアを管理
  @@total_score = []
  @@frame = 0

  # 全てに共通するもの
  def initialize
    # フレームはnewするたびに１をたす
    @@frame += 1

    #インデックス用変数
    @now_frame_index = @@frame - 1
    @before_frame_index = @now_frame_index - 1
    @two_before_frame_index = @before_frame_index - 1

    # #スコア用配列
    @now_frame_score == @@total_score[@now_frame_index]
    @before_frame_score = @@total_score[@before_frame_index]
    @two_before_frame_score = @@total_score[@two_before_frame_index]
  end

  # これが必要なのはなぜ?
  def total_score
    @@total_score
  end

  def now_frame_score
    @@total_score[@now_frame_index]
  end

  def before_frame_score
    @@total_score[@before_frame_index]
  end

  def two_before_frame_score
    @@total_score[@two_before_frame_index]
  end

end


# -----メイン処理----------

bowling = Bowling.new

(bowling.first_frame..bowling.last_frame).each do |frame|
  # フレームをクラスに読み込ませる
  bowling.frame = frame

  #投球処理
  #インスタンス化
  score = Score.new
  judge_score = JudgeScore.new
  manage_score = ManageScore.new

  #最大投球数
  max_throw = (frame == bowling.last_frame) ? 3 : 2

  (1..max_throw).each do |throw|
    score.calc_remaining_pins(bowling.frame)  #場にあるピンを計算
    score.ball_throw #球を投げる
    score.score_to_frame_score #フレームスコアに入れる
    judge_score.frame_score = score.frame_score #判定用クラスに読み込ませる
    # 投球を終わるか判定(最終フレームは２投の合計が10以下、それ以外のフレームはストライクの場合)
    if(bowling.last_frame? && (judge_score.throw_count == Property::TWO_THROW && judge_score.sum_frame_score < Property::SPARE)) || (!(bowling.last_frame?) && judge_score.strike?)
      break
    end
  end

  # puts "#{score.frame_score}"
  manage_score.total_score.push(score.frame_score)
  puts ''
  print manage_score.total_score
  puts ''

  # bowling.total_score.push(score.frame_score)

  #加点処理

  #1フレーム目はスキップ
  if frame == 1
    next
  end

  #前のフレームスコアを確認する
  #前のフレームがスペアだった場合、現在の１投目を追加
  judge_score.frame_score = manage_score.before_frame_score
  if(judge_score.spare?)
    puts 'a'
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

##############################
##ここでundefinedになるのはなぜ？
##############################
# puts ''
# print manage_score.total_score #なぜか最後は表示されない
# puts ''

puts ''
print bowling.total_score
puts ''

