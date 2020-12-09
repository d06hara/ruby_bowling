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



STRIKE_ELEMENT = 1
SPARE_ELEMENT = 2
FIRST_THROW_INDEX = 0
SECOND_THROW_INDEX = 1


def judge_scores(scores)
  if scores.length == STRIKE_ELEMENT && scores.sum == STRIKE
    'STRIKE'
  elsif scores.length == SPARE_ELEMENT && scores.sum == SPARE
    'SPARE'
  else
    'NOT_STRIKE_OR_SPARE'
  end
end


# 練習用スコア配列
practice_scores = [[10],[8, 2], [4, 5], [3, 7], [10], [10], [3, 3], [7, 3], [10], [10, 8, 2]]
test_array = []
total_scores = []
answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 10, 3], [10, 3, 3], [3, 3], [7, 3, 10], [10, 10, 8], [10, 8, 2]]


# (1..MAX_FRAME).each do |i|
#   total_scores.push([10-i, i])
# end

(0..9).each do |i|
  if i > 0
    before_scores = practice_scores[i - 1]
    puts before_scores.length
  end

  # 前のスコアが存在する時に前のスコアを判定する
  if i > 0
    if before_scores.length > 0
      before_score_judge_flag = judge_scores(before_scores)
    end
  end
  puts before_score_judge_flag
  
  scores = []

  # １投目を投げる
  score1 = practice_scores[i][0]
  test_array.push(score1)
  test_array.compact!

  # 加点処理

  # 加点処理
  if before_score_judge_flag == 'STRIKE'
    before_scores.push(score1)
  elsif before_score_judge_flag == 'SPARE'
    before_scores.push(score1)
  else
    puts 'c'
  end


  # ２投目を投げる
  score2 = practice_scores[i][1]
  test_array.push(score2)
  test_array.compact!

    # 加点処理
  if before_score_judge_flag == 'STRIKE'
    before_scores.push(score2)
  elsif before_score_judge_flag == 'SPARE'
    puts 'b'
  else
    puts 'c'
  end

  scores.push(score1).push(score2)
  print scores
  # 仮：投球
  total_scores.push(practice_scores[i])

  

  # 加点処理
  if before_score_judge_flag == 'STRIKE'
    puts 'a'
  elsif before_score_judge_flag == 'SPARE'
    puts 'b'
  else
    puts 'c'
  end

  print total_scores
  puts ''
  print before_scores
  puts ''
end


print test_array
puts ''
print practice_scores
puts ''
print total_scores
puts ''
print answer



# flatten_total_scores = total_scores.flatten
# # print flatten_total_scores
# # print total_scores

# total_scores.each.with_index(1) do |scores, frame|
#   puts "#{frame}フレームのスコアは#{scores}です"
#   puts judge_scores(scores)

#   if judge_scores(scores) == 'STRIKE'
#     puts '先頭の要素を削除します'
#     flatten_total_scores = flatten_total_scores.drop(1)
#     print flatten_total_scores
#     scores.push(flatten_total_scores[0]).push(flatten_total_scores[1])
#     puts "scoresは#{scores}"

#   elsif judge_scores(scores) == 'SPARE'
#     puts '前から２つを削除します'
#     flatten_total_scores = flatten_total_scores.drop(2)
#     print flatten_total_scores
#     scores.push(flatten_total_scores[0])
#     puts "scoresは#{scores}"

#   else
#     puts '前から二つを削除します'
#     flatten_total_scores = flatten_total_scores.drop(2)
    
#   end
# end

# print total_scores
# puts 'a'
# print answer
# print flatten_total_scores
# puts 'a'
# flatten_total_scores.drop(1)
# print flatten_total_scores
