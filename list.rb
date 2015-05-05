#!/usr/bin/env ruby

unless ARGV.length == 1
  puts "Usage: ruby list.rb <filename>"
  exit
end


filename = ARGV[0]

File.open(filename,'r') do |file|
counter = 1
file.readlines.each do |line|
name,created,completed = line.chomp.split(/,/)
printf("%3d - %s\n", counter, name)
printf("      Created  : %s\n", created)
unless completed.nil?
  printf("      Completed  : %s\n", completed)
end
counter += 1
end
end
