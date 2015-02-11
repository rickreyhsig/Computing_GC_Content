# Define Calculate GC-content of a DNA string
def calculateGC(dna_string)
  numofGC = 0
  dna_string.each_char { |char|
    if ( char == "G" || char == "C" )
      numofGC += 1
    end
  }
    return (numofGC.to_f/dna_string.length) * 100
end