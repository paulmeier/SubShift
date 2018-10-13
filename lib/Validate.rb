#h1:m1:s1,d1 = start time of this frame, in hours minutes and seconds to three decimal places.
class Validate

  def initialize
  end
  
  def frame_string(line)
    if line.rpartition(ARROW)[0].match(TIMESTAMP) && line.rpartition(ARROW)[2].match(TIMESTAMP) && line.size == 29
      return true
    else
      return false
    end  
  end

  def shift_time(time)
    if time.match(MILSECFORMAT) || time.match(/[0-9],[0-9][0-9][0-9]/)
      return true
    else
      return false
    end
  end
  
  def frame_time(time)
    if time.match(TIMESTAMP)
      return true
    else
      return false
    end
  end
  
  def arg_operation(operation)
    if operation.upcase == 'ADD' || operation.upcase == 'SUB'
      return true
    else
      return false
    end   
  end
  
end