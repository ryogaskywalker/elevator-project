#!/bin/ruby
require 'csv'
require './Parameters.rb'

FILENAME_ELEVATOR = "./elevator_object_log.csv"

class ElevatorObject
  attr_accessor :state
  attr_accessor :current_floor
  attr_accessor :destination_floor_arr
  attr_accessor :human_arr
  attr_accessor :move_time
  attr_accessor :stop_flag

  def initialize(current_floor)
    @state = "stay" # stay, up or down
    @current_floor = current_floor
    @destination_floor_arr = Array.new # array of elevator's destination
    @human_arr = Array.new # array of human in the elevator
    @move_time = 0
    @stop_flag = false # when get on or get off
  end

  # get on the elevator method
  # this method does not check a capacity
  def get_on(human_arr)
    @human_arr.concat(human_arr)
    human_arr.each {|human|
      destination_floor = human.destination_floor
      unless destination_floor_arr.include?(destination_floor) then
        destination_floor_arr.push(destination_floor)
      end
    }
  end

  # get off the elevator method
  # this method does not check state(if human_arr.length is zero, this method does not change the state to stay)
  def get_off
    @destination_floor_arr.delete(@current_floor)
    new_human_arr = Array.new
    @human_arr.each {|human|
      destination_floor = human.destination_floor
      unless destination_floor == @current_floor then
        new_human_arr.push(human)
      end
    }
    @human_arr = new_human_arr
    if @human_arr.length == 0 then
      @state = "stay"
    end
  end

  def check_move(time, sign)
    if @move_time == time then
      @current_floor += sign * 1
      @move_time = 0
      if @destination_floor_arr.include?(@current_floor) then
        @destination_floor_arr.delete(@current_floor)
        get_off()
        @stop_flag = true
      end
      return false
    end
    return true
  end

  def move
    increment_flag = true
    if @stop_flag then
      if @move_time == $stop_time then
        @stop_flag = false
        @move_time = 0
        increment_flag = false
      end
    elsif @state == "up" then
      time = @current_floor = 23 ? $move_time_long : $move_time_short
      increment_flag = check_move(time, 1)
    elsif @state == "down" then
      time = @current_floor = 33 ? $move_time_long : $move_time_short
      increment_flag = check_move(time, -1)
    end
    if increment_flag then
      @move_time += 1
    end
  end

  def log
    CSV.open(FILENAME_ELEVATOR, "a", :encoding => "SJIS") do |writer|
      writer << [$time, @human_arr.length]
    end
  end
end
