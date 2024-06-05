# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  describe 'Associations' do
    it { is_expected.to have_many(:tags_tasks).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:tags_tasks) }
  end

  describe 'Validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:start_time) }
    it { is_expected.to validate_presence_of(:end_time) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:priority) }
  end
end
