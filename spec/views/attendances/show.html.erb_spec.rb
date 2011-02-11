require 'spec_helper'

describe "/attendances/show.html.erb" do
  include AttendancesHelper
  before(:each) do
    assigns[:attendance] = @attendance = stub_model(Attendance,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :user_id => 1
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
  end
end
