require 'rails_helper'

RSpec.describe 'Bikeramp API', type: :request do
  # initialize test data
  let!(:trips) { create_list(:trip, 10) }
  let(:trip_id) { trip.first.id }

  # Test suite for GET /api/trips
  describe 'GET /api/trips' do
    # make HTTP get request before each example
    before { get '/api/trips' }

    it 'returns todos' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /api/trips' do
    let(:start_address) { 'Krakow' }
    let(:destination_address) { 'Warszawa' }
    let(:price) { '70' }
    let(:valid_attributes) { { start_address: start_address,
      destination_address: destination_address, price: price, date: Time.now } }

    context 'when the request is valid' do
      before { post '/api/trips', params: valid_attributes }

      it 'creates a trip' do
        expect(json['start_address']).to eq(start_address)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/trips', params: { destination_address: destination_address } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match(/Validation failed: Start address can't be blank, Price can't be blank, Date can't be blank/)
      end
    end
  end
end
