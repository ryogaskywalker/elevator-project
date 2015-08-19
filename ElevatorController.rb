#!/bin/ruby
require 'csv'
require './Parameters.rb'

FILENAME = "./test.csv"
class ElevatorController
    def simulate
        for $time in 1..LOOP_NUM
            # write Elevator Object Class
            # output file
            CSV.open(FILENAME, "a", :encoding => "SJIS") do |writer|
                #writer << [time, eObj]
                writer << [$time]
            end
        end
    end
    def judge
        for index in eObj do
            # call Elevator Objects method
            
        end
    end
end

sim = ElevatorController.new()
sim.simulate
