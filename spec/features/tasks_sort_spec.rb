# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Sort Management' do
  let!(:user) { create(:user) }
  let(:now) { Time.zone.now }

  before { user_login(user) }

  describe '.order' do
    before do
      create(:task, title: 'Task 1', content: 'Content 1', start_time: now, end_time: 5.days.from_now,
                    priority: 'high', user:)
      create(:task, title: 'Task 2', content: 'Content 2', start_time: now, end_time: 1.day.from_now, priority: 'low',
                    user:)
      visit '/tasks'
    end

    let(:first_tr) { 'tbody tr:nth-child(1)' }
    let(:second_tr) { 'tbody tr:nth-child(2)' }

    context 'when default order by id asc' do
      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(second_tr)).to have_text('Task 2') }
    end

    context 'when order by id desc' do
      before { click_order_option('id', 'desc') }

      it { expect(find(first_tr)).to have_text('Task 2') }
      it { expect(find(second_tr)).to have_text('Task 1') }
    end

    context 'when order by id asc' do
      before { click_order_option('id', 'asc') }

      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(second_tr)).to have_text('Task 2') }
    end

    context 'when order by created_at desc' do
      before { click_order_option('created_at', 'desc') }

      it { expect(find(first_tr)).to have_text('Task 2') }
      it { expect(find(second_tr)).to have_text('Task 1') }
    end

    context 'when order by created_at asc' do
      before { click_order_option('created_at', 'asc') }

      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(second_tr)).to have_text('Task 2') }
    end

    context 'when order by end_time asc' do
      before { click_order_option('end_time', 'asc') }

      it { expect(find(first_tr)).to have_text('Task 2') }
      it { expect(find(second_tr)).to have_text('Task 1') }
    end

    context 'when order by end_time desc' do
      before { click_order_option('end_time', 'desc') }

      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(second_tr)).to have_text('Task 2') }
    end

    context 'when order by priority asc' do
      before { click_order_option('priority', 'asc') }

      it { expect(find(first_tr)).to have_text('Task 2') }
      it { expect(find(second_tr)).to have_text('Task 1') }
    end

    context 'when order by priority desc' do
      before { click_order_option('priority', 'desc') }

      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(second_tr)).to have_text('Task 2') }
    end
  end

  describe 'search' do
    let(:first_tr) { 'tbody tr:nth-child(1)' }
    let(:second_tr) { 'tbody tr:nth-child(2)' }

    before do
      tag1 = create(:tag, name: 'tag1')
      tag2 = create(:tag, name: 'tag2')
      create(:task, title: 'Task 1', start_time: now, end_time: 5.days.from_now, status: 'done', tags: [tag2], user:)
      create(:task, title: 'Task 2', start_time: now, end_time: 1.day.from_now, status: 'in_progress', tags: [tag1],
                    user:)
      visit '/tasks'
    end

    context 'when search title and status' do
      before do
        fill_in 'title', with: 'Task 1'
        select '已完成', from: 'status'
        select 'tag2', from: 'tag_ids'
        click_on I18n.t('tasks.index.confirm')
      end

      it { expect(find(first_tr)).to have_text('Task 1') }
      it { expect(find(first_tr)).to have_no_text('tag1') }
      it { expect(page).to have_no_text('Task 2') }
    end
  end
end
