#!/usr/bin/env ruby

# calculateGC is define in this script
require_relative 'calculate_gc'

# Obtain file contents
file_content = ARGV[0]

# Place file content in file variable
file = File.open(file_content, "r")

# Read file contents and place it inside variable
dna_strings = file.read
dna_array = dna_strings.split(/\r?\n/)

# Hash for storing {id_string => GC-content}
gcHash = Hash.new

# Hash for storing {id_string => dna_string}
dnaHash = Hash.new

tmp_str = ""
cur_id = ""

# Build dnaHash
dna_array.each do |element|

  if element.include? '>'
    element.gsub! '>', ''
    cur_id = element
    dnaHash[cur_id] = ""
    tmp_str = ""
  else
    tmp_str += element
  end

  dnaHash[cur_id] = tmp_str
end

# Look through dnaHash and figure out which has the highest Gc content and print out dna_string \n corresponding GC value
highestGCid = ""
highestGC = 0.0
dnaHash.each do |element|
  temp_gc = calculateGC element[1]
  if highestGC <= temp_gc
   highestGCid = element[0]
   highestGC = temp_gc
  end
end

puts highestGCid
puts highestGC

file.close

