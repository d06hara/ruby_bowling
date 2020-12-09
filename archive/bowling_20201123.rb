# ----------------
# 定数の準備
#-----------------

# 最大フレーム数
MAX_FRAME = 10
# ピンの最大本数
MAX_PINS = 10
# ストライク
STRIKE = 10
# ストライクだった時の要素数 = 1
STRIKE_ELEMENT = 1
# ストライクだった時のスコア = 10
STRIKE_SCORE = 10
# スペアだった時の要素数 = 2
SPARE_ELEMENT = 2
# スペアだった時のスコア = 10
SPARE_SCORE = 10

# ============================
# 共通メソッド
# ============================

# ----------------
# 投球(1-9フレームと10フレーム)
# ・1~9フレームは最大２投、10フレームは必ず3投投げる
# ・戻り値は[[],[],......[]] の配列、戻り値の数によって場合分け
# ----------------
def throw(array_score, now_frame)
  score1 = rand(0..MAX_PINS)
  if score1 == STRIKE
    puts "ストライク!!!!!!"
    return array_score.push(score1)
  else
    # 残ったピンを計算して変数に代入
    remaining_pins = MAX_PINS - score1
    # 2投目を投げてarray_scoreにpush
    score2 = rand(0..remaining_pins)

    puts "1投目:#{score1}ピン"
    puts (score1 + score2 == SPARE_SCORE ? "2投目:#{score2}ピン、スペア!!!" : "2投目:#{score2}ピン,合計#{score1 + score2}ピン")

    return array_score.push(score1).push(score2)

  end
end

def last_frame_throw(array_score,now_frame)
  score1 = rand(0..MAX_PINS)
  if score1 == STRIKE
    score2 = rand(0..MAX_PINS)
    if score2 == STRIKE
      score3 = rand(0..MAX_PINS)
    else
      remaining_pins = MAX_PINS - score2
      score3 = rand(0..remaining_pins)
    end
  else
    remaining_pins = MAX_PINS - score1
    #２投目(１本目の残り)と３投目(最大本数)を投げる
    score2 = rand(0..remaining_pins)
    score3 = rand(0..MAX_PINS)
  end
  
  puts "最終フレームの合計：#{score1 + score2 + score3}ピン"

  return array_score.push(score1).push(score2).push(score3)
end


# -------------
# 加点メソッド
#--------------

def add_acore(frame_scores, two_before_frame_index, previous_frame_index, score1)
   # ２つ前がストライクの場合
   if frame_scores[two_before_frame_index].length == STRIKE_ELEMENT
    if frame_scores[previous_frame_index].length == STRIKE_ELEMENT # １つ前がストライクの場合(１投しか投げてない)
      puts '２つ前のフレームがストライクでかつ１つ前のフレームがストライクなので、２つ前のフレームに１つ前のフレームスコアと現在のフレームの１投目を加点します'
     return  frame_scores[two_before_frame_index].push(STRIKE).push(score1)
    else # １つ前がストライクではない場合(２投投げた)
      puts '２つ前がストライクでかつ１つ前がストライクでないので、２つ前のフレームに１つ前のフレームスコアを加点します'
     return  frame_scores[two_before_frame_index].concat(frame_scores[previous_frame_index])
    end

  # ２つ前がスペアの場合
  elsif frame_scores[two_before_frame_index].length == SPARE_ELEMENT && frame_scores[two_before_frame_index].inject(:+) == SPARE_SCORE
    puts "２つ前のフレームがスペアなので、２つ前のフレームに１つ前の１投目の点数を加点します"
   return  frame_scores[two_before_frame_index].push(frame_scores[previous_frame_index][0])
  else # ２つ前がストライクでもスペアでもない場合
   return  puts '２つ前のフレームはストライクでもスペアでもないので加点はありません'
  end
end

def last_frame_add_score(frame_scores, previous_frame_index, score1, score2)
  # 9フレームがストライクだった場合
  if frame_scores[previous_frame_index].length == STRIKE_ELEMENT
    puts "９フレーム目がストライクだったので、１０フレームの１投目と２投目を追加します"
    return frame_scores[previous_frame_index].push(score1).push(score2)
    # ９フレームがスペアだった場合
  elsif frame_scores[previous_frame_index].length == SPARE_ELEMENT && frame_scores[previous_frame_index].inject(:+) == SPARE_SCORE
    puts "９フレーム目がスペアだったので、10フレームの１投目を追加します"
    return frame_scores[previous_frame_index].push(score1)
  else
    return puts "9フレーム目がストライクでもスペアでもないので加点しません"
  end
end

