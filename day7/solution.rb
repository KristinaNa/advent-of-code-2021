data = File.read('input.txt').split(',').map(&:to_i)

def find_stars(data, is_constant_rate = true)
    min = data.min
    counter = []

    while min < data.max do
        fuel = 0

        data.each { |position|
            diff = (position - min).abs()
            
            unless is_constant_rate
                fuel += (diff**2 + diff) / 2
            else
                fuel += diff
            end
        }

        counter.push(fuel)
        min += 1
    end

    return counter.min
end

puts("Result for star nr1: #{find_stars(data)}")
puts("Result for star nr2: #{find_stars(data, false)}")
