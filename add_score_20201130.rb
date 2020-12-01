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
# def ball_throw(remaining_pins)
#   rand(0..remaining_pins)
# end

# # 投げられた球を受け取って記入
# def fill_in_score(scores, score)
#   scores.push(score)
# end

# # 集計結果を受け取って、残りのピンを計算する
# def calc_pins(scores, score, frame)
#   if frame == MAX_FRAME && (scores.sum == STRIKE || scores.sum == SPARE)
#     return MAX_PINS
#   else
#     MAX_PINS - score
#   end
# end
#------------------------

# (1..MAX_FRAME).each do |frame|
#   # scoresを初期化
#   score = 0 #１投のスコア
#   scores = [] # １フレームのスコア
#   (1..3).each do |throws|
#     score = ball_throw(calc_pins(scores, score, frame))
#     fill_in_score(scores, score)
#     # ストライクの場合はループを抜ける
#     if (frame != MAX_FRAME && (scores.sum == (STRIKE || SPARE))) || (throws == 2 && scores.sum != SPARE)
#       break
#     end
#   end
#   fill_in_score(total_scores, scores)
# end

# print total_scores

STRIKE_ELEMENT = 1
SPARE_ELEMENT = 2
FIRST_THROW_INDEX = 0
SECOND_THROW_INDEX = 1



total_scores = [[10],[8, 2], [4, 5], [3, 7], [10], [9, 0], [3, 3], [7, 3], [10], [10, 8, 2]]
answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 9, 0], [9, 0], [3, 3], [7, 3, 10], [10, 10, 8], [10, 8, 2]]


# (1..MAX_FRAME).each do |i|
#   total_scores.push([10-i, i])
# end

print total_scores

def judge_scores(scores)
  if scores.length == STRIKE_ELEMENT && scores.sum == STRIKE
    'STRIKE'
  elsif scores.length == SPARE_ELEMENT && scores.sum == SPARE
    'SPARE'
  else
    'NOT_STRIKE_OR_SPARE'
  end
end

flatten_total_scores = total_scores.flatten
# print flatten_total_scores
# print total_scores

total_scores.each.with_index(1) do |scores, frame|
  puts "#{frame}フレームのスコアは#{scores}です"
  puts judge_scores(scores)

  if judge_scores(scores) == 'STRIKE'
    puts '先頭の要素を削除します'
    flatten_total_scores = flatten_total_scores.drop(1)
    print flatten_total_scores
    scores.push(flatten_total_scores[0]).push(flatten_total_scores[1])
    puts "scoresは#{scores}"

  elsif judge_scores(scores) == 'SPARE'
    puts '前から２つを削除します'
    flatten_total_scores = flatten_total_scores.drop(2)
    print flatten_total_scores
    scores.push(flatten_total_scores[0])
    puts "scoresは#{scores}"

  else
    puts '前から二つを削除します'
    flatten_total_scores = flatten_total_scores.drop(2)
    
  end
end

print total_scores
puts 'a'
print answer
# print flatten_total_scores
# puts 'a'
# flatten_total_scores.drop(1)
# print flatten_total_scores
