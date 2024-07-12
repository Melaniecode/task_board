# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Errors' do
  describe 'GET /404' do
    before { get '/404' }

    it { expect(response).to have_http_status(:not_found) }
    it { expect(response.body).to include('404') }
  end

  describe 'GET /422' do
    before { get '/422' }

    it { expect(response).to have_http_status(:unprocessable_entity) }
    it { expect(response.body).to include('422') }
  end

  describe 'GET /500' do
    before { get '/500' }

    it { expect(response).to have_http_status(:server_error) }
    it { expect(response.body).to include('500') }
  end
end
