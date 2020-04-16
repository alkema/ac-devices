require 'rails_helper'

RSpec.describe "api/v1/devices/edit", type: :view do
  before(:each) do
    @api/v1_device = assign(:api/v1_device, Api::V1::Device.create!())
  end

  it "renders the edit api/v1_device form" do
    render

    assert_select "form[action=?][method=?]", api/v1_device_path(@api/v1_device), "post" do
    end
  end
end
