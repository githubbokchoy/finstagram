=begin
Directions

- Write a method that accepts a 10 character string of letters (both uppercase and lowercase)
- if 10 characters in length:
  - define an empty string to a variable (phone_num) - *already done
  - loop through 10 character string (word) - *already done
  - compare letter to telephone mappings and concatenate to the variable (phone_num)
  - return the variable (phone_number)
- else:
  - return false
  
----------------
- You may need to ensure the letter casing of the input string
=end

def yellow_pager(word)
    phone_num = ""
  
    # ** complete the if expression and statement to meet the condition **
    #if word.length == 10
    #if word.is_a? String
    if word.match?(/\A[A-Za-z]+\z/)
          word = word.upcase
        alphabet = ('A'..'Z').to_a
         numbers = [(2..6).to_a*3, [7]*4, [8]*3, [9]*4].flatten.sort
      alphanumeric_hash = Hash[alphabet.zip(numbers)] 
  
        word.each_char do |letter|
        # ** complete the conditions to map letters to numbers **
               phone_num += alphanumeric_hash[letter].to_s
      
      end
    puts phone_num
      # ** return the mapped phone number **
  
    else
  
      puts "False"
      
    end
  end
  
  # ** call method and pass the variable here (you may need to print (puts) the return value) **
  yellow_pager_word = "Lighthouse"

  yellow_pager(yellow_pager_word)
  