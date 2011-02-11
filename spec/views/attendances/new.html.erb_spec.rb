require 'spec_helper'

describe "/attendances/new.html.erb" do
  include AttendancesHelper

  before(:each) do
    assigns[:attendance] = stub_model(Attendance,
      :new_record? => true,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :user_id => 1
    )
  end

  it "renders new attendance form" do
    render

    response.should have_tag("form[action=?][method=post]", attendances_path) do
      with_tag("input#attendance_start_photo_id[name=?]", "attendance[start_photo_id]")
      with_tag("input#attendance_end_photo_id[name=?]", "attendance[end_photo_id]")
      with_tag("input#attendance_user_id[name=?]", "attendance[user_id]")
    end
  end
end
