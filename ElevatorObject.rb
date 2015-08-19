#!/bin/ruby
require 'csv'
require './Parameters.rb'

FILENAME = "./elevator_object_log.csv"

class ElevatorObject
  def initialize(current_floor)
    @state = "stay" # stay, up or down
    @destination_floor_arr = Array.new # array of elevator's destination
    @current_floor = current_floor
    @human_arr = Array.new # array of human in the elevator
  end

  # get on the elevator method
  # this method does not check a capacity
  def get_on(human_arr)
    @human_arr.concat(human_arr)
    human_arr.each {|human|
      destination_floor = human.destination_floor # TODO using HumanObject getter method?
      unless destination_floor_arr.include?(destination_floor) then
        destination_floor_arr.push(destination_floor)
      end
    }
  end

  # get off the elevator method
  # this method does not check state(if human_arr.length is zero, this method does not change the state to stay)
  def get_off
    new_human_arr = Array.new
    @human_arr.each {|human|
      destination_floor = human.destination_floor # TODO using HumanObject getter method?
      unless destination_floor == @current_floor then
        new_human_arr.push(human)
      end
    }
    @human_arr = new_human_arr
  end

  def log
    CSV.open(FILENAME, "a", :encoding => "SJIS") do |writer|
      writer << [$time, @human_arr.length]
    end
  end
end
