# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Incident, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user).optional }
    it { is_expected.to belong_to(:group).optional }
    it { is_expected.to belong_to(:category) }
  end
end
