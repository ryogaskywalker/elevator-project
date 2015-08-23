#!/bin/ruby

LOOP_NUM = 10000

# global variables
$CAPACITY = 20

# 2.2 m / s (ref:README.md)
$SPEED = 2.2

# 10 / s (23 floors)
$INCIDENCE = 10

$time = 0

$move_time_long = 10 # move time of 23F~33F
$move_time_short = 2 # other than the above
$stop_time = 2 # stop time
