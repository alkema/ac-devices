# frozen_string_literal: true

require('rails_helper')

RSpec.describe('api/v1/devices/show', type: :view) do
  before(:each) do
    @api / v1_device = assign(:api / v1_device, Api::V1::Device.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
