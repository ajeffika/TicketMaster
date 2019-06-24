# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:contractors) }
    it { is_expected.to have_many(:users) }
  end
end
