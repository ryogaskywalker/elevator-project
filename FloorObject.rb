#!/bin/ruby
require 'csv'
require './Parameters.rb'
FILENAME = "./floor_object_log.csv"

class FloorObject
  def initialize(floornum)
    @floor_number = floornum # expecting 23 or 33~41
    @human_arr = Array.new() # array list of human wating elevator in this floor
    @goup_flg = false # true: someone wants to go up
    @godown_flg = false # true: someone wants to go down
  end

  def set_human(human_num)
    # don't care human_num is minus number case
    for num in 1..human_num do
      @human_arr<<HumanObject.new(@floor_number)
    end
    update_goup_flg
    update_godown_flg
  end

  def update_goup_flg
    # arr内のhOを舐めて上に行きたい人がいればtrueに
    # いなければfalseに
    # 毎回走査するイメージ
    @goup_flg = false
    for human in @human_arr do
      if human.ans_going_up(@floor_number) then
        @goup_flg = true
      end
    end
  end

  def update_godown_flg
    # same as above
    @godown_flg = false
    for human in @human_arr do
      unless human.ans_going_up(@floor_number) then
        @godown_flg = true
      end
    end
  end

  def log
    CSV.open(FILENAME, "a", :encoding => "SJIS") do |writer|
      writer << [$time, @human_arr.length]
    end
  end

end
