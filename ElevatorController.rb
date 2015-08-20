#!/bin/ruby
require 'csv'
require './Parameters.rb'
require './ElevatorObject.rb'
require './FloorObject.rb'

FILENAME_MAIN = "./main_log.csv"

class ElevatorController
    def initialize
        @eO = []
        @fO = []
        for index in 1..7 
            @eO.push(ElevatorObject.new(23))
        end
        for index in 23..41
            if index < 24 & index >= 33 then
                @fO.push(FloorObject.new(index))
            end
        end
    end
    def simulate
        for $time in 1..LOOP_NUM
            # write Elevator Object Class
            @eO.each_with_index {
                
            }
            @fO.each_with_index { |fObj, index|
                if index == 0 then
                    fObj.set_human($INCIDENCE)
                elsif index == 1 then
                    fObj.set_human(5)
                elsif rand(600) == 1 then
                    fObj.set_human(1)
                end
            }
            # output file
            CSV.open(FILENAME_MAIN, "a", :encoding => "SJIS") do |writer|
                #writer << [time, eObj]
                writer << [$time]
            end
        end
    end
    def judge
        @eO.each_with_index{ |eObj, index|
            @fO.each_with_index{ |fObj, index|
                #fObj.
            }
        }
    end
end

sim = ElevatorController.new()
sim.simulate
