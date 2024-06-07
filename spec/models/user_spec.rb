# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    subject { build(:user) }

    it { is_expected.to validate_uniqueness_of(:name) }
  end
end
