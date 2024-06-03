# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Task Management' do
  let!(:task) { create(:task) }

  describe '.create' do
    before do
      visit new_task_path
      fill_in '標題', with: title
      fill_in '內容', with: content
      click_on I18n.t('helpers.submit.create')
    end

    context 'when view the tasks' do
      let(:title) { 'New Title' }
      let(:content) { 'New Content' }

      it { expect(page).to have_content('任務新增成功！') }
      it { expect(page).to have_content('New Title') }
      it { expect(page).to have_current_path(tasks_path) }
    end

    context 'when not valid' do
      let(:title) { '' }
      let(:content) { '' }

      it { expect(page).to have_content('標題 不能為空') }
      it { expect(page).to have_content('內容 不能為空') }
    end
  end

  describe '.update' do
    before do
      visit edit_task_path(task)
      fill_in '標題', with: title
      fill_in '內容', with: content
      click_on I18n.t('helpers.submit.update')
    end

    context 'when is valid' do
      let(:title) { 'Update Title' }
      let(:content) { 'Update Content' }

      it { expect(page).to have_content('任務更新成功！') }
      it { expect(page).to have_content("#{title} #{content}") }
    end

    context 'when not valid' do
      let(:title) { '' }
      let(:content) { '' }

      it { expect(page).to have_content('標題 不能為空') }
      it { expect(page).to have_content('內容 不能為空') }
    end
  end

  describe '.delete' do
    before do
      visit tasks_path
      task_element = find('tr', text: task.title)
      task_element.click_on I18n.t('tasks.index.delete')
    end

    context 'when delete a task' do
      it { expect(page).to have_content('任務刪除成功！') }
      it { expect(page).to have_no_content(task.title) }
    end
  end
end
# rubocop:enable Metrics/BlockLength
