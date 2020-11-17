# ボウリングゲーム

# --ルール
# 全１０フレーム
# 1~9フレーム：２投、10フレーム：３投
# 1~9フレームは、ストライクだったら1投,1~9フレームは、ストライクだったら、後の2投を加算する,1~9フレームは、スペアだったら、後の1投を加算する
# 10 フレームは、1,2投目で、10ピン倒したら、3投目が投げられる。


# ----------------
# 試合開始
#-----------------
def playball
  puts '============'
  puts 'Play Ball !!'
  puts '============'

  player = "Player A"

  # 点数の付け方
  # frame x の一投目をscore x1、二投目をscore x2 とする
  # frame x の合計点数をtotal_score x とする
  # score11 = rand(10)
  # score12 = rand(10)
  # total_score1 = score11 + score12
  # puts score11
  # puts score12
  # puts total_score1

  # 合計スコア
  total_score = 0
  # 各フレームのスコアを入れる配列を用意
  frame_scores = []

  # スコアボード
  score_board = "  #{player}  |"

  for i in (0..9) do
    # １投目と２投目
    score1 = rand(10)
    score2 = rand(10)
    # 合計を計算し、配列に代入
    frame_score = score1 + score2
    frame_scores[i] = frame_score
    # puts frame_scores[i]
    puts "スコアは#{frame_scores[i]}"

    # 合計スコアに加算していく
    total_score += frame_scores[i]

    # 出力用スコアボードに文字列として連結していく
    score_board += "   #{frame_scores[i]}   |"
  end

  puts "合計スコアは#{total_score}"
  score_board += "　　#{total_score}　　|"


  #結果出力
  puts '  フレーム  |   1   |   2   |   3   |   4   |   5   |   6   |   7   |   8   |   9   |     10    |　　合計　　|'
  puts score_board
end

playball