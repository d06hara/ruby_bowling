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
  # スペアの判定(0 or 1)
  spare = 0
  # ストライクの判定(0 or 1)
  strike = 0





  # =================
  # 処理
  # =================

  puts '1'.class
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
    
    # ---------------------------
    # フレームによって何投投げるかの処理
    # 1~9フレームは最大２投、10フレームは必ず3投投げる
    # ---------------------------

    # １投目を投げて、残ったピンを変数に代入する (1~9フレーム目まで)
    if now_frame < 10

      # １投目を投げる（スコアは0-10)
      score1 = rand(0..10)

      # score1 = 10 # テスト用

      # array_scoreにpush
      array_score.push(score1)

      # ストライク以外だった場合に２投目に進む
      if score1 != 10
        # 残ったピンを計算して変数に代入
        remaining_pins = 10 - score1
        # 2投目を投げてarray_scoreにpush
        score2 = rand(0..remaining_pins)
        array_score.push(score2)
      end

    else
      # 10フレーム目の処理
      # １投目を投げる（スコアは0-10)
      score1 = rand(0..10)
      # array_scoreにpush
      array_score.push(score1)
      # ストライク以外の場合
      if score1 != 10
        # 残ったピンを計算して変数に代入
        remaining_pins = 10 - score1
        #２投目は残り
        score2 = rand(0..remaining_pins)
        array_score.push(score2)
        # 3本目を投げる(10本)
        score3 = rand(0..10)
        array_score.push(score3)

      else#２本目もストライクだった場合
        #2投目を投げる
        score2 = rand(0..10)
        array_score.push(score2)
        
        if score2 != 10 #２本目がストライク以外の場合
          # ３本目の処理
          # 残ったピンを計算して変数に代入
          remaining_pins = 10 - score2
          score3 = rand(0..remaining_pins)
          array_score.push(score3)

        else #２本目がストライクの場合
          #３本目の処理
          score3 = rand(0..10)
          array_score.push(score3)
        end

      end

    end

    puts "現在のフレームスコアは#{array_score}"


    # 4.今回のフレームスコアを,スコア配列に代入
    # frame_score = score1 + score2
    frame_scores[i] = array_score
    # puts "#{frame_count}回目のスコアは#{frame_scores[i]}"
    # puts "#{i + 1}フレーム目までのスコアは#{frame_scores}"



    # ---------------------------
    # 現在のフレームがスペアストライクのコメントを出力
    # --------------------------- 
    # 要素数が1だった場合=ストライクの場合
    if array_score.length == 1
      puts "ストライク!!!!!!"

    # 要素数が2でかつ合計値が10の場合=スペアの場合
    elsif array_score.length == 2 && array_score.inject(:+) == 10
      puts "スペア!"

    # それ以外の場合
    else
      puts "・・・・・・"
    end





    # 2フレーム
    if now_frame == 2
      # 1フレームがストライク(前の配列要素が一つ)かつ、2フレームでストライクをとった場合、score1のみを1フレームに追加
      if frame_scores[previous_frame_index].length == 1 && score1 == 10
        frame_scores[previous_frame_index].push(score1)
        puts 'a'

      # 1フレームがストライクかつ、2フレームでストライクでない場合
      elsif frame_scores[previous_frame_index].length == 1 && score1 != 10
        frame_scores[previous_frame_index].push(score1).push(score2)
        puts 'b'

      # 1フレームがスペアの場合(要素が２つ、合計が10)、2フレームの１投目を前のフレームに追加
      elsif frame_scores[previous_frame_index].length == 2 && frame_scores[previous_frame_index].inject(:+) == 10
        frame_scores[previous_frame_index].push(score1)
        puts "c"
      end

    # 3-9  フレーム
    elsif now_frame >= 3 && now_frame < 10

      # 1フレーム目と２フレーム目がストライクでかつ、３フレーム目でストライクの場合[[10,10][10]]
      if frame_scores[two_before_frame_index].inject(:+) == 20 && frame_scores[previous_frame_index].length == 1 && score1 == 10
        frame_scores[two_before_frame_index].push(score1)
        frame_scores[previous_frame_index].push(score1)
      # ２つ前のフレームと一つ前のフレームがストライクで、かつ現在のフレームでストライクをとった場合,10を２つ２つ前のframeに追加
      elsif frame_scores[two_before_frame_index].length == 1 && frame_scores[previous_frame_index].length == 1 && score1 == 10
        frame_scores[two_before_frame_index].push(10).push(10)

      # ２つ前のフレームと一つ前のフレームがストライクで、かつ現在のフレームでストライクでない場合,10を一つと１投目を二つのframeに追加
      elsif frame_scores[two_before_frame_index].length == 1 && frame_scores[previous_frame_index].length == 1 && score1 != 10
        frame_scores[two_before_frame_index].push(10).push(score1)

        # ２つ前のフレームがストライクで一つ前がスペアだった場合、二つ前のフレームに一つ前のフレームの２投を入れて、現在の１投目を一つ前のフレームに入れる
      elsif frame_scores[two_before_frame_index].length == 1 && frame_scores[previous_frame_index].length == 2 && frame_scores[previous_frame_index].inject(:+) == 10
        for val in frame_scores[previous_frame_index]
          frame_scores[two_before_frame_index].push(val)
        end

        # １つ前がスペアの場合
      elsif frame_scores[previous_frame_index].length == 2 && frame_scores[previous_frame_index].inject(:+) == 10
        frame_scores[previous_frame_index].push(score1)
      else
        puts '追加なし'
      end

      #10フレーム目の処理
    elsif now_frame == 10
      #8フレームと9フレームがストライクの場合
      if frame_scores[two_before_frame_index].inject(:+) == 20 && frame_scores[previous_frame_index].length == 1
        frame_scores[two_before_frame_index].push(score1)
        frame_scores[previous_frame_index].push(score1).push(score2)

      # # ８フレームがストライク9フレームがスペアの場合
      # elsif
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