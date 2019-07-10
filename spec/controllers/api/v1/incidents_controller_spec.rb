# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::IncidentsController, type: :request do
  let(:incident) { FactoryBot.create(:incident) }
  let(:user) { FactoryBot.create(:user) }
  let(:group) { FactoryBot.create(:group) }
  let(:category) { FactoryBot.create(:category) }

  before :each do
    @auth_tokens = auth_tokens_for_user(user)
  end
  describe 'GET #index' do
    it 'returns http success' do
      get api_v1_incidents_path, as: :json, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get api_v1_incident_path(incident.id), as: :json, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end

  describe 'DELETE #delete' do
    it 'returns http success' do
      delete api_v1_incident_path(incident.id), as: :json, headers: @auth_tokens
      expect(response).to have_http_status(:success)
    end
  end
  describe 'POST #create' do
    let(:incident_params) { FactoryBot.build(:incident, category: category, user: user, group: group).attributes }
    it 'returns http success and checks for params' do
      post api_v1_incidents_path, as: :json, headers: @auth_tokens, params: { incident: incident_params }
      expect(JSON.parse(response.body)).to include('title' => incident_params['title'])
      expect(JSON.parse(response.body)).to include('description' => incident_params['description'])
      expect(JSON.parse(response.body)).to include('user_id' => incident_params['user_id'])
      expect(JSON.parse(response.body)).to include('status' => incident_params['status'])
      expect(JSON.parse(response.body)).to include('pending' => incident_params['pending'])
      expect(JSON.parse(response.body)).to include('group_id' => incident_params['group_id'])
      expect(JSON.parse(response.body)).to include('category_id' => incident_params['category_id'])
      expect(JSON.parse(response.body)).to include('attachment' => incident_params['attachment'])
      expect(JSON.parse(response.body)).to include('comment' => incident_params['comment'])
      expect(JSON.parse(response.body)).to include('step' => incident_params['step'])
    end
  end
end
