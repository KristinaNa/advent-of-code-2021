require "matrix"

file = File.open("input.txt")
data = file.readlines.map(&:chomp)

def first_star(data)
    array = data.map { |row| row.split("") }
    matrix = Matrix.columns(array)

    i = 0
    gamma = ""
    epsilon = ""

    while i < array[0].count  do
        count = matrix.row(i).tally

        if count["0"] > count["1"]
            gamma += "0"
            epsilon += "1"
        else
            gamma += "1"
            epsilon += "0"
        end

        i += 1
    end

    return gamma.to_i(2) * epsilon.to_i(2)
end

def find_rating(array, i, find_most_common = true)
    matrix = Matrix.columns(array)
    count = matrix.row(i).tally

    if find_most_common
        to_find = count["0"] > count["1"] ? "0" : "1"
        to_find = "1" if count["0"] == count["1"]
    else
        to_find = count["0"] < count["1"] ? "0" : "1"
        to_find = "0" if count["0"] == count["1"]
    end

    array = array.find_all { |el| el[i] == to_find }

    return array.flatten.join("").to_i(2) if array.count == 1

    find_rating(array, i+1, find_most_common)
end

def second_star(array)
    find_rating(array, 0, true) * find_rating(array, 0, false)
end


puts("Result for star nr1: #{first_star(data)}")

new_data = data.map { |row| row.split("") }
puts("Result for star nr2: #{second_star(new_data)}")