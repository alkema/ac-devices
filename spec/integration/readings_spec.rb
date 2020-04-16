# frozen_string_literal: true

# spec/integration/readings_spec.rb
require('swagger_helper')

describe 'Readings API' do
  path '/api/v1/readings' do
    post 'Creates a reading' do
      tags 'Readings'
      consumes 'application/json'
      security [{ api_key: [] }]

      parameter name: :reading,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    device_id: { type: :integer },
                    temperature: { type: :number },
                    humidity: { type: :number },
                    carbon_monoxide: { type: :integer },
                    health_status: { type: :string, maxLength: 150 },
                    reading_at: { type: :string, format: 'date-time' }
                  },
                  required: ['temperature']
                }

      response '201', 'reading created' do
        let(:reading) { { serial_number: 'Dodo' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:reading) { { serial_number: 'foo' } }
        run_test!
      end
    end
  end
end
