
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
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if (@p1points == @p2points and @p1points < 3)
      if (@p1points == 0)
        result = "Love"
      end
      if (@p1points == 1)
        result = "Fifteen"
      end
      if (@p1points == 2)
        result = "Thirty"
      end
      result += "-All"
    end
    if (@p1points == @p2points and @p1points > 2)
        result = "Deuce"
    end

    p1res = ""
    p2res = ""
    if (@p1points > 0 and @p2points == 0)
      if (@p1points == 1)
        p1res = "Fifteen"
      end
      if (@p1points == 2)
        p1res = "Thirty"
      end
      if (@p1points == 3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2points > 0 and @p1points == 0)
      if (@p2points == 1)
        p2res = "Fifteen"
      end
      if (@p2points == 2)
        p2res = "Thirty"
      end
      if (@p2points == 3)
        p2res = "Forty"
      end

      p1res = "Love"
      result = p1res + "-" + p2res
    end

    if (@p1points > @p2points and @p1points < 4)
      if (@p1points == 2)
        p1res="Thirty"
      end
      if (@p1points == 3)
        p1res = "Forty"
      end
      if (@p2points == 1)
        p2res = "Fifteen"
      end
      if (@p2points == 2)
        p2res = "Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2points > @p1points and @p2points < 4)
      if (@p2points == 2)
        p2res="Thirty"
      end
      if (@p2points == 3)
        p2res="Forty"
      end
      if (@p1points == 1)
        p1res="Fifteen"
      end
      if (@p1points == 2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1points > @p2points and @p2points >= 3)
      result = "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      result = "Advantage " + @player2Name
    end
    if (@p1points >= 4 and @p2points >= 0 and (@p1points - @p2points) >= 2)
      result = "Win for " + @player1Name
    end
    if (@p2points >= 4 and @p1points >= 0 and (@p2points - @p1points) >= 2)
      result = "Win for " + @player2Name
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
    @p1points += 1
  end

  def p2Score
    @p2points += 1
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @p1N = player1Name
    @p2N = player2Name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end

  def score
    if (@p1 < 4 and @p2 < 4) and (@p1 + @p2 < 6)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1 - @p2) * (@p1 - @p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end