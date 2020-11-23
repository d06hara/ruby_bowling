# ボウリングゲーム

# --ルール
# 全１０フレーム
# 1~9フレーム：２投、10フレーム：３投
# 1~9フレームは、ストライクだったら1投,1~9フレームは、ストライクだったら、後の2投を加算する,1~9フレームは、スペアだったら、後の1投を加算する
# 10 フレームは、1,2投目で、10ピン倒したら、3投目が投げられる。


# class Player
#   def name
#     'Player B'
#   end
# end

class Player
  def name
    name_tag = rand(0..10)
    "Player #{name_tag}"
  end
end

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
# 投球(1-9フレーム)
# ----------------
def throw(array_score, now_frame)
  # １投目の処理(全フレーム共通)
  score1 = rand(0..MAX_PINS)
  # score1 = 10 # テスト用
  # array_scoreにpush
  array_score.push(score1)

  # ２投目以降の処理が1-9フレームと10フレームで異なるので場合分け
  if now_frame < MAX_FRAME
    # ストライク以外だった場合に２投目に進む
    if score1 != STRIKE
      # 残ったピンを計算して変数に代入
      remaining_pins = MAX_PINS - score1
      # 2投目を投げてarray_scoreにpush
      score2 = rand(0..remaining_pins)
      array_score.push(score2)
    end

  else # 10フレーム目の処理
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
end


# ----------------
# 試合開始
#-----------------
def playball
  puts '============'
  puts 'Play Ball !!'
  puts '============'

  player = "Player A"


  pl = Player.new
  player = pl.name
  puts player

  pl = Player.new
  player = pl.name
  puts player



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

  puts '1'.class
  for i in (0..9) do
  # (0..9).each do |i|
  
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
    throw(array_score, now_frame)


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
    # ・１フレームの点数が決まるのは３フレームが終わってから、同様に8フレームまでが同じ処理

    # ・1-8フレームまでの点数の決め方、３-9フレームで場合分け
    # ・１フレームと２フレームでは特に何もしない
    # ・３フレーム以降で加点の処理を行う
    # ・２つ前のフレームの結果と１つ前のフレームの結果を判定
    # ・２つ前がストライクかつ１つ前がストライクの場合、２つ前のフレームスコアに１つ前の点数（ストライク）と現在の点数（ストライク）を入れる
    # ・２つ前がストライクかつ１つ前がスペアの場合、２つ前のフレームスコアに１つ前の２投の点数を加える
    # ・２つ前がスペアだった場合、２つ前のフレームスコアに１つ前の１投目を加える
    # ・２つ前がストライクでもスペアでもない場合、加点なし
    # ・２つ前がストライクかスペアかそうでもないかで場合分け、
    # 
    # ・10フレームだけ別の処理
    # ・8フレームの点数は上の処理と同じ,
    # ・９フレームの点数は
    # --------------------------- 

    # ３フレーム以降の処理(1-8フレームの点数決定)
    if now_frame >= 3
      
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





    # 5.合計スコアに加算していく
    # total_score += frame_scores[i]

    # 6.出力用スコアボードに文字列として連結していく
    # score_board += "   #{frame_scores[i]}   |"


    puts '------------------------'
    puts "#{now_frame}フレーム目を終了します"
    puts '------------------------'
  end

  # 各フレームで合計を計算し、totalscoreに入れる
  for k in (0..9)
    total_score += frame_scores[k].inject(:+)
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