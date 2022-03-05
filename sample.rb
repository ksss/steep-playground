require 'net/http'

# Use stdlib

url = URI.parse('http://www.example.com/index.html')
req = Net::HTTP::Get.new(url.path)
res = Net::HTTP.start(url.host, url.port) {|http|
  http.request(req)
}
res.body

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
