def palindrome?(string)
       string = string.downcase.gsub(/[^a-z]/, '')
       if string.reverse == string # Checks if the string is the same reversed
               return true
       else # If string is not the same reversed
               return false
 end
end

 puts palindrome?("A man, a plan, a canal -- Panama") #=> true
 puts palindrome?("Madam, I'm Adam!") # => true
 puts palindrome?("Abracadabra") # => false (nil is also ok)

 def count_words(string)
   words = string.downcase.gsub(/[^a-z ]/, '').gsub(/  /, ' ')
   words = words.split(/ /)
   return words.inject(Hash.new 0) { |c, w| c[w] += 1; c }
 end

 x = count_words("A man, a plan, a canal -- Panama")
p x
# => {'a' => 3,'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
p count_words "Doo bee doo bee doo"
# => {'doo' => 3, 'bee' => 2}



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

=begin
[
  [
    [ ["Armando", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
  ],

  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]
=end

def rps_4_winner( bracket4 )
  player1 = bracket4[0][0]
  player2 = bracket4[0][1]
  player3 = bracket4[1][0]
  player4 = bracket4[1][1]
  top_winner = rps_game_winner( [].push( player1, player2 ))
  bottom_winner = rps_game_winner( [].push( player3, player4 ))
  return rps_game_winner( [].push( top_winner, bottom_winner ))
end

=begin
p rps_4_winner( [
                    [ ["Armando", "P"], ["Dave", "S"] ],
                    [ ["Richard", "R"], ["Michael", "S"] ],

                ])
=end

def tournament_play( array_of_4s )
  results = []
  for bracket4 in array_of_4s do
     results.push( rps_4_winner( bracket4 ))
  end
  p results
  if( results.length == 2 ) then return rps_game_winner( results ) end
  foursomes = results.length/4
  next_round = []
  for i in 0..foursomes-1 do
    j = i*4
    top2 = [].push( results[j], results[j+1])
    bottom2 = [].push( results[j+2], results[j+3])
    next_round[i] = [].push( top2, bottom2 )
  end
  return tournament_play( next_round )
end

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


def combine_anagrams(words)

  result = Array.new
  if( words.length == 0 ) then return result end
  result[0] = Array.new
  result[0][0] = words[0]
  for i in 1..words.length - 1 do
    aword = words[i].chars.sort
    found = false
    for j in 0..result.length-1 do
      rword = result[j][0]
      bword = rword.chars.sort
      if( aword == bword ) then
        result[j] = result[j].push( words[i] )
        found = true
        break
      end
    end  #inner loop
    if( found == true ) then next end
    temp = Array.new
    temp[0] = words[i]
    result = result.push( temp )
  end
  return result
end

p combine_anagrams( ['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'] )
p combine_anagrams( [] )