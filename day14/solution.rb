file = File.open("input.txt")
data_split = file.read.split("\n\n")

template = data_split[0]
rules = data_split[1].split("\n").map {|i| i.split(" -> ")}

hash = {}
rules.each { |pair| hash[pair[0]] = pair[1].upcase }

pair_count = Hash.new(0)
template.chars.each_cons(2) { |a, b| pair_count[a + b] += 1 }

10.times do
    old_pc = pair_count.dup
    pair_count = Hash.new(0)

    old_pc.each do |k, v|
        found = hash[k]

        pair_count[k[0] + found] += v
        pair_count[found + k[1]] += v
    end
end

t = Hash.new(0)

pair_count.each do |k, v|
    t[k[0]] += v
end

t[template[-1]] += 1

p t.values.max - t.values.min