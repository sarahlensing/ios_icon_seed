a = {:size => 1024, :name => "iTunesArtwork@2x"}
b = {:size => 512, :name => "iTunesArtwork"}
c = {:size => 152, :name => "Icon-76@2x"}
d = {:size => 144, :name => "Icon-72@2x"}
e = {:size => 120, :name => "Icon-60@2x"}
f = {:size => 114, :name => "Icon@2x"}
g = {:size => 100, :name => "Icon-Small-50@2x"}
h = {:size => 80, :name => "Icon-Small-40@2x"}
i = {:size => 76, :name => "Icon-76"}
j = {:size => 72, :name => "Icon-72"}
k = {:size => 58, :name => "Icon-Small@2x"}
l = {:size => 57, :name => "Icon"}
m = {:size => 50, :name => "Icon-Small-50"}
n = {:size => 40, :name => "Icon-Small-40"}
o = {:size => 29, :name => "Icon-Small"}

array = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o]

puts "\nCreating icons...\n\n"

create_errors = 0
resize_errors = 0

array.each do |hash|
  icon_name = hash[:name] + ".png"
  icon_size = hash[:size].to_s
  
  puts icon_size.to_s + "\n"
  
  cmd = "cp icon_seed.png #{icon_name}"
  icon_created = system(cmd)
  if !icon_created
    create_errors = create_errors + 1
  end
  
  cmd = "sips -Z #{icon_size} #{icon_name}"
  icon_resized = system(cmd)
  if !icon_resized
    resize_errors = resize_errors + 1
  end
  
  puts "\n"

end

puts "Finished.\n#{create_errors} Errors creating images. #{resize_errors} Errors resizing images.\n\n"
  

