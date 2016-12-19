require "uuidtools"

puts UUIDTools::UUID.random_create.to_s


filename = "hhgyt.png"
filename = UUIDTools::UUID.random_create.to_s+File.extname(filename)
puts filename