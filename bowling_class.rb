class Bowling

  # 定数をimport
  include Property

  attr_accessor :total_score
  attr_accessor :frame

  # 全てに共通するもの
  def initialize(total_score = [], frame = 1)
    @total_score = total_score
    @frame = frame

    #インデックス用変数
    @now_frame_index = @frame - 1
    @before_frame_index = @now_frame_index - 1
    @two_before_frame_index = @before_frame_index - 1
  end

  # １投目呼び出し
  def first_throw
    FIRST_THROW
  end

  # 最初のフレーム 呼び出し
  def first_frame
    FIRST_FRAME
  end

  #最終フレーム呼び出し
  def last_frame
    LAST_FRAME
  end

  #最終フレームかどうか
  def last_frame?
    @frame == LAST_FRAME ? true : false
  end

end