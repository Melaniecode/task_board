# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag do
  describe 'Associations' do
    it { is_expected.to have_many(:tags_tasks).dependent(:destroy) }
    it { is_expected.to have_many(:tasks).through(:tags_tasks) }
  end

  describe 'Validations' do
    subject { create(:tag) }

    it { is_expected.to validate_presence_of(:name) }
  end
end
