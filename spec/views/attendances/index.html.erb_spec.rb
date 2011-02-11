require 'spec_helper'

describe "/attendances/index.html.erb" do
  include AttendancesHelper

  before(:each) do
    assigns[:attendances] = [
      stub_model(Attendance,
        :start_photo_id => 1,
        :end_photo_id => 1,
        :user_id => 1
      ),
      stub_model(Attendance,
        :start_photo_id => 1,
        :end_photo_id => 1,
        :user_id => 1
      )
    ]
  end

  it "renders a list of attendances" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
