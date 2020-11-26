
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


# ----------------
# 試合開始
#-----------------
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
  # スペアの判定(0 or 1)
  spare = 0
  # ストライクの判定(0 or 1)
  strike = 0


  # =================
  # 処理
  # =================

  (0..9).each do |i|
  
  # (0..9).each do |i|



    # ---------------------------
    # 変数の準備
    # ---------------------------

    # 1.フレーム数とピンを用意する
    # フレームスコアの箱を用意(初期化)
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
    
    # ------------------------------------------
    # フレームによって何投投げるかの処理
    # 1~9フレームは最大２投、10フレームは必ず3投投げる
    # この処理のアウトプットは[[],[],......[]] 中は10個の配列
    # ------------------------------------------

    # １投目を投げて、残ったピンを変数に代入する (1~9フレーム目まで)
    if now_frame < 10

      # １投目を投げる（スコアは0-10)
      score1 = rand(0..MAX_PINS)

      # score1 = 10 # テスト用

      # array_scoreにpush
      array_score.push(score1)

      # ストライク以外だった場合に２投目に進む
      if score1 != STRIKE
        # 残ったピンを計算して変数に代入
        remaining_pins = MAX_PINS - score1
        # 2投目を投げてarray_scoreにpush
        score2 = rand(0..remaining_pins)
        array_score.push(score2)
      end

    else
      # 10フレーム目の処理
      # １投目を投げる（スコアは0-10)
      score1 = rand(0..MAX_PINS)

      # score1 = 10 # テスト用

      # array_scoreにpush
      array_score.push(score1)
      # ストライク以外の場合
      if score1 != STRIKE
        # 残ったピンを計算して変数に代入
        remaining_pins = MAX_PINS - score1
        #２投目は残り
        score2 = rand(0..remaining_pins)
        array_score.push(score2)
        # 3本目を投げる(10本)
        score3 = rand(0..MAX_PINS)
        array_score.push(score3)

      else#1本目がストライクだった場合
        #2投目を投げる
        score2 = rand(0..MAX_PINS)

        # score2 = 10 # テスト用

        
        array_score.push(score2)
        
        if score2 != STRIKE #２本目がストライク以外の場合
          # ３本目の処理
          # 残ったピンを計算して変数に代入
          remaining_pins = MAX_PINS - score2
          score3 = rand(0..remaining_pins)
          array_score.push(score3)

        else #２本目がストライクの場合
          #３本目の処理
          score3 = rand(0..MAX_PINS)
          # score3 = 10 # テスト用

          array_score.push(score3)
        end

      end

    end

    puts "現在のフレームスコアは#{array_score}：(加点なし)"


    # 4.今回のフレームスコアを,スコア配列に代入
    # frame_score = score1 + score2
    frame_scores[i] = array_score
    # puts "#{frame_count}回目のスコアは#{frame_scores[i]}"
    # puts "#{i + 1}フレーム目までのスコアは#{frame_scores}"



    # ---------------------------
    # 現在のフレームがスペアストライクのコメントを出力だけの処理(ロジックには影響しない)
    # --------------------------- 
    # 要素数が1だった場合=ストライクの場合
    if array_score.length == 1
      puts "ストライク!!!!!!"

    # 要素数が2でかつ合計値が10の場合=スペアの場合
    elsif array_score.length == 2 && array_score.inject(:+) == 10
      puts "スペア!"

    # それ以外の場合
    else
      puts "ストライクでもスペアでもない"
    end



    # ---------------------------
    # 加点の処理
    # --------------------------- 

    # ３フレーム以降の処理(1-8フレームの点数決定)
    if now_frame >= 3 && now_frame < MAX_FRAME
      
      # ２つ前のフレームパターンで場合分け
      # ２つ前がストライクの場合
      if frame_scores[two_before_frame_index].length == STRIKE_ELEMENT
        puts '２つ前のフレームがストライクです'
        # １つ前のフレームパターンで場合分け
        # １つ前がストライクの場合(１投しか投げてない)
        if frame_scores[previous_frame_index].length == STRIKE_ELEMENT
          puts '２つ前のフレームがストライクでかつ１つ前のフレームがストライクなので、２つ前のフレームに１つ前のフレームスコアと現在のフレームの１投目を加点します'
          frame_scores[two_before_frame_index].push(STRIKE).push(score1)
        else
        # １つ前がストライクではない場合(２投投げた)
          puts '２つ前がストライクでかつ１つ前がストライクでないので、２つ前のフレームに１つ前のフレームスコアを加点します'
          frame_scores[two_before_frame_index].concat(frame_scores[previous_frame_index])
        end

      # ２つ前がスペアの場合
      elsif frame_scores[previous_frame_index].length == SPARE_ELEMENT && frame_scores[previous_frame_index].inject(:+) == SPARE_SCORE
        puts '２つ前のフレームがスペアです'
        puts "２つ前のフレームがスペアなので、２つ前のフレームに１つ前の１投目の点数を加点します"
        frame_scores[two_before_frame_index].push(frame_scores[previous_frame_index][0])

      else
        puts '２つ前のフレームはストライクでもスペアでもありません'
        puts '２つ前のフレームに加点はありません'
      end

    end



    # 10フレームの時のみ(9,10フレームの点数決定)
    # 9フレームの点数決定
    # 1つ前がストライクだった場合、現在の１投目と２投目を加える
    # １つ前がスペアだった場合,現在の１投目を加える
    if now_frame == MAX_FRAME
      # 9フレームの点数決定処理
      # 9フレームがストライクだった場合
      if frame_scores[previous_frame_index].length == STRIKE_ELEMENT
        frame_scores[previous_frame_index].push(score1).push(score2)
        puts "９フレーム目がストライクだったので、１０フレームの１投目と２投目を追加します"

        # ９フレームがスペアだった場合
      elsif frame_scores[previous_frame_index].length == SPARE_ELEMENT && frame_scores[previous_frame_index].inject(:+) == SPARE_SCORE
        frame_scores[previous_frame_index].push(score1)
        puts "９フレーム目がスペアだったので、10フレームの１投目を追加します"
      else
        puts "9フレーム目がストライクでもスペアでもないので加点しません"

      end
    

    end

    puts "#{i + 1}フレーム目までのスコアは#{frame_scores}"

    puts '------------------------'
    puts "#{now_frame}フレーム目を終了します"
    puts '------------------------'
  end

  # 各フレームで合計を計算し、totalscoreに入れる
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