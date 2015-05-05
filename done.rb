#!/usr/bin/env ruby

unless ARGV.length == 2
  puts "Usage: ruby done.rb <filename> <tasknumber>"
  exit
end


filename = ARGV[0]

task_number = ARGV[1].to_i

File.open(filename,'r') do |file|
  File.open(filename + '.new','w') do |new_file|
    counter = 1
    file.readlines.each do |line|
      name,created,completed = line.chomp.split(/,/)
      if (task_number == counter)
        new_file.puts("#{name},#{created},#{Time.now}")
        puts "Task #{counter} completed"
      else
        new_file.puts("#{name},#{created},#{completed}")
      end

      counter += 1
    end
  end
end
cmd = "mv " + filename + ".new " + filename
%x[ #{cmd} ]
