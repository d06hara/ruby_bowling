#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
total_scores = []
MAX_PINS = 10
STRIKE = 10
SPARE = 10
DOUBLE = 20
FIRST_FRAME = 1
MAX_FRAME = 10
SPARE_ELEMENTS = 2
STRIKE_ELEMENT = 1
DOUBLE_ELEMENTS = 2
FIRST_THROW_INDEX = 0
SECOND_THROW_INDEX = 1

score = 0
#---------------------

# ストライク判定
def strike?(frame_score)
  (frame_score.length == STRIKE_ELEMENT) && (frame_score.sum == STRIKE) ? true : false
end

# スペア判定
def spare?(frame_score)
  (frame_score.length == SPARE_ELEMENTS) && (frame_score.sum == SPARE) ? true : false
end

# ダブル判定
def double?(frame_score)
  (frame_score.length == DOUBLE_ELEMENTS) && frame_score.sum == DOUBLE ? true : false
end

# スペアの場合の加点（前のフレームスコアに現在の１投目を追加)
def add_score_spare_case(test_array, before_frame_index, now_frame_score)
  test_array[before_frame_index].push(now_frame_score[0])
end

# ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
def add_score_strike_case(test_array, before_frame_index, now_frame_score)
  test_array[before_frame_index].push(now_frame_score[0]).push(now_frame_score[1])
end


# 練習用スコア配列
practice_scores = [[10],[8, 2], [4, 5], [3, 7], [10], [10], [3, 3], [10], [10], [10, 8, 2]]
test_array = []
total_scores = []
answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 10, 3], [10, 3, 3], [3, 3], [10, 10, 10], [10, 10, 8], [10, 8, 2]]

# 加点が始まるのは2投目から
#前のフレームスコアをチェックする

(FIRST_FRAME..MAX_FRAME).each do |frame|

  # 変数準備
  now_frame_index = frame - 1
  before_frame_index = now_frame_index - 1
  two_before_frame_index = before_frame_index - 1

  # このフレームスコア
  now_frame_score = practice_scores[now_frame_index]
  # 前のフレームスコアを取得する
  before_frame_score = test_array[before_frame_index]
  # ２個前のフレームスコアも取得
  two_before_frame_score = test_array[two_before_frame_index]

  # テスト用配列にスコアを入れていく
  test_array.push(now_frame_score)
  

  # 最初のフレームは処理をnextする
  if frame == FIRST_FRAME
    next
  end

  puts "#{frame}フレーム"
  print "#{test_array}"
  puts ''
  
  # 最終前フレームの処理
  if frame == MAX_FRAME
    puts '最終フレーム'
    print "#{before_frame_score}"
    puts ''
    print "#{now_frame_score}"
    puts ''
    puts ''
    print "#{test_array}"
    puts ''

    #まずダブルの処理
    if (double?(two_before_frame_score))
      test_array[two_before_frame_index].push(now_frame_score[0])
    end

    if(spare?(before_frame_score))
      add_score_spare_case(test_array, before_frame_index, now_frame_score)
    elsif(strike?(before_frame_score))
      add_score_strike_case(test_array, before_frame_index, now_frame_score)
    else
      puts '加点なし'
    end
    
    break
  end


  # 前のフレームがスペアだった場合、現在のフレームの1投目を追加
  if(spare?(before_frame_score))
    add_score_spare_case(test_array, before_frame_index, now_frame_score)
  end

  # 前のフレームがストライクだった場合、現在のフレームの2投を追加、現在のフレームがストライクの場合は１投のみ追加
  if(strike?(before_frame_score))
    if(strike?(now_frame_score))
      # スペアケースと一緒
      add_score_spare_case(test_array, before_frame_index, now_frame_score)
    else
      add_score_strike_case(test_array, before_frame_index, now_frame_score)
    end
  end
  
  if frame == 7
    puts '7'
    print "#{two_before_frame_score}"
    puts ''
    print "#{before_frame_score}"
    puts ''
    
  end

  # ３フレーム以降の処理
  if frame >= 3 && (double?(two_before_frame_score))
    puts 'ダブルです'
    # １つ前のフレームと２つ前のフレームがストライクだった場合→ダブルだった場合、二つ前のフレームスコアに現在の１投目を追加
    test_array[two_before_frame_index].push(now_frame_score[0])
  end

end


print test_array
puts ''
print practice_scores
puts ''
print total_scores
puts ''
print answer

