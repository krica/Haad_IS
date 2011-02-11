require 'spec_helper'

describe Pause do
  before(:each) do
    @valid_attributes = {
      :start => Time.now,
      :end => Time.now,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :attendance_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Pause.create!(@valid_attributes)
  end
end
