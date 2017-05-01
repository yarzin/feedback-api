require 'rails_helper'

RSpec.describe 'Feedback API', type: :request do
	let!(:feedbacks) { create_list(:feedback, 10) }
  let(:feedback_id) { feedbacks.first.id }

    # Test suite for GET /feedbacks
  describe 'GET /api/v1/feedbacks' do

    before { get '/api/v1/feedbacks' }

    it 'returns feedbacks' do
    	json = JSON.parse(response.body)
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code OK' do
      expect(response).to have_http_status(:ok)
    end
  end

  # Test suite for POST /feedbacks
  describe 'POST /feedbacks' do
    # valid payload
    let(:valid_attributes) { {age: '20', name: "Oleg Babiy", date: "2017-04-29", id_last_request: '1', attachment_file_name: 'example.txt'} }

    context 'when the request is valid' do
      before { post '/api/v1/feedbacks', params: valid_attributes }

      it 'creates a feedbacks' do
      	json = JSON.parse(response.body)
        expect(json['name']).to eq('Oleg Babiy')
      end

      it 'returns status code CREATED' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when the request is invalid' do
      before { post '/api/v1/feedbacks', params: { } }

      it 'returns status code Unprocessable_entity' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

    # Test suite for Show /boks/:id
  describe 'GET /feedbacks/:id' do
    before { get "/api/v1/feedbacks/#{feedback_id}" }

    it 'returns status code 200' do
      expect(response).to have_http_status(:ok)
    end
  end
end