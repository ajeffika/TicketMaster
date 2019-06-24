# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:group_squads) }
    it { is_expected.to have_many(:users).through(:group_squads) }
  end
end
