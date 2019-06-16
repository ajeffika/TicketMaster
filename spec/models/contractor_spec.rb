require 'rails_helper'

RSpec.describe Contractor, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:address) }
  end
end
