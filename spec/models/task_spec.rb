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

  describe 'Search' do
    let(:task1_done) { create(:task, title: 'Task 1', status: 'done') }
    let(:task2_inprogress) { create(:task, title: 'Task 2', status: 'in_progress') }
    let(:task1_inprogress) { create(:task, title: 'Task 1', status: 'in_progress') }

    describe '.title_search' do
      it { expect(described_class.title_search('Task 1')).to contain_exactly(task1_done, task1_inprogress) }
    end

    describe '.status_search' do
      it { expect(described_class.status_search(:in_progress)).to contain_exactly(task1_inprogress, task2_inprogress) }
    end
  end
end
