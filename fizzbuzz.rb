(1..100).each do |num|
    # 'num' references each number in the loop (1 to 15)
    if num % 3 ==0 && num % 5 == 0
      puts 'FizzBuzz'

    elsif num % 3 ==0 && num % 5 != 0
        puts 'Fizz'
    elsif num % 5 == 0 && num % 3 !=0
        puts 'Buzz'
        
    else
        puts num
    end
  end


