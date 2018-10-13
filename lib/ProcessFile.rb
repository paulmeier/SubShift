require_relative 'TimeStamp'
require_relative 'Validate'
  
  #Regular expressions. Global variables, if line format changes change these.
  ARROW = /\s[\w'-][\w'-]>\s/
  NUMBERFORMAT = /(\d)(?=\d{3}+(?:\.|$))(\d{3}\..*)?/
  TIMESTAMP = /[0-9][0-9]:[0-9][0-9]:[0-9][0-9],[0-9][0-9][0-9]/
  MILSECFORMAT = /[0-9][0-9],[0-9][0-9][0-9]/
  
class ProcessFile
  attr_accessor :ifile, :ofile, :shift_value, :operation, :check_valid
  
  def initialize(ifile, ofile, shift_value, operation)
    @ifile = ifile
    @ofile = ofile
    @shift_value = shift_value
    @operation = operation
    @check_valid = Validate.new
  end

  #Process the infile and call to ProcessTime to shift the time based on the
  #operation value given.
  def infile_proc
    
    clear_file(@ofile)
    
    File.foreach("#{ifile}") do |line|
      if check_valid.frame_string(line)
        write_file(@ofile, time_shift(line))
      else
        write_file(@ofile, line)
      end
    end
  end
  
  def time_shift(line)    
    #The string has a start time and an end time. Loop for each.   
    [0,2].each do |position|
      frame_string = line.rpartition(ARROW)[position]
      frame = TimeStamp.new(frame_string[0,2].to_i, frame_string[3,2].to_i, frame_string[6,2].to_i, frame_string[9,3].to_i)
      if operation == 'ADD'
        frame.add_time(shift_value)
      else
        frame.sub_time(shift_value)
      end
      frame.process_time
      line[line.rpartition(ARROW)[position]] = frame.format_time  
     end
      return line
  end
  
  #Open the file to append writing.
  def write_file(ofile,string)
    File.open(ofile, 'a') { |file| file.puts(string) }
  end
  
  #Clear the outfile to overwrite.
  def clear_file(ofile)
    File.open(ofile, 'w') { |file| file.truncate(0) }
  end
end
