#h1:m1:s1,d1 = start time of this frame, in hours minutes and seconds to three decimal places.
require 'spec_helper'

describe Validate, "SubShift Validations" do
  before(:each) do
    @validchecker = Validate.new
  end
  
  #Validations for frame string ---------------------------------------
  it 'should return false for invalid format' do
    @validchecker.frame_string("01:31:58,928 111--> 01:31:61,664").should == false
  end
  
  it 'should return false for invalid format' do
    @validchecker.frame_string("101:31:58,928 --> 01:31:61,664").should == false
  end
  
  it 'should return false for invalid format' do
    @validchecker.frame_string("01:31:58,928 --> 01:31:61,0664").should == false
  end
  
  it 'should return false for invalid format' do
    @validchecker.frame_string("").should == false
  end
  
  it 'should return false for invalid format' do
    @validchecker.frame_string("1").should == false
  end
  
  it 'should return true for valid format' do
    @validchecker.frame_string("01:31:58,928 --> 01:31:61,664").should == true
  end
  
  #Validations for operation parameter ---------------------------------------
  it 'should return false for invalid operation' do
    @validchecker.arg_operation("FWEF").should == false
  end
  
  it 'should return false for invalid operation' do
    @validchecker.arg_operation("457347357").should == false
  end
  
  it 'should return false for invalid operation' do
    @validchecker.arg_operation("+").should == false
  end
  
  it 'should return true for valid operation' do
    @validchecker.arg_operation("add").should == true
  end
  
  it 'should return true for valid operation' do
    @validchecker.arg_operation("ADD").should == true
  end
  
  #Validations for time parameter ---------------------------------------
  it 'should return false for invalid time' do
    @validchecker.shift_time("321").should == false
  end
  
  it 'should return false for invalid time' do
    @validchecker.shift_time("sdfw").should == false
  end
  
  it 'should return false for invalid time' do
    @validchecker.shift_time("11111").should == false
  end
  
  it 'should return true for valid time' do
    @validchecker.shift_time("1,000").should == true
  end
  
  it 'should return true for valid time' do
    @validchecker.shift_time("1,999").should == true
  end
  
  it 'should return true for valid time' do
    @validchecker.shift_time("99,999").should == true
  end
  
  it 'should return true for valid time' do
    @validchecker.shift_time("01,999").should == true
  end
  
  
end