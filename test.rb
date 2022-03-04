require 'net/http'

# Use stdlib

puts "# Print HTTP HEADER"

res = Net::HTTP.get_response(URI.parse("https://www.google.co.jp/"))
res.each_header do |key, value|
  puts "#{key}: #{value}"
end
puts

puts "# Print Content"
puts "Digest: #{Digest::MD5.hexdigest(res.body)}"
puts

# Custom definition

class Sample
  def int
    42
  end

  def str
    "Hello"
  end

  def ary
    ["Hello", "World!"]
  end
end

class SampleCollection
  include Enumerable
  def each
    yield Sample.new
    self
  end
end

puts "# Print Custom code"

collection = SampleCollection.new
collection.each do |sample|
  sample.int
  sample.ary.each do |s|
    puts s.upcase
  end
end
