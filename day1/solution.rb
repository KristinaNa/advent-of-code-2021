file = File.open("input.txt")
data = file.readlines.map(&:to_i)

def first_star(array)
    result = array.each_cons(2).select { |x, y| y > x }

    result.count
end

def second_star(array)
    sums = array.each_cons(3).map(&:sum)

    first_star(sums)
end

puts("Result for star nr1: #{first_star(data)}")
puts("Result for star nr2: #{second_star(data)}")
