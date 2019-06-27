# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  let(:incident) { FactoryBot.create(:incident) }
  let(:user) { FactoryBot.create(:user) }

  before :each do
    login_user
  end

  describe 'GET #index' do
    it 'returns http success' do
      get api_v1_incidents_path
      expect(response).to have_http_status(:success)
    end
  end
end
