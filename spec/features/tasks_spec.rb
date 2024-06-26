# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Management' do
  let!(:task) { create(:task) }

  describe '.create' do
    before do
      visit new_task_path
      fill_in 'task_title', with: 'New Title'
      fill_in 'task_content', with: 'New Content'
      select '待處理', from: 'task_status'
      select '高', from: 'task_priority'
      fill_in 'task_start_time', with: '2024-06-07 10:00'
      fill_in 'task_end_time', with: '2024-06-07 12:00'
      click_on I18n.t('tasks.index.confirm')
    end

    context 'when viewing the tasks' do
      it { expect(page).to have_content('新增成功！') }
      it { expect(page).to have_content('New Title') }
      it { expect(page).to have_current_path(tasks_path) }
    end

    context 'when parameters are not valid' do
      before do
        visit new_task_path
        fill_in 'task_title', with: ''
        fill_in 'task_content', with: ''
        fill_in 'task_start_time', with: ''
        fill_in 'task_end_time', with: ''
        click_on I18n.t('tasks.index.confirm')
      end

      it { expect(page).to have_content('不能為空') }
    end
  end

  describe '.update' do
    before do
      visit edit_task_path(task)
      fill_in 'task_title', with: 'Update Title'
      fill_in 'task_content', with: 'Update Content'
      select '已完成', from: 'task_status'
      select '低', from: 'task_priority'
      fill_in 'task_start_time', with: '2024-06-07 10:00'
      fill_in 'task_end_time', with: '2024-06-07 12:00'
      click_on I18n.t('tasks.index.confirm')
    end

    context 'when parameters are valid' do
      it { expect(page).to have_content('更新成功！') }
      it { expect(page).to have_content('Update Title') }
    end

    context 'when parameters are not valid' do
      before do
        visit edit_task_path(task)
        fill_in 'task_title', with: ''
        fill_in 'task_content', with: ''
        fill_in 'task_start_time', with: ''
        fill_in 'task_end_time', with: ''
        click_on I18n.t('tasks.index.confirm')
      end

      it { expect(page).to have_content('不能為空') }
    end
  end

  describe '.delete' do
    before do
      visit tasks_path
      find('tr', text: task.title).click_on I18n.t('tasks.index.delete')
    end

    context 'when deleting a task' do
      it { expect(page).to have_content('刪除成功！') }
      it { expect(page).to have_no_content(task.title) }
    end
  end
end
