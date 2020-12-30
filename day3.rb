DATA = File.read("day3.txt").split.map { |line| line.chars.map { _1 == "#" } }

def trees_hit(dx, dy)
  DATA.each_with_index.count do |row, y|
    # You're not going to hit a tree on a row you're skipping
    next false if y % dy > 0

    x = y * dx / dy
    row[x % row.length]
  end
end

[
  trees_hit(1, 1),
  trees_hit(3, 1),
  trees_hit(5, 1),
  trees_hit(7, 1),
  trees_hit(1, 2)
].reduce(1, :*)
