class HighScores
  attr_accessor :scores

  def initialize(scores)
    @scores = scores
  end

  def latest
    scores.last
  end

  def personal_best
    scores.sort.last
  end

  def personal_top_three
    scores.sort.reverse.take(3)
  end

  def latest_is_personal_best?
    latest == personal_best
  end
end
