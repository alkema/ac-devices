require 'rails_helper'

RSpec.describe "api/v1/devices/new", type: :view do
  before(:each) do
    assign(:api/v1_device, Api::V1::Device.new())
  end

  it "renders new api/v1_device form" do
    render

    assert_select "form[action=?][method=?]", api_v1_devices_path, "post" do
    end
  end
end
