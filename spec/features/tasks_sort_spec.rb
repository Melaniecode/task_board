# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Sort Management' do
  let(:task) { create(:task) }
  let(:now) { Time.zone.now }

  describe '.order' do
    before do
      create(:task, title: 'Task 1', content: 'Content 1', start_time: now, end_time: 5.days.from_now)
      create(:task, title: 'Task 2', content: 'Content 2', start_time: now, end_time: 1.day.from_now)
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
  end
end
