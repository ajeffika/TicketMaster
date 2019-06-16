require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:incidents) }
    it { is_expected.to belong_to(:address) }
    it { is_expected.to have_many(:group_squads) }
    it { is_expected.to have_many(:groups).through(:group_squads) }
  end
end