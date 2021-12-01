file = File.open("input.txt")
data = file.readlines.map(&:chomp)

def first_star(array)
    $i = 0
    $counter = 0

    while $i < array.length  do
        current = Integer(array[$i])
        last = Integer(array[$i-1])

        $counter += 1 if last > 0 and current > last

        $i +=1
    end

    return $counter
end

def second_star(array)
    $i = 0
    $new_arr = []
    
    while $i < array.length  do
        $new_arr.push(Integer(array[$i]) + Integer(array[$i+1]) + Integer(array[$i+2])) unless array[$i+2].nil?

        $i +=1
    end

    first_star($new_arr)
end

puts("Result for star nr1: #{first_star(data)}")
puts("Result for star nr2: #{second_star(data)}")
