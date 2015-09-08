#!/bin/ruby
require 'spec_helper'
require './HumanObject.rb'

describe HumanObject do
  it "initialize" do
    hO = HumanObject.new(23)
    p hO.destination_floor
    expect(hO.destination_floor).not_to eq 23
  end
end
