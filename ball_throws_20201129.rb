# scoreは1つの数字
score = 0
# scoresは1フレームあたりの特典
scores = []
# total_scoresはscoresの集まり
total_scores = []
MAX_PINS = 10
STRIKE = 10
MAX_FRAME = 10

# 球を投げて返すだけ
# 残りのピンを別のメソッドから受け取ってそれに対し球を投げて返すだけ
def ball_throw(remaining_pins)
  rand(0..remaining_pins)
end

# 投げられた球を受け取って記入
def fill_in_score(scores, score)
  scores.push(score)
end

# 集計結果を受け取って、残りのピンを計算する
def calc_pins(score, frame)
  # pins = MAX_PINS - score
  if frame == 10 && score == STRIKE
    return MAX_PINS
  else
    MAX_PINS - score
  end
end

# 10フレーム投げる
(1..10).each do |frame|
  # scoresを初期化
  score = 0
  scores = []
  if frame < MAX_FRAME
    (1..2).each do |throws|
      # ストライクかどうかを判定
      if scores.sum != STRIKE
        # 残りのピンを計算
        remaining_pins = calc_pins(score, frame)
        # 投げる
        score = ball_throw(remaining_pins)
        # スコアを記入
        fill_in_score(scores, score)
      end
    end
  else
    (1..3).each do |throws|
      if throws < 3
          # 残りのピンを計算
          puts "score:#{score}"
          puts "frame:#{frame}"
          remaining_pins = calc_pins(score, frame)
          puts "remaining_pins:#{remaining_pins}"
          # 投げる
          score = ball_throw(remaining_pins)
          puts "score:#{score}"
          # 記入
          fill_in_score(scores, score)
          print "#{scores} \n"
      else
        if scores.sum >= STRIKE
          # 残りのピンを計算
          puts "score:#{score}"
          puts "frame:#{frame}"
          remaining_pins = calc_pins(score, frame)
          puts "remaining_pins:#{remaining_pins}"
          # 投げる
          score = ball_throw(remaining_pins)
          puts "score:#{score}"
          # 記入
          fill_in_score(scores, score)
          print "#{scores} \n"
        end
      end

    end
  end

  fill_in_score(total_scores, scores)
end

print total_scores