# ============================
# 試合開始
# ============================
def playball
  puts '============'
  puts 'Play Ball !!'
  puts '============'

  player = "Player A"

  # =================
  # 変数
  # =================
  # 合計スコア
  total_score = 0
  # 各フレームのスコアを入れる配列を用意
  frame_scores = []
  # スコアボード
  score_board = "  #{player}  |"
  # １投目
  score1 = 0
  # ２投目
  score2 = 0
  # ３投目
  score3 = 0

  # =================
  # 処理
  # =================

  # for i in (0..9) do
  (0..9).each do |i|

    # ---------------------------
    # 変数の準備(初期化)
    # ---------------------------

    # 1.フレームスコアの箱を用意
    array_score = []

    # scores.each do |score|
    # end

    # 現在のフレームと現在のフレームの添字
    now_frame = i + 1
    now_frame_index = now_frame - 1
    # 前のフレームと前のフレームの添字
    previous_frame = i
    previous_frame_index = previous_frame - 1
    # ２つ前のフレームと２つ目のフレームの添字
    two_before_frame = i - 1
    two_before_frame_index = two_before_frame -1

    puts '------------------------'
    puts "#{now_frame}フレーム目を開始します"
    puts '------------------------'
    
    # ------------------
    # 投球
    # ------------------
    if now_frame != MAX_FRAME
      throw(array_score, now_frame)
    else
      last_frame_throw(array_score,now_frame)
    end
    puts "現在のフレームスコアは#{array_score}：(加点なし)"

    # 今回のフレームスコアを,スコア配列に代入
    frame_scores[i] = array_score

    # ---------------------------
    # 加点の処理(３フレーム以降に処理を行う)
    # --------------------------- 
    if now_frame >= 3 && now_frame < MAX_FRAME
      add_acore(frame_scores, two_before_frame_index, previous_frame_index, score1)
      # ２つ前がストライクの場合
      # if frame_scores[two_before_frame_index].length == STRIKE_ELEMENT
      #   if frame_scores[previous_frame_index].length == STRIKE_ELEMENT # １つ前がストライクの場合(１投しか投げてない)
      #     puts '２つ前のフレームがストライクでかつ１つ前のフレームがストライクなので、２つ前のフレームに１つ前のフレームスコアと現在のフレームの１投目を加点します'
      #     frame_scores[two_before_frame_index].push(STRIKE).push(score1)
      #   else # １つ前がストライクではない場合(２投投げた)
      #     puts '２つ前がストライクでかつ１つ前がストライクでないので、２つ前のフレームに１つ前のフレームスコアを加点します'
      #     frame_scores[two_before_frame_index].concat(frame_scores[previous_frame_index])
      #   end

      # # ２つ前がスペアの場合
      # elsif frame_scores[two_before_frame_index].length == SPARE_ELEMENT && frame_scores[two_before_frame_index].inject(:+) == SPARE_SCORE
      #   puts "２つ前のフレームがスペアなので、２つ前のフレームに１つ前の１投目の点数を加点します"
      #   frame_scores[two_before_frame_index].push(frame_scores[previous_frame_index][0])
      # else # ２つ前がストライクでもスペアでもない場合
      #   puts '２つ前のフレームはストライクでもスペアでもないので加点はありません'
      # end
    end

    # 10フレームの時のみ(9フレームの点数決定)
    if now_frame == MAX_FRAME
    last_frame_add_score(frame_scores, previous_frame_index, score1, score2)
      # 9フレームがストライクだった場合
      # if frame_scores[previous_frame_index].length == STRIKE_ELEMENT
      #   frame_scores[previous_frame_index].push(score1).push(score2)
      #   puts "９フレーム目がストライクだったので、１０フレームの１投目と２投目を追加します"
      #   # ９フレームがスペアだった場合
      # elsif frame_scores[previous_frame_index].length == SPARE_ELEMENT && frame_scores[previous_frame_index].inject(:+) == SPARE_SCORE
      #   frame_scores[previous_frame_index].push(score1)
      #   puts "９フレーム目がスペアだったので、10フレームの１投目を追加します"
      # else
      #   puts "9フレーム目がストライクでもスペアでもないので加点しません"
      # end
    end

    puts "#{i + 1}フレーム目までの暫定スコアは#{frame_scores}"
    puts '------------------------'
    puts "#{now_frame}フレーム目を終了します"
    puts '------------------------'
  end

  # 各フレームで合計を計算し、totalscoreに入れる
  for k in (0..9)
    total_score += frame_scores[k].inject(:+)
    score_board += "　　#{frame_scores[k].inject(:+)}　|"
  end

  puts "合計スコアは#{total_score}"
  score_board += "　　#{total_score}　　|"

  # ======================
  # 結果出力
  # ======================
  puts '  フレーム  |   1   |   2   |   3   |   4   |   5   |   6   |   7   |   8   |   9   |     10    |　　合計　　|'
  puts score_board
end

playball