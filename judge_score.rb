# 過去のフレームの判定をする
class JudgeScore

  #定数をimport
  include Property

  # アクセサ
  attr_accessor :frame_score

  def initialize(frame_score = [])
    @frame_score = frame_score
  end

  #スコアの合計を計算する
  def sum_frame_score
    @frame_score.sum
  end

  #フレームスコアの要素数を計算する
  def throw_count
    if @frame_score.length == 1
      ONE_THROW
    elsif @frame_score.length == 2
      TWO_THROW
    end
  end

  #ストライクを判定する
  def strike?
    (sum_frame_score == STRIKE) && (throw_count == ONE_THROW) ? true : false
  end
  
  #スペアを判定する
  def spare?
    (sum_frame_score == SPARE) && (throw_count == TWO_THROW) ? true : false
  end

  #ダブルの判定
  def double?
    (sum_frame_score == DOUBLE) && (throw_count == TWO_THROW) ? true : false
  end

  #最終フレームが２投でおわるパターンかの判定
  def last_frame_two_throw?
    (throw_count == TWO_THROW) && (sum_frame_score < SPARE) ? true : false
  end
  
end
