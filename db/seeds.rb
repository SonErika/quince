open('data/sizes.csv') do |sizes|
  sizes.read.each_line do |size|
    size = size
    Dress.create!(size: size)
  end
end  