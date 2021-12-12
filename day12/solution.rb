require 'set'

file = File.open("input.txt")
data = file.readlines.map{|row| row.chomp.split('-') }

graph = Hash.new

data.each do |path|
    if path[1] != 'start'
        graph[path[0]] ||= []
        graph[path[0]] << path[1]
    end

    if path[0] != 'start'
        graph[path[1]] ||= []
        graph[path[1]] << path[0]
    end
end

def first_star(graph, location, visited = Set.new)
    return 1 if location === 'end' 

    if location != 'start' && location != 'end' && location == location.downcase
        visited.add(location)
    end

    graph = graph[location].map do |n|
        next 0 if visited.include?(n)

        first_star(graph, n, visited.dup)
    end

    return graph.sum
end

def second_star(paths, location, visited = Set.new, double_visited = nil)
  return 1 if location == 'end'

  if location != 'start' && location != 'end' && location.downcase == location
    double_visited = location if visited.include?(location)

    visited.add(location)
  end

  paths[location].map { |n|
    next 0 if visited.include?(n) && !double_visited.nil?

    second_star(paths, n, visited.dup, double_visited)
  }.sum
end

puts("Result for star nr1: #{first_star(graph, "start")}")
puts("Result for star nr2: #{second_star(graph, "start")}")
