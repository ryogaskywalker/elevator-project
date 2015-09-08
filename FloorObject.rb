#!/bin/ruby
require 'csv'
require './Parameters.rb'
require './HumanObject.rb'
FILENAME_FLOOR = "./floor_object_log.csv"

class FloorObject
  attr_accessor :floor_number
  attr_accessor :human_arr
  attr_accessor :goup_flg
  attr_accessor :godown_flg

  def initialize(floornum)
    @floor_number = floornum # expecting 23 or 33~41
    @human_arr = Array.new() # array list of human wating elevator in this floor
    @goup_flg = false # true: someone wants to go up
    @godown_flg = false # true: someone wants to go down
  end

  def set_human(human_num)
    # don't care human_num is minus number case
    if human_num > 0 then
      for num in 1..human_num do
        @human_arr<<HumanObject.new(@floor_number)
      end
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

  def put_human_to_elv(goup_flg, capasity)
    # expecting: goup_flg is true when e0 is going up
    if @goup_flg == goup_flg then
      # エレベータの進行方向に行きたい人がいるとき
      # hOを順番に見ていってcapa人までは追加する
      # エレベータが上向きか下向きかはforの外でやった方が早かった気がする
      @human_arr_copy = Marshal.load(Marshal.dump(@human_arr))
      for human in @human_arr_copy do
        if capasity > 0 and goup_flg then
          if human.ans_going_up(@floor_number) then
            @human_arr.delete(human)
            capasity -= 1
          end
        elsif capasity > 0 and !goup_flg then
          if human.ans_going_down(@floor_number) then
            @human_arr.delete(human)
            capasity -= 1
          end
        end
      end

    end
  end

  def log
    CSV.open(FILENAME_FLOOR, "a", :encoding => "SJIS") do |writer|
      writer << [$time, @human_arr.length]
    end
  end

end
