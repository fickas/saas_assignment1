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