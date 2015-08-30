#!/bin/bash

afinfo *.mov \
  | grep duration \
  | sed 's/estimated duration: //; s/ sec//' \
  | ruby -e '
  	sum=0.0
  	STDIN.each_line{|line|
  		sum += line.strip.to_f
    }
    puts Time.at(sum).utc.strftime("%H:%M:%S")
  '
