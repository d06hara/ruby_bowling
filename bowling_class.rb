class Bowling

  # 定数をimport
  include Property

  attr_accessor :total_score
  attr_accessor :frame

  # 全てに共通するもの
  def initialize(total_score = [], frame = 1)
    @total_score = total_score
    @frame = frame
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

  #合計スコアを計算する
  def sum_total_score
    @total_score.flatten.sum
  end

  #スコアボードを表示する
  def score_board
    score_board = ''
    # score_board = '1'
    (0..@total_score.length).each do |frame_score|
      # puts ''
      # print "#{@total_score[frame_score - 1]}"
      # puts ''
      # puts @total_score.length
      score_board += "    #{@total_score[frame_score - 1]}   |"
    end
    print score_board
  end

end