# spec/integration/devices_spec.rb
require 'swagger_helper'

describe 'Devices API' do

  path '/api/v1/devices' do

    post 'Creates a device' do
      tags 'Devices'
      consumes 'application/json'
      security [ api_key: [] ]

      parameter name: :device, in: :body, schema: {
        type: :object,
        properties: {
          serial_number: { type: :string },
          firmware_version: { type: :string },
          registered_on: { type: :string, format: 'date' }
        },
        required: [ 'serial_number', 'firmware_version', 'registered_on' ]
      }

      response '201', 'device created' do
        let(:api_key) { 'foobar' }
        let(:device) { { serial_number: 'Dodo', firmware_version: '1.1.1' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:api_key) { 'foobar' }
        let(:device) { { serial_number: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/devices/{id}' do

    get 'Retrieves a device' do
      tags 'Devices'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string
      security [ api_key: [] ]

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, }
          },
          required: [ 'id' ]

        let(:id) { Device.create(serial_number: 'foo').id }
        run_test!
      end

      response '404', 'device not found' do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
