require('matrix')
require 'pry'

file = File.open("input.txt")
data = file.read.split("\n\n").map { |row| row.split("\n")}

# draw_numbers = [13,47,64,52,60,69,80,85,57,1,2,6,30,81,86,40,27,26,97,77,70,92,43,94,8,78,3,88,93,17,55,49,32,59,51,28,33,41,83,67,11,91,53,36,96,7,34,79,98,72,39,56,31,75,82,62,99,66,29,58,9,50,54,12,45,68,4,46,38,21,24,18,44,48,16,61,19,0,90,35,65,37,73,20,22,89,42,23,15,87,74,10,71,25,14,76,84,5,63,95
# ]

draw_numbers = [7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1]

matrix_array = data.map { |row| row.map { |numbers|  numbers.split(" ") } } 

is_winner_found = false
left_boards = [*0..matrix_array.length-1]
p = 0

columns_counter = {}
while p < matrix_array.length do
    columns_counter[p] = {
        0 => 5,
        1 => 5,
        2 => 5,
        3 => 5,
        4 => 5
    }

    p += 1
end


winning_number = 0
winning_matrix = 0

draw_numbers.each do |number_to_check|
    puts("NUMBER TO CHECK #{number_to_check}")
    puts("LEFT BOARDS: #{left_boards}")
    i = 0
    # unless is_winner_count == 2 then
        while i < matrix_array.length  do
            k = 0
            # unless is_winner_count == 2 then
                while k < matrix_array[i].length do
                    row = matrix_array[i][k]
                
                    number_found_in = row.index(number_to_check.to_s) 
                    if number_found_in
                        count_found_elements_in_row = row.count(nil)

                        puts("NUMBER OF FOUND ELEMENTS IN ROW #{count_found_elements_in_row}")

                        # binding.pry

                        puts("BOARD NR: #{i}")
                        puts("ROW NR: #{k}")
                        puts("COLUMNS: #{columns_counter}")

                        unless columns_counter[i].nil?
                            columns_counter[i][number_found_in] -= 1
                        end

                        # if left_boards.include?(i)
                        if count_found_elements_in_row == 4
                            p "WINNER FOUND"

                            p "matrix_array[i]"
                            p matrix_array[i]

                            winning_number = number_to_check
                            winning_matrix = matrix_array[i]
                            row[number_found_in] = nil

                            matrix_array.delete_at(i)
   
                            left_boards.delete(i)

                            columns_counter.delete(i)

                            # i = board
                            # k = row in the boars

                            p "MATRIX ARRAY"
                            p matrix_array[i]
                            
                            break;
                        # end
                    end


                        puts("COOCOCOC #{columns_counter}")
                        unless columns_counter[i].nil?

                        columns_counter[i].each do |key, value|
                            # puts("KEY: #{key}")
                            # puts("value: #{value}")

                            if value == 0
  
                                p "WINNER FOUND in column"

                                p "number_to_check"
                                p number_to_check
                                p "matrix_array[i]"
                                p matrix_array[i]

                                p "columns"
                                p columns_counter
                                # is_winner_found = true
                                # is_winner_count += 1

                                winning_number = number_to_check
                                winning_matrix = matrix_array[i]

                                matrix_array.delete_at(i)

                                puts("COUNTER #{columns_counter.length}")
                                columns_counter.delete(i)
                                left_boards.delete(i)
                                # columns_counter.delete(k)
                                # binding.pry

                                break;
                            end


                          end

                        row[number_found_in] = nil
                        end
                    end

                    k += 1
                end
            # end

            i += 1
        end
    # end
end

def calculate_result(matrix, number)
    p "KEKEKKE"
    p matrix

    p "NUSUSUS"
    p number
    i = 0

    result = 0
    while i < matrix.length do
        unless matrix[i].compact.map {|st| st.to_i}.empty?
            result += matrix[i].map {|st| st.to_i}.inject(0, :+)
        end

        i += 1
    end

    result = result * number
    p "RESULT"
    p result
    
end

calculate_result(winning_matrix, winning_number)
