#===================
# 変数,定数
#===================
# total_scoresはscoresの集まり
# 練習用スコア配列
# answer = [[10, 8, 2], [8, 2, 4], [4, 5], [3, 7, 10], [10, 10, 3], [10, 3, 3], [3, 3], [10, 10, 10], [10, 10, 8], [10, 8, 2]]
# added_total_score = [] #scoreの集まり
# scores = [[10],[8,2], [4, 5], [3, 7], [10], [10], [3, 3], [10], [10], [10, 8, 2]]

#---------------------

class AddScore

  MAX_PINS = 10
  STRIKE = 10
  SPARE = 10
  STRIKE_OR_SPARE = 10
  DOUBLE = 20
  SPARE_ELEMENTS = 2
  STRIKE_ELEMENT = 1
  DOUBLE_ELEMENTS = 2

  # クラス変数（initialize後に値を保持)
  #インスタンス生成するたびに１をたす、初期値は1
  @@frame = 0
  # 初期化
  def initialize(frame_score = [], scores = [])

    #インスタンス生成するたびに１を足す
    @@frame += 1
    # インデックス用変数
    @@now_frame_index = @@frame - 1
    @@before_frame_index = @@now_frame_index - 1
    @@two_before_frame_index = @@before_frame_index - 1

    # フレームスコア
    @frame_score = frame_score
    @now_frame_score = scores[@@now_frame_index]
    @before_frame_score = scores[@@before_frame_index]
    @two_before_frame_score = scores[@@two_before_frame_index]

  end

  # 合計スコアにフレームスコアを入れるメソッド
  def frame_score_to_total_scores(added_total_score)
    added_total_score.push(@now_frame_score)
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
  def add_one_score_to_before_frame(added_total_score)
    added_total_score[@@before_frame_index].push(@now_frame_score[0])
  end

  # # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  def add_two_score_to_two_before_frame(added_total_score)
    added_total_score[@@before_frame_index].push(@now_frame_score[0]).push(@now_frame_score[1])
  end

  # ストライクの場合の加点（前のフレームスコアに現在の１投目と２投目を追加)
  def add_one_score_to_two_before_frame(added_total_score)
    added_total_score[@@two_before_frame_index].push(@now_frame_score[0])
  end
end

