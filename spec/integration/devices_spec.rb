# spec/integration/devices_spec.rb
require 'swagger_helper'

describe 'Devices API' do

  path '/api/v1/devices' do

    post 'Creates a device' do
      tags 'Devices'
      consumes 'application/json', 'application/xml'
      parameter name: :device, in: :body, schema: {
        type: :object,
        properties: {
          serial_number: { type: :string },
        },
        required: [ 'serial_number' ]
      }

      response '201', 'device created' do
        let(:device) { { serial_number: 'Dodo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:device) { { serial_number: 'foo' } }
        run_test!
      end
    end
  end

  path '/api/v1/devices/{id}' do

    get 'Retrieves a device' do
      tags 'Devices'
      produces 'application/json', 'application/xml'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'name found' do
        schema type: :object,
          properties: {
            id: { type: :integer, },
            name: { type: :string }
          },
          required: [ 'id', 'serial_number' ]

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
