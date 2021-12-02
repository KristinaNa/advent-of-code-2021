file = File.open("input.txt")
data = file.readlines.map(&:chomp)

def first_star(data)
  $horizontal = 0
  $depth = 0

  data.map {
      |string| 

      current = string.split(' ')
      number = Integer(current[1])

      $horizontal += number if current.first == 'forward'
      $depth += number if current.first == 'down'
      $depth -= number if current.first == 'up'
  }

  $horizontal * $depth
end

def second_star(data)
  $aim = 0
  $horizontal = 0
  $depth = 0

  data.map {
      |string| 

      current = string.split(' ')
      number = Integer(current[1])

      $aim += number if current.first == 'down'
      $aim -= number if current.first == 'up'

      if current.first == 'forward'
        $horizontal += number
        $depth += $aim * number
      end
  }

  $horizontal * $depth
end


puts("Result for star nr1: #{first_star(data)}")
puts("Result for star nr2: #{second_star(data)}")