# frozen_string_literal: true

require 'rails_helper'
include AuthorizationHelper
RSpec.describe Api::V1::IncidentsController, type: :request do
  let(:incident) { FactoryBot.create(:incident) }
  # let(:user) { FactoryBot.create(:user) }

  before :each do
    test_user = FactoryBot.create(:user)

    binding.pry

    sign_up(test_user)
    @auth_tokens = auth_tokens_for_user(test_user)
  end

  describe 'GET #index' do
    it 'returns http success' do
      binding.pry
      get api_v1_incidents_path, as: :json, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
end
