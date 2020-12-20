#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
total_scores = []
MAX_PINS = 10
STRIKE = 10
SPARE = 10
MAX_FRAME = 10
SPARE_ELEMENTS = 2
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
#------------------------

(1..MAX_FRAME).each do |frame|
  # scoresを初期化
  score = 0 #１投のスコア
  scores = [] # １フレームのスコア
  (1..3).each do |throws|
    score = ball_throw(calc_pins(scores, score, frame))
    fill_in_score(scores, score)
    # 最終フレーム以外でかつスコアの合計が10であればbreak、2投目でかつスコアの合計がスペア以下の場合break
    if (frame != MAX_FRAME && (scores.sum == (STRIKE || SPARE))) || (throws == 2 && scores.sum < SPARE)
      break
    end
  end
  fill_in_score(total_scores, scores)
end

print total_scores
