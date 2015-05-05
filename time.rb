#!/usr/bin/env ruby

unless ARGV.length == 1
  puts "Usage: ruby time.rb <filename>"
  exit
end

filename = ARGV[0]

# method to subtract time parts
def subtract_time_only(ended, started)
  # do all the parsing and string manipulation up front
  endSeconds = ended.split(":").last
  startSeconds = started.split(":").last
  endSeconds = endSeconds.to_i
  startSeconds = startSeconds.to_i
  
  endHold = ended.split(":").drop(1).join(":")
  startHold = started.split(":").drop(1).join(":")
  endMinute = endHold.split(":").first
  startMinute = startHold.split(":").first
  endHour = ended.split(":").first
  startHour = started.split(":").first
  
  # to integers
  endHour = endHour.to_i
  startHour = startHour.to_i
  endMinute = endMinute.to_i
  startMinute = startMinute.to_i
 
  
  # "now check to round up for seconds"
  if endSeconds >= 30
    endMinute += 1
  end
  if startSeconds >= 30
    startMinute += 1
  end
  
  # now check if there's a need to add 60 minutes
  if startMinute > endMinute
    endMinute += 60
    endHour = endHour - 1
  end
  
  # do the minute subtraction
  resultMinute = endMinute - startMinute
  resultHour = endHour - startHour
  
  if resultMinute >= 15
    resultHour += 0.5
  end
  
  return resultHour
end


File.open(filename,'r') do |file|
    file.readlines.each do |line|
		  counter = 1
      task = line.split(".").first
		  timePart = line.split(".").last
		
		  #puts "The task is: #{task}"
		  #puts "The timePart is: #{timePart}"
      
      started = timePart.split(",,").first
      ended = timePart.split(",,").last
      
      puts "Task #{counter} started: #{started}"
      puts "Task #{counter} ended:   #{ended}"  
        
      datePartStarted = started.split(" ").first
      timePartStarted = started.split(" ").last
      
      datePartEnded = ended.split(" ").first
      timePartEnded = ended.split(" ").last
      
      if datePartStarted == datePartEnded
        # diff the time and we're done
        
      end
      
      hours = subtract_time_only("17:15:53", "16:55:17")
      puts "#{hours} hours"
      
      counter += 1

    end
end
