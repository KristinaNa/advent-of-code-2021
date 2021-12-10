file = File.open("input.txt")
data = file.readlines.map(&:chomp)

def first_star(data)
    result = 0
    map = {
        ')' => 3,
        ']' => 57,
        '}' => 1197,
        '>' => 25137
    }

    data.each { |row|
        has_to_close = []
        row = row.split('')

        row.each { |symbol|
            if symbol == '('
                has_to_close << ')' 
            elsif symbol == '{'
                has_to_close << '}' 
            elsif symbol == '['
                has_to_close << ']'
            elsif symbol == '<'
                has_to_close << '>'
            elsif has_to_close.pop != symbol
                result +=  map[symbol]
                break;   
            end
        }
    }

    return result
end

def second_star(data)
    result = []
    map = {
        ')' => 1,
        ']' => 2,
        '}' => 3,
        '>' => 4
    }

    data.each { |row|
        has_to_close = []
        row = row.split('')

        row.each { |symbol|
            if symbol == '('
                has_to_close << ')' 
            elsif symbol == '{'
                has_to_close << '}' 
            elsif symbol == '['
                has_to_close << ']'
            elsif symbol == '<'
                has_to_close << '>'
            elsif has_to_close.pop != symbol
                has_to_close = []
                break;
            end 
        }

        if has_to_close.any?
            i = has_to_close.size - 1
    
            acc = 0
            while i >= 0
            acc = acc * 5 + map[has_to_close[i]]
    
            i -= 1
            end
            result << acc
        end
    }

    mid = result.size / 2
    result.sort[mid]
end

puts("Result for star nr1: #{first_star(data)}")
puts("Result for star nr2: #{second_star(data)}")