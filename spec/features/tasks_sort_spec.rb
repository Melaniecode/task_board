# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Sort Management' do
  let!(:two_days_ago) { create(:task, title: 'Task 1', created_at: 2.days.ago) }
  let!(:one_day_ago) { create(:task, title: 'Task 2', created_at: 1.day.ago) }
  let!(:current) { create(:task, title: 'Task 3', created_at: Time.current) }

  describe '.order' do
    context 'when default order by id asc' do
      it { expect(Task.sorted_tasks({})).to eq([two_days_ago, one_day_ago, current]) }
    end

    context 'when order by id desc' do
      it { expect(Task.sorted_tasks(sort_by: 'id desc').to_a).to eq([current, one_day_ago, two_days_ago]) }
    end

    context 'when order by id asc' do
      it { expect(Task.sorted_tasks(sort_by: 'id asc').to_a).to eq([two_days_ago, one_day_ago, current]) }
    end

    context 'when order by created_at desc' do
      it { expect(Task.sorted_tasks(sort_by: 'created_at desc').to_a).to eq([current, one_day_ago, two_days_ago]) }
    end

    context 'when order by created_at asc' do
      it { expect(Task.sorted_tasks(sort_by: 'created_at asc').to_a).to eq([two_days_ago, one_day_ago, current]) }
    end
  end
end
