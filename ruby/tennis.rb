
class TennisPlayer
  attr_reader :points, :name

  def initialize(player_name)
    @name = player_name
    @points = 0
  end

  def won_point()
    @points += 1
  end
end

class TennisGame1
  SCORE = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty",
  }.freeze
  private_constant :SCORE

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def score
    case
    when even_score?
      calculate_even_score
    when special_score?
      calculate_special_score
    else
      calculate_normal_score
    end
  end

  private

  def even_score?
    @player1.points == @player2.points
  end

  def special_score?
    @player1.points >= 4 || @player2.points >= 4
  end

  def calculate_even_score
    return "Deuce" if @player1.points > 2
    "#{SCORE[@player1.points]}-All"
  end

  def calculate_special_score
    difference = @player1.points - @player2.points
    leader_name = difference > 0 ? @player1.name : @player2.name
    result = difference.abs == 1 ? "Advantage" : "Win"

    [result, leader_name].join(" for ")
  end

  def calculate_normal_score
    [SCORE[@player1.points], SCORE[@player2.points]].join("-")
  end
end

class TennisGame2
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  def score
    result = ""
    if (@player1.points == @player2.points and @player1.points < 3)
      if (@player1.points == 0)
        result = "Love"
      end
      if (@player1.points == 1)
        result = "Fifteen"
      end
      if (@player1.points == 2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@player1.points == @player2.points and @player1.points > 2)
        result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@player1.points > 0 and @player2.points == 0)
      if (@player1.points == 1)
        p1res = "Fifteen"
      end
      if (@player1.points == 2)
        p1res = "Thirty"
      end
      if (@player1.points == 3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@player2.points > 0 and @player1.points == 0)
      if (@player2.points == 1)
        p2res = "Fifteen"
      end
      if (@player2.points == 2)
        p2res = "Thirty"
      end
      if (@player2.points == 3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@player1.points > @player2.points and @player1.points < 4)
      if (@player1.points == 2)
        p1res="Thirty"
      end
      if (@player1.points == 3)
        p1res = "Forty"
      end
      if (@player2.points == 1)
        p2res = "Fifteen"
      end
      if (@player2.points == 2)
        p2res = "Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@player2.points > @player1.points and @player2.points < 4)
      if (@player2.points == 2)
        p2res="Thirty"
      end
      if (@player2.points == 3)
        p2res="Forty"
      end
      if (@player1.points == 1)
        p1res="Fifteen"
      end
      if (@player1.points == 2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@player1.points > @player2.points and @player2.points >= 3)
      result = "Advantage for " + @player1.name
    end
    if (@player2.points > @player1.points and @player1.points >= 3)
      result = "Advantage for " + @player2.name
    end
    if (@player1.points >= 4 and @player2.points >= 0 and (@player1.points - @player2.points) >= 2)
      result = "Win for " + @player1.name
    end
    if (@player2.points >= 4 and @player1.points >= 0 and (@player2.points - @player1.points) >= 2)
      result = "Win for " + @player2.name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @player1.points += 1
  end

  def p2Score
    @player2.points += 1
  end
end

class TennisGame3
  def initialize(player1, player2)
    @p1 = player1
    @p2 = player2
  end


  def score
    if (@p1.points < 4 and @p2.points < 4) and (@p1.points + @p2.points < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1.points]
      @p1.points == @p2.points ? s + "-All" : s + "-" + p[@p2.points]
    else
      if (@p1.points == @p2.points)
        "Deuce"
      else
        s = @p1.points > @p2.points ? @p1.name : @p2.name
        (@p1.points - @p2.points) * (@p1.points - @p2.points) == 1 ? "Advantage for " + s : "Win for " + s
      end
    end
  end
end