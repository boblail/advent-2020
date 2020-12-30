Input = Struct.new(:min, :max, :character, :password) do
  def self.from((min, max, *rest))
    new(min.to_i, max.to_i, *rest)
  end

  def valid?
    (min..max).include?(password.count(character))
  end
end

File.read("day2.txt") \
  .scan(/^(\d+)\-(\d+) ([a-z]): ([a-z]+)$/) \
  .map(&Input.method(:from)) \
  .count(&:valid?)


Input2 = Struct.new(:i1, :i2, :character, :password) do
  def self.from((i1, i2, *rest))
    new(i1.to_i - 1, i2.to_i - 1, *rest)
  end

  def valid?
    (password[i1] == character) ^ (password[i2] == character)
  end
end

File.read("day2.txt") \
  .scan(/^(\d+)\-(\d+) ([a-z]): ([a-z]+)$/) \
  .map(&Input2.method(:from)) \
  .count(&:valid?)
