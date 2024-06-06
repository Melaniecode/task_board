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

  context 'when start_time is after end_time' do
    let(:task) { build(:task, start_time: 2.days.from_now, end_time: 1.day.from_now) }

    before { task.valid? }

    it { expect(task.errors[:start_time]).to include('要早於結束時間') }
  end

  describe 'Enums' do
    it { is_expected.to define_enum_for(:status).with_values(pending: 0, in_progress: 1, done: 2) }
    it { is_expected.to define_enum_for(:priority).with_values(low: 0, medium: 1, high: 2) }
  end
end
