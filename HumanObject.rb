#!/bin/ruby
class HumanObject
  attr_accessor :destination_floor
  def initialize(current_floor)
    @destination_floor = generate_destfloor_randomly(current_floor)
  end

  def generate_destfloor_randomly(current_floor)
    dest_floor = rand(10)+32 # generate integer of [32,41]
    if dest_floor == 32 then
      dest_floor = 23 # floor#23 is irregular case
    end
    unless dest_floor == current_floor then
      return dest_floor
    else # dest=current case(unfortunately)
      return generate_destfloor_randomly(current_floor) # recursive call
    end
  end

  def ans_going_up(current_floor)
    # if this human wants to go up, return true
    # else, return false
    # (don't care dest=current situation)
    if @destination_floor > current_floor then
      return true
    else
      return false
    end
  end

  def ans_going_down(current_floor)
    # if this human wants to go up, return true
    # else, return false
    # (don't care dest=current situation)
    if @destination_floor > current_floor then
      return false
    else
      return true
    end
  end

end
