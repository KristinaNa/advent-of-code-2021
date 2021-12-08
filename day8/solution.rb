file = File.open("input.txt")
data = file.readlines.map(&:chomp)

def first_star(data)
    i = 0
    new_str = ''

    while i<data.length do
        split = data[i].split("|")[1]
        new_str += " #{split}"

        i += 1
    end

    second_part_arr = new_str.split(" ")

    k = 0
    counter = 0

    while k < second_part_arr.length do
        length = second_part_arr[k].length

        if length == 2 || length == 4 || length == 3 || length == 7 then
            counter += 1
        end

        k += 1
    end

    return counter
end

$length_map = {
    2 => 1,
    3 => 7,
    4 => 4,
    7 => 8,
}

def find_chars(subject, characters)
    characters.chars.all? { |char| subject.include?(char) }
end

def find_numbers(data)
    first_part = data.split("|")[0]
    arr = first_part.split(' ')

    # map numbers that we know: 1, 4, 7, 8
    known_numbers = {}
    new_hash = {}
    k = 0
    while k < arr.length do
        unless arr[k].length === 5 or arr[k].length === 6 then
            known_numbers[$length_map[arr[k].length]] = arr[k]
        end

        k += 1
    end

    # find another numbers: 0, 2, 3, 5, 6, 9
    m = 0
    while m < arr.length do
        if arr[m].length === 5
            four_eight_diff = known_numbers[8].split('') - known_numbers[4].split('')

            if find_chars(arr[m], known_numbers[7])
                new_hash[arr[m]] = 3
            elsif find_chars(arr[m], four_eight_diff.join(''))
                new_hash[arr[m]] = 2
            else
                new_hash[arr[m]] = 5
            end               
        elsif arr[m].length === 6
            if find_chars(arr[m], known_numbers[4])
                new_hash[arr[m]] = 9
            elsif find_chars(arr[m], known_numbers[7]) && !known_numbers.has_value?(4)
                new_hash[arr[m]] = 0
            else
                new_hash[arr[m]] = 6
            end   
        end

        m += 1
    end

    new_hash[known_numbers[1]] = 1
    new_hash[known_numbers[4]] = 4
    new_hash[known_numbers[7]] = 7
    new_hash[known_numbers[8]] = 8

    return new_hash
end

def second_star(data)
    i = 0
    result = 0

    while i < data.length do
        number_str = ''
        numbers_hash = find_numbers(data[i])
        second_part = data[i].split("|")[1].split(' ')

        k = 0
        while k < second_part.length do
            numbers_hash.map { |key, value|
                if find_chars(second_part[k], key) && ((key.length > second_part[k].length) || (key.length == second_part[k].length) )
                    number_str += value.to_s
                    next
                end
            }

            k += 1
        end

        result += number_str.to_i

        i += 1
    end

    return result
end

puts("Result for star nr1: #{first_star(data)}")
puts("Result for star nr2: #{second_star(data)}")
