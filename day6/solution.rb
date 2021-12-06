data = File.read('input.txt').split(',').map(&:to_i).tally

data.default = 0

days = 80
i = 0

while i < days do
    data = data.transform_keys! {|days| days - 1 }

    unless data[-1].nil?
        data[8] = data[-1]
        data[6] += data[-1]
        
        data.delete(-1)
    end

    i += 1
end

puts("Result: #{data.values.compact.sum}")