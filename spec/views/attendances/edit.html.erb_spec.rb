require 'spec_helper'

describe "/attendances/edit.html.erb" do
  include AttendancesHelper

  before(:each) do
    assigns[:attendance] = @attendance = stub_model(Attendance,
      :new_record? => false,
      :start_photo_id => 1,
      :end_photo_id => 1,
      :user_id => 1
    )
  end

  it "renders the edit attendance form" do
    render

    response.should have_tag("form[action=#{attendance_path(@attendance)}][method=post]") do
      with_tag('input#attendance_start_photo_id[name=?]', "attendance[start_photo_id]")
      with_tag('input#attendance_end_photo_id[name=?]', "attendance[end_photo_id]")
      with_tag('input#attendance_user_id[name=?]', "attendance[user_id]")
    end
  end
end
