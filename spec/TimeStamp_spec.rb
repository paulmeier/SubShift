require 'spec_helper'

describe TimeStamp, "Processing a subrip timestamp" do
  before(:each) do
    @timeframe = TimeStamp.new(01,31,58,928)
  end
  
  it "should return a correct milliseconds and seconds time" do
    @timeframe.add_time("2,000")
    @timeframe.process_time
    @timeframe.seconds.should == 0
    @timeframe.milliseconds.should == 928
  end
  
  it "should return a correct milliseconds and seconds time" do
    @timeframe.add_time("00,950")
    @timeframe.process_time
    @timeframe.seconds.should == 59
    @timeframe.milliseconds.should == 878
  end
  
  it "should return a correct changed time" do
    @timeframe.add_time("99,999")
    @timeframe.process_time
    @timeframe.minutes.should == 33
    @timeframe.seconds.should == 38
    @timeframe.milliseconds.should == 927
  end
  
  it "should return a correct changed time" do
    @timeframe.add_time("00,000")
    @timeframe.process_time
    @timeframe.hours.should == 01
    @timeframe.minutes.should == 31
    @timeframe.seconds.should == 58
    @timeframe.milliseconds.should == 928
  end
  
end