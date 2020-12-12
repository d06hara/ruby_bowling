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

  # クラス変数（initialize後に値を保持)
  @@total_scores = [] #scoreの集まり
  #インスタンス生成するたびに１をたす、初期値は1
  @@frame = 0
  @@practice_scores = [[10],[8,2], [4, 5], [3, 7], [10], [10], [3, 3], [10], [10], [10, 8, 2]]
  # 初期化
  def initialize(frame_score = [])

    @@total_scores
    #インスタンス生成するたびに１を足す
    @@frame += 1
    # インデックス用変数
    @@now_frame_index = @@frame - 1
    @@before_frame_index = @@now_frame_index - 1
    @@two_before_frame_index = @@before_frame_index - 1

    # フレームスコア
    @frame_score = frame_score
    @now_frame_score = @@practice_scores[@@now_frame_index]
    @before_frame_score = @@practice_scores[@@before_frame_index]
    @two_before_frame_score = @@practice_scores[@@two_before_frame_index]

  end

  # 確認用
  def self.info
    puts ''
    print "#{@@total_scores}"
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
  # 2フレームのスコアの要素数チェック
  def check_two_before_score_length
    DOUBLE_ELEMENTS if @two_before_frame_score.length == 2
  end

  # 今のスコアの合計数チェック
  def check_now_score_sum
    STRIKE_OR_SPARE if @now_frame_score.sum == 10
  end
  # 前のスコアの合計数チェック
  def check_before_score_sum
    STRIKE_OR_SPARE if @before_frame_score.sum == 10
  end
  # ２フレーム前のスコアの合計数チェック
  def check_two_before_score_sum
    DOUBLE if @two_before_frame_score.sum == 20
  end

  # 現フレームスペア判定
  def now_spare?
    (check_now_score_length == SPARE_ELEMENTS) && (check_now_score_sum == SPARE) ? true : false
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

  # 2フレーム前ダブル判定
  def two_before_double?
    (check_two_before_score_length == DOUBLE_ELEMENTS) && (check_two_before_score_sum == DOUBLE) ? true : false
  end

  # 前のフレームに現在の１投目を追加する(前のフレームがスペアだった場合orストライクで今回もストライクの場合)
  def add_one_score_to_before_frame
    @@total_scores[@@before_frame_index].push(@now_frame_score[0])
  end

  # # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  def add_two_score_strike_case
    @@total_scores[@@before_frame_index].push(@now_frame_score[0]).push(@now_frame_score[1])
  end

  # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  def add_score_double_case
    @@total_scores[@@two_before_frame_index].push(@now_frame_score[0])
  end
end


# 加点が始まるのは2投目から
#前のフレームスコアをチェックする

# (1..10).each do |frame|
(AddScore::FIRST_FRAME..AddScore::MAX_FRAME).each do |frame|

  # インスタンス化
  add_score = AddScore.new
  add_score.frame_score_to_total_scores #合計スコアにフレームスコアを入れていく

  # 加点処理開始
  # 最初のフレームは処理をnextする
  if frame == 1
    next
  end

  # 前のフレームを確認する

  # 前のフレームがスペアだった場合、現在のフレームの1投目を追加
  if(add_score.before_spare?)
    add_score.add_one_score_to_before_frame
  end

  # # 前のフレームがストライクだった場合、現在のフレームの2投を追加、現在のフレームがストライクの場合は１投のみ追加
  if(add_score.before_strike?)
    (add_score.now_strike?) ? add_score.add_one_score_to_before_frame : add_score.add_two_score_strike_case
  end

  # ３フレーム以降の処理
  if frame >= 3 && (add_score.two_before_double?)
    add_score.add_score_double_case
  end

  # 確認用
  AddScore.info
end
print answer

