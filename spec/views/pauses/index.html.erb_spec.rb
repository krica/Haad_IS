require 'spec_helper'

describe "/pauses/index.html.erb" do
  include PausesHelper

  before(:each) do
    assigns[:pauses] = [
      stub_model(Pause,
        :start_photo_id => 1,
        :end_photo_id => 1,
        :attendance_id => 1
      ),
      stub_model(Pause,
        :start_photo_id => 1,
        :end_photo_id => 1,
        :attendance_id => 1
      )
    ]
  end

  it "renders a list of pauses" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
  end
end
