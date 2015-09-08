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
end
