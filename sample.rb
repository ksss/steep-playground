require 'net/http'

# Use stdlib

url = URI.parse('http://www.example.com/index.html')
if url.path && url.host
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  res.body
end

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

  def record
    { int: 123, str: "YO" }
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

Time.current.beginning_of_day.to_s

1.days.ago
