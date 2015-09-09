#!/bin/ruby
require 'spec_helper'
require './ElevatorObject.rb'
require './HumanObject.rb'

describe ElevatorObject do
  it 'initialize' do
    eo = ElevatorObject.new(23)
    expect(eo.state).to eq "stay"
    expect(eo.current_floor).to eq 23
    expect(eo.destination_floor_arr.length).to eq 0
    expect(eo.human_arr.length).to eq 0
    expect(eo.move_time).to eq 0
    expect(eo.stop_flag).to eq false
  end

  it 'get_on' do
    human_arr = Array.new()
    ho = HumanObject.new(23)
    human_arr.push(ho)
    eo = ElevatorObject.new(23)
    eo.get_on(human_arr)
    expect(eo.destination_floor_arr[0]).to eq ho.destination_floor
    expect(eo.human_arr.length).to eq 1
  end

  it 'get_off' do
    ho = HumanObject.new(23)
    human_arr = Array.new()
    human_arr.push(ho)
    eo = ElevatorObject.new(ho.destination_floor)
    eo.get_on(human_arr)
    eo.get_off()
    expect(eo.state).to eq "stay"
    expect(eo.destination_floor_arr.length).to eq 0
    expect(eo.human_arr.length).to eq 0
  end
end
