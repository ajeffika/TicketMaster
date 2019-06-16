require 'rails_helper'

RSpec.describe Sla, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:categories) }
    end
end
