require "matrix"

require "pry"

file = File.open("input.txt")
data = file.readlines.map(&:chomp).map{|el| el.split(" -> ")}

$counter = 0

def check_if_visited(row, positions)
    return if row.nil?

    # puts("ROW #{row}")
    # puts("position #{positions}")

    positions.each do |position|
        # puts("position1 #{position}")
        $counter += 1 if row.include?(position)
    end

    # puts("COUUNTERRR: #{$counter}")
end

hash = {}

i = 0
while i < data.length do
    x1 = data[i][0].split(',')[0].to_i
    y1 = data[i][0].split(',')[1].to_i

    x2 = data[i][1].split(',')[0].to_i
    y2 = data[i][1].split(',')[1].to_i

    if (x1 != x2) && (y2 != y1) then
        i += 1
        next
    end

    if y2 == y1 then
        positions = (x1..x2).to_a.empty? ? (x2..x1).to_a : (x1..x2).to_a

        # puts("x1 #{x1}; x2: #{x2}; y1: #{y1}; y2: #{y2}")
        # puts("positions #{positions}")

        check_if_visited(hash[y1], positions)

        hash[y1] ||= []
        hash[y1] << positions
        hash[y1] = hash[y1].flatten.uniq
    elsif x2 == x1 then
        k = y1 < y2 ? y1 : y2

        while k < [y1, y2].max + 1
            check_if_visited(hash[k], [x1])

            hash[k] ||= []
            hash[k] << x1

            hash[k] = hash[k].uniq
            k += 1
        end
    end

    # puts("HASH #{hash}")


    i += 1
end

# hash.each_with_index do |line|
#     puts "#{line[0]} - #{line[1]}"
# end

puts("HASH #{hash}")
puts("COUNTER #{$counter}")
