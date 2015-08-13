#!/bin/ruby
require 'csv'

LOOP_NUM = 10000

# global variables
$CAPACITY = 20
# 2.2 m / s (ref:README.md)
$SPEED = 2.2
# 10 / s
$INCIDENCE = 10

FILENAME = "./test.csv"

class ElevatorController
    def simulate
        for time in 1..LOOP_NUM
            # write Elevator Object Class
            # output file
            CSV.open(FILENAME, "a", :encoding => "SJIS") do |writer|
                #writer << [time, eObj]
                writer << [time]
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
