class ManageScore

  # この変数で全体スコアを管理
  @@total_score = []
  @@frame = 0

  # 全てに共通するもの
  def initialize
    # フレームはnewするたびに１をたす
    @@frame += 1

    #インデックス用変数
    @now_frame_index = @@frame - 1
    @before_frame_index = @now_frame_index - 1
    @two_before_frame_index = @before_frame_index - 1

  end

  # これが必要なのはなぜ?
  def total_score
    @@total_score
  end

  def now_frame_score
    @@total_score[@now_frame_index]
  end

  def before_frame_score
    @@total_score[@before_frame_index]
  end

  def two_before_frame_score
    @@total_score[@two_before_frame_index]
  end

end