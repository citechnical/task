#!/usr/bin/env ruby

#########################################################
# nt.rb - New Task (Ruby)
#
# written by: David L. Whitehurst
# date: May 5, 2015
#
# This program opens a file and records a new task
# that is going to be worked. This marks or captures
# the start date-time of when work begins. Work begins
# when the user of this program runs this and sends
# an argument that's the brief task name. The task
# name cannot have any spaces in it because it tells
# this program that the user is trying to send a 
# second argument
#
unless ARGV.length == 2
  puts "Usage: ruby nt.rb <task> <filename>"
  exit
end


new_task = ARGV[0]
filename = ARGV[1]

File.open(filename,'a') do |file|
file.puts "#{new_task}.#{Time.now}"
puts "Task added."
end
