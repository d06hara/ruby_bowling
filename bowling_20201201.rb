#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
total_scores = []
MAX_PINS = 10
STRIKE = 10
SPARE = 10
MAX_FRAME = 4
STRIKE_ELEMENT = 1
SPARE_ELEMENTS = 2


# 加点用変数
add_array = []
# 練習用配列
pra_array = []
#---------------------

# ==================
# メソッド
# ==================
# 残りのピンを受け取ってそれに対し球を投げて返すだけ
def ball_throw(remaining_pins)
  rand(0..remaining_pins)
end

# 投げられた球を受け取って記入
def fill_in_score(scores, score)
  scores.push(score)
end

# 集計結果を受け取って、残りのピンを計算する
def calc_pins(scores, score, frame)
  if frame == MAX_FRAME && (scores.sum == STRIKE || scores.sum == SPARE)
    return MAX_PINS
  else
    MAX_PINS - score
  end
end

def judge_scores(scores)
  if scores.length == STRIKE_ELEMENT && scores.sum == STRIKE
    'STRIKE'
  elsif scores.length == SPARE_ELEMENT && scores.sum == SPARE
    'SPARE'
  else
    'NOT_STRIKE_OR_SPARE'
  end
end

#------------------------

(1..MAX_FRAME).each do |frame|
  # scoresを初期化
  score = 0 #１投のスコア
  scores = [] # １フレームのスコア
  (1..3).each do |throws|
    score = ball_throw(calc_pins(scores, score, frame))
    fill_in_score(scores, score)


    # # 加点を入れるならここ
    # # この前までの出力
    # # score = x, scores = [x] or [x, y]
    
    # puts ''
    # print "pra_array: #{pra_array}"
    # puts ''

    # # 前のフレームの配列を取得
    # if frame > 1
    #   # 前のフレームがストライクの時
    #   if add_array.length == STRIKE_ELEMENT && add_array.sum == STRIKE

    #   elsif
        
    #   end
    # end


    # add_array.push(score)
    # puts ''
    # print "add_array: #{add_array}"
    # puts ''
    # puts "#{frame}フレーム目の状態"









    # 最終フレーム以外でかつスコアの合計が10であればbreak、2投目でかつスコアの合計がスペア以下の場合break
    if (frame != MAX_FRAME && (scores.sum == (STRIKE || SPARE))) || (throws == 2 && scores.sum < SPARE)
      break
    end


  end


  before_frame = frame - 1
  print total_scores
  print total_scores[before_frame]
  flatten_total_scores = total_scores.flatten
  puts ''
  print flatten_total_scores
  puts ''


  fill_in_score(total_scores, scores)
  # fill_in_score(pra_array, scores)
end

print total_scores
