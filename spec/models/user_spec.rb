# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'Validations' do
    subject { build(:user) }

    it { is_expected.to validate_uniqueness_of(:name) }
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  describe 'Before_destroy' do
    subject { admin.destroy }

    let!(:admin) { create(:user, :admin) }

    context 'when delete last admin' do
      it { is_expected.to be_falsy }
    end
  end
end
