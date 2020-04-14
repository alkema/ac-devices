require 'rails_helper'

RSpec.describe "api/v1/devices/index", type: :view do
  before(:each) do
    assign(:api_v1_devices, [
      Api::V1::Device.create!(),
      Api::V1::Device.create!()
    ])
  end

  it "renders a list of api/v1/devices" do
    render
  end
end
