require "matrix"

file = File.open("input.txt")
data = file.readlines.map{|row| row.chomp.chars.map(&:to_i) }

def find_low_points(matrix)
    result = []

    matrix.each_with_index do |e, row, col|
        coordinates = []

        coordinates << matrix[row - 1, col] unless (row - 1).negative?
        coordinates << matrix[row, col - 1] unless (col - 1).negative?
        coordinates << matrix[row, col + 1]
        coordinates << matrix[row + 1, col]

        coordinates.select! { |number| !number.nil? }
        
        result << e if coordinates.min > e
    end

    return result
end

def first_star(data)
    matrix = Matrix.rows(data)
    lowest_points = find_low_points(matrix)
    result = lowest_points.map { |num| num + 1 }.sum
end

puts("Result for star nr1: #{first_star(data)}")
# puts("Result for star nr2: #{second_star(data2)}")
