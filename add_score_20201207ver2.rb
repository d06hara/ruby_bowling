#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり



# 練習用スコア配列
answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 10, 3], [10, 3, 3], [3, 3], [10, 10, 10], [10, 10, 8], [10, 8, 2]]

#---------------------

class AddScore

  MAX_PINS = 10
  STRIKE = 10
  SPARE = 10
  STRIKE_OR_SPARE = 10
  DOUBLE = 20
  FIRST_FRAME = 1
  MAX_FRAME = 10
  SPARE_ELEMENTS = 2
  STRIKE_ELEMENT = 1
  DOUBLE_ELEMENTS = 2
  FIRST_THROW_INDEX = 0
  SECOND_THROW_INDEX = 1
  

  # クラス変数（initialize後に値を保持)
  @@total_scores = [] #scoreの集まり
  #インスタンス生成するたびに１をたす、初期値は1
  @@frame = 0
  @@practice_scores = [[10],[10], [4, 5], [3, 7], [10], [10], [3, 3], [10], [10], [10, 8, 2]]


  # @@now_frame_index = 0
  # @@before_frame_index = 0
  # @@two_before_frame_index = 0


  # 初期化
  def initialize(frame_score = [])
  # def initializa(frame_score = [], before_frame_score = [], two_before_frame_score = [])

    @@total_scores
    #インスタンス生成するたびに１を足す
    @@frame += 1
    # インデックス用変数
    @@now_frame_index = @@frame - 1
    @@before_frame_index = @@now_frame_index - 1
    # @@two_before_frame_index = @@before_frame_index - 1

    # フレームスコア
    @frame_score = frame_score
    @now_frame_score = @@practice_scores[@@now_frame_index]
    # @now_frame_score = now_frame_score = @@total_scores[@@now_frame_index]
    @before_frame_score = @@practice_scores[@@before_frame_index]
    # @before_frame_score = before_frame_score = @@total_scores[@@before_frame_index]
    # @two_before_frame_score = two_before_frame_score = @@total_scores[@@two_before_frame_index]


  end

  # 確認用
  def self.info
    puts ''
    print "#{@@frame}フレームまでの合計スコアは#{@@total_scores}"
    puts ''
  end

  # 合計スコアにフレームスコアを入れるメソッド
  def frame_score_to_total_scores
    @@total_scores.push(@now_frame_score)
  end

  # 今のスコアの要素数チェック
  def check_now_score_length
    @now_frame_score.length == 1 ? STRIKE_ELEMENT : SPARE_ELEMENTS
  end
  # 前のスコアの要素数チェック
  def check_before_score_length
    @before_frame_score.length == 1 ? STRIKE_ELEMENT : SPARE_ELEMENTS
  end

  # 今のスコアの合計数チェック
  def check_now_score_sum
    if @now_frame_score.sum == 10
      STRIKE_OR_SPARE
    end
  end
  # 前のスコアの合計数チェック
  def check_before_score_sum
    if @before_frame_score.sum == 10
      STRIKE_OR_SPARE
    end
  end

  # 現フレームスペア判定
  def now_spare?
    (check_now_score_length =f= SPARE_ELEMENTS) && (check_now_score_sum == SPARE) ? true : false
  end
  # 1フレームスペア判定
  def before_spare?
    (check_before_score_length == SPARE_ELEMENTS) && (check_before_score_sum == SPARE) ? true : false
  end

  # 現フレーム前ストライク判定
  def now_strike?
    (check_now_score_length == STRIKE_ELEMENT) && (check_now_score_sum == STRIKE) ? true : false
  end
  # １フレーム前ストライク判定
  def before_strike?
    (check_before_score_length == STRIKE_ELEMENT) && (check_before_score_sum == STRIKE) ? true : false
  end

  # # ダブル判定
  # def double?(frame_score)
  #   (frame_score.length == DOUBLE_ELEMENTS) && frame_score.sum == DOUBLE ? true : false
  # end

  # スペアの場合の加点（前のフレームスコアに現在の１投目を追加)
  def add_score_spare_case
    # puts ''
    # print "#{@@total_scores}"
    # puts ''
    # puts "#{@@before_frame_index}"
    # puts "#{@now_frame_score}"
    # total_scores[before_frame_index].push(now_frame_score[0])
    @@total_scores[@@before_frame_index].push(@now_frame_score[0])
  end

  # # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  # def add_score_strike_case(total_scores, before_frame_index, now_frame_score)
  #   total_scores[before_frame_index].push(now_frame_score[0]).push(now_frame_score[1])
  # end
  def add_one_score_strike_case
    @@total_scores[@@before_frame_index].push(@now_frame_score[0])
  end
  def add_two_score_strike_case
    @@total_scores[@@before_frame_index].push(@now_frame_score[0]).push(@now_frame_score[1])
  end

  # # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  # def add_score_double_case(total_scores, two_before_frame_index, now_frame_score)
  #   total_scores[two_before_frame_index].push(now_frame_score[0])
  # end
end


# 加点が始まるのは2投目から
#前のフレームスコアをチェックする

(1..5).each do |frame|
# (FIRST_FRAME..MAX_FRAME).each do |frame|

  # インスタンス化
  add_score = AddScore.new



  # 変数準備
  # now_frame_index = frame - 1
  # before_frame_index = now_frame_index - 1
  # two_before_frame_index = before_frame_index - 1

  # # このフレームスコア
  # now_frame_score = practice_scores[now_frame_index]
  # # 前のフレームスコアを取得する
  # before_frame_score = total_scores[before_frame_index]
  # # ２個前のフレームスコアも取得
  # two_before_frame_score = total_scores[two_before_frame_index]

  # テスト用配列にスコアを入れていく
  # total_scores.push(now_frame_score)


  add_score.frame_score_to_total_scores #合計スコアにフレームスコアを入れていく


  # puts add_score.strike?



  # 加点処理開始

  # 最初のフレームは処理をnextする
  if frame == 1
    next
  end
  
  # 前のフレームがスペアだった場合、現在のフレームの1投目を追加
  if(add_score.before_spare?)
    add_score.add_score_spare_case
  end
  # # 前のフレームがストライクだった場合、現在のフレームの2投を追加、現在のフレームがストライクの場合は１投のみ追加
  # if(strike?(before_frame_score))
  #   if(strike?(now_frame_score))
  #     # スペアケースと一緒
  #     add_score_spare_case(total_scores, before_frame_index, now_frame_score)
  #   else
  #     add_score_strike_case(total_scores, before_frame_index, now_frame_score)
  #   end
  # end

  # # 前のフレームがストライクだった場合、現在のフレームの2投を追加、現在のフレームがストライクの場合は１投のみ追加
  if(add_score.before_strike?)
    if(add_score.now_strike?)
      # スペアケースと一緒
      add_score.add_one_score_strike_case
    else
      add_score.add_two_score_strike_case
    end
  end


  # # ３フレーム以降の処理
  # if frame >= 3 && (double?(two_before_frame_score))
  #   add_score_double_case(total_scores, two_before_frame_index, now_frame_score)
  # end
  



  # # 最終フレームの処理
  # if frame == MAX_FRAME
  #   puts '最終フレーム'
  #   if(spare?(before_frame_score))
  #     add_score_spare_case(total_scores, before_frame_index, now_frame_score)
  #   elsif(strike?(before_frame_score))
  #     add_score_strike_case(total_scores, before_frame_index, now_frame_score)
  #   else
  #     puts '加点なし'
  #   end
  #   break
  # end


  AddScore.info
end


# print total_scores
# puts ''
# print practice_scores
# puts ''
# print total_scores
# puts ''
# print answer

