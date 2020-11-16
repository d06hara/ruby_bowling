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

  player = "A"

  # 点数の付け方
  # frame x の一投目をscore x1、二投目をscore x2 とする
  # frame x の合計点数をtotal_score x とする
  score11 = rand(10)
  score12 = rand(10)
  total_score1 = score11 + score12
  puts score11
  puts score12
  puts total_score1

  # for i in (1..10) do
  #   puts i
  # end

  #結果出力
  puts ''
  puts 'フレーム|   1   |   2   |   3   |   4   |   5   |   6   |   7   |   8   |   9   |     10    |　　合計　　|'
  puts "　　#{player}　　|   #{total_score1}   |   2   |   3   |   4   |   5   |   6   |   7   |   8   |   9   |     10    |　　　　　　|"
end

playball