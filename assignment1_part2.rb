class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  strategies = ["R", "P", "S"]
  p1 = game[0][1].upcase
  p2 = game[1][1].upcase
  raise NoSuchStrategyError unless (strategies.include?(p1) and
      strategies.include?(p2))
  if( p1 == "R" and p2 == "R" ) then return game[0]    end
  if( p1 == "R" and p2 == "P" ) then return game[1]   end
  if( p1 == "R" and p2 == "S" ) then return game[0]   end

  if( p1 == "P" and p2 == "R" ) then return game[0]   end
  if( p1 == "P" and p2 == "P" ) then return game[0]   end
  if( p1 == "P" and p2 == "S" ) then return game[1]      end

  if( p1 == "S" and p2 == "R" ) then return game[1]   end
  if( p1 == "S" and p2 == "P" ) then return game[0]   end
  if( p1 == "S" and p2 == "S" ) then return game[0]      end
end

def tournament_play( brackets )
  first =  brackets[0]
  second = brackets[1]
  if( first[0].class == String ) then return rps_game_winner(brackets) end
  results = []
  results[0] = tournament_play( first )
  results[1] = tournament_play( second )
  return tournament_play( results )
end

=begin
p tournament_play([
                      [
                          [ ["Armando", "P"], ["Dave", "S"] ],
                          [ ["Richard", "R"], ["Michael", "S"] ],
                      ],
                      [
                          [ ["Allen", "S"], ["Omer", "P"] ],
                          [ ["David E.", "R"], ["Richard X.", "P"] ]
                      ]
                  ] )

p tournament_play(
                      [
                          [ ["Armando", "P"], ["Dave", "S"] ],
                          [ ["Richard", "R"], ["Michael", "S"] ],
                      ]

                 )

p tournament_play(

          [ ["Armando", "P"], ["Dave", "S"] ]



  )

p tournament_play(
             [
                  [
                      [
                          [ ["Armando", "P"], ["Dave", "S"] ],
                          [ ["Richard", "R"], ["Michael", "S"] ],
                      ],
                      [
                          [ ["Allen", "S"], ["Omer", "P"] ],
                          [ ["David E.", "R"], ["Richard X.", "P"] ]
                      ]
                  ],

                  [
                      [
                          [ ["1", "P"], ["2", "S"] ],
                          [ ["3", "R"], ["4", "S"] ],
                      ],
                      [
                          [ ["5", "S"], ["6", "P"] ],
                          [ ["7", "R"], ["8", "P"] ]
                      ]
                  ]
             ]
  )
=end