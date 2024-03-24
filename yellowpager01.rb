=begin
- Write a method that accepts a 10 character string of letters (both uppercase and lowercase)
- if not 10 characters in length, return false
- else:
  - define empty string variable (phone_number)
  - loop through string
  - compare letter to telephone mappings and concat to variable (phone_number)
  - return the variable (phone_number)

* You may need to ensure the letter casing of the input string *
=end

###############################################

# Example 1

def yellow_pager_one(word)
    # assign an empty string that we'll add characters to
    phone_num = ""
    
    # check for a correct word length of 10
    if word.length == 10
      # loop through the input string
      word.downcase.each_char do |letter|
        # if the letter matches our comparison, add the "number" to phone_num
        if letter == "a" || letter == "b" || letter == "c"
          phone_num += "2"
        elsif letter == "d" || letter == "e" || letter == "f"
          phone_num += "3"
        elsif letter == "g" || letter == "h" || letter == "i"
          phone_num += "4"
        elsif letter == "j" || letter == "k" || letter == "l"
          phone_num += "5"
        elsif letter == "m" || letter == "n" || letter == "o"
          phone_num += "6"
        elsif letter == "p" || letter == "q" || letter == "r" || letter == "s"
          phone_num += "7"
        elsif letter == "t" || letter == "u" || letter == "v"
          phone_num += "8"
        elsif letter == "w" || letter == "x" || letter == "y" || letter == "z"
          phone_num += "9"
        else 
          phone_num += letter
        end
      end
  
      # return the concatenated string of numbers
      phone_num
    else
      false
    end
  end
  
  puts yellow_pager_one("Lighthouse")
  
  =begin
  
    *** Alternate control flow instead of multiple || ***
  
    if ["a", "b", "c"].include?(letter)
      phone_num += "2"
    elsif ["d", "e", "f"].include?(letter)
      phone_num += "3"
    elsif ["g", "h", "i"].include?(letter)
      phone_num += "4"
    elsif ["j", "k", "l"].include?(letter)
      phone_num += "5"
    elsif ["m", "n", "o"].include?(letter)
      phone_num += "6"
    elsif ["p", "q", "r", "s"].include?(letter)
      phone_num += "7"
    elsif ["t", "u", "v"].include?(letter)
      phone_num += "8"
    elsif ["w", "x", "y", "z"].include?(letter)
      phone_num += "9"
    else 
      phone_num += letter
    end
  
  =end
  
  
  # Example 2
  
  def yellow_pager_two(word)
    phone_number = ""
    
    if word.length == 10    
      word.upcase.split("").each do |letter|
        # case statement (another option for control flow)
        case letter
          when "A", "B", "C"
            phone_number.concat("2")
          when "D", "E", "F"
            phone_number.concat("3")
          when "G", "H", "I"
            phone_number.concat("4")
          when "J", "K", "L"
            phone_number.concat("5")
          when "M", "N", "O"
            phone_number.concat("6")
          when "P", "Q", "R", "S"
            phone_number.concat("7")
          when "T", "U", "V"
            phone_number.concat("8")
          when "W", "X", "Y", "Z"
            phone_number.concat("9")
          else
            phone_number.concat(letter)
        end
      end
  
      phone_number
    else
      false
    end
  end
  
  puts yellow_pager_two('Lighthouse')
  
  # Example 3
  
  phone_map = [
    ["1", ""],
    ["2", "abc"],
    ["3", "def"],
    ["4", "ghi"],
    ["5", "jkl"],
    ["6", "mno"],
    ["7", "pqrs"],
    ["8", "tuv"],
    ["9", "wxyz"],
    ["0", ""]
  ]
  
  def yellow_pager_three(word, mapper)
    phone_num = ""
    
    if word.length == 10
      # A loop within a loop using the mapping array
      word.downcase.each_char do |char|
        mapper.each do |elm|
          if elm[1].include? char
            phone_num << elm[0]
          elsif elm[0].eql? char
            phone_num << char
          end
        end
      end
      
      phone_num
    else
      false
    end
  end
  
  puts yellow_pager_three("Lighthouse", phone_map)