#!/bin/ruby
require 'spec_helper'
require './FloorObject.rb'

describe FloorObject do
  it "set floor number 23" do
    fO = FloorObject.new(23)
    expect(fO.floor_number).to eq 23
  end

  it "set_human " do
    fO = FloorObject.new(33)
    fO.set_human(10)
    expect(fO.human_arr.length).to eq 10
  end

  it "put_human_to_elv " do
    fO = FloorObject.new(41)
    fO.set_human(10)
    p fO.godown_flg
    p fO.goup_flg
    fO.put_human_to_elv(false, 2)
    p fO.human_arr.length
    expect(fO.human_arr.length).to eq 8
  end
end
