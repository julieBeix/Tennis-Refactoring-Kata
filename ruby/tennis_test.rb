require 'minitest'
require 'minitest/autorun'
require_relative "tennis"

TEST_CASES = [
   [0, 0, "Love-All", 'player1', 'player2'],
   [1, 1, "Fifteen-All", 'player1', 'player2'],
   [2, 2, "Thirty-All", 'player1', 'player2'],
   [3, 3, "Deuce", 'player1', 'player2'],
   [4, 4, "Deuce", 'player1', 'player2'],

   [1, 0, "Fifteen-Love", 'player1', 'player2'],
   [0, 1, "Love-Fifteen", 'player1', 'player2'],
   [2, 0, "Thirty-Love", 'player1', 'player2'],
   [0, 2, "Love-Thirty", 'player1', 'player2'],
   [3, 0, "Forty-Love", 'player1', 'player2'],
   [0, 3, "Love-Forty", 'player1', 'player2'],
   [4, 0, "Win for player1", 'player1', 'player2'],
   [0, 4, "Win for player2", 'player1', 'player2'],

   [2, 1, "Thirty-Fifteen", 'player1', 'player2'],
   [1, 2, "Fifteen-Thirty", 'player1', 'player2'],
   [3, 1, "Forty-Fifteen", 'player1', 'player2'],
   [1, 3, "Fifteen-Forty", 'player1', 'player2'],
   [4, 1, "Win for player1", 'player1', 'player2'],
   [1, 4, "Win for player2", 'player1', 'player2'],

   [3, 2, "Forty-Thirty", 'player1', 'player2'],
   [2, 3, "Thirty-Forty", 'player1', 'player2'],
   [4, 2, "Win for player1", 'player1', 'player2'],
   [2, 4, "Win for player2", 'player1', 'player2'],

   [4, 3, "Advantage for player1", 'player1', 'player2'],
   [3, 4, "Advantage for player2", 'player1', 'player2'],
   [5, 4, "Advantage for player1", 'player1', 'player2'],
   [4, 5, "Advantage for player2", 'player1', 'player2'],
   [15, 14, "Advantage for player1", 'player1', 'player2'],
   [14, 15, "Advantage for player2", 'player1', 'player2'],

   [6, 4, 'Win for player1', 'player1', 'player2'],
   [4, 6, 'Win for player2', 'player1', 'player2'],
   [16, 14, 'Win for player1', 'player1', 'player2'],
   [14, 16, 'Win for player2', 'player1', 'player2'],

   [6, 4, 'Win for player1', 'player1', 'player2'],
   [4, 6, 'Win for player2', 'player1', 'player2'],
   [6, 5, 'Advantage for player1', 'player1', 'player2'],
   [5, 6, 'Advantage for player2', 'player1', 'player2'],

   [6, 5, 'Advantage for Julie', 'Julie', 'Thiago'],
   [6, 5, 'Advantage for Thiago', 'Thiago', 'Julie'],
   [8, 2, 'Invalid score', 'Thiago', 'Julie'],
  ]

class TestTennis < Minitest::Test
  def play_game(tennisGameClass, p1Points, p2Points, p1Name, p2Name)
    player1 = TennisPlayer.new(p1Name)
    player2 = TennisPlayer.new(p2Name)

    game = tennisGameClass.new(player1, player2)
    p1Points.times { player1.won_point }
    p2Points.times { player2.won_point }
    game
  end

  def test_Score_Game1
    TEST_CASES.each do |testcase|
      (p1Points, p2Points, score, p1Name, p2Name) = testcase
      game = play_game(TennisGame1, p1Points, p2Points, p1Name, p2Name)

      assert_equal(score, game.score(), "Test case score: #{p1Points} - #{p2Points}")
    end
  end

  def test_Score_Game2
    TEST_CASES.each do |testcase|
      (p1Points, p2Points, score, p1Name, p2Name) = testcase
      game = play_game(TennisGame2, p1Points, p2Points, p1Name, p2Name)
      assert_equal(score, game.score(), "Test case score: #{p1Points} - #{p2Points}")
    end
  end

  def test_Score_Game3
    TEST_CASES.each do |testcase|
      (p1Points, p2Points, score, p1Name, p2Name) = testcase
      game = play_game(TennisGame3, p1Points, p2Points, p1Name, p2Name)
      assert_equal(score, game.score(), "Test case score: #{p1Points} - #{p2Points}")
    end
  end
end
