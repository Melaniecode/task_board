# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  describe 'Associations' do
    it { is_expected.to have_many(:tags_tasks).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:tags_tasks) }
    it { is_expected.to belong_to(:user) }
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
    let(:tag1_first) { create(:tag, name: 'Tag1') }
    let(:tag2) { create(:tag, name: 'Tag2') }
    let(:task1_done) { create(:task, title: 'Task 1', status: :done, priority: :high, tags: [tag1_first]) }
    let(:task2_inprogress) { create(:task, title: 'Task 2', status: :in_progress, priority: :low, tags: [tag1_first]) }
    let(:task1_inprogress) { create(:task, title: 'Task 1', status: :in_progress, priority: :low, tags: [tag2]) }

    describe '.title_search' do
      it 'returns tasks matching the title' do
        expect(described_class.filter_by_title('Task 1')).to contain_exactly(task1_done, task1_inprogress)
      end
    end

    describe '.status_search' do
      it 'returns tasks matching the status' do
        expect(described_class.filter_by_status(:in_progress)).to contain_exactly(task1_inprogress, task2_inprogress)
      end
    end

    describe '.priority_search' do
      it 'returns tasks matching the priority' do
        expect(described_class.filter_by_priority(:low)).to contain_exactly(task1_inprogress, task2_inprogress)
      end
    end

    describe '.tag_search' do
      it 'returns tasks matching the tag' do
        expect(described_class.filter_by_tag_ids(tag1_first.id)).to contain_exactly(task1_done, task2_inprogress)
      end
    end
  end
end
