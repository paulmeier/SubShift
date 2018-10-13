class TimeStamp
  attr_accessor :hours, :minutes, :seconds, :milliseconds
  
  def initialize(hours, minutes, seconds, milliseconds)
    @hours = hours
    @minutes = minutes
    @seconds = seconds
    @milliseconds = milliseconds
  end
  
  def add_time(shift_value)
     @seconds = @seconds + shift_value[0,2].to_i
     @milliseconds = @milliseconds + shift_value[3,3].to_i
  end
  
  def sub_time(shift_value)
     @seconds = @seconds - shift_value[0,2].to_i
     @milliseconds = @milliseconds - shift_value[3,3].to_i
  end
  
  def process_time
    process_milliseconds
    process_seconds
    process_minutes
  end
  
  def format_time
      "%02d" % @hours + ":" + "%02d" % @minutes + ":" + "%02d" % @seconds + "," + "%03d" % @milliseconds
  end
  
  def process_minutes
    if @minutes >= 60
      @hours = @hours + @minutes / 60
      @minutes = (@minutes % 60)
    end
  end
  
  def process_seconds
    if @seconds >= 60
      @minutes = @minutes + @seconds / 60
      @seconds = (@seconds % 60)
    end
  end
  
  def process_milliseconds
    if @milliseconds >= 999
      @seconds = @seconds + @milliseconds / 1000
      @milliseconds = (@milliseconds % 1000)
    end
  end
end