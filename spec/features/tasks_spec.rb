# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Task Management', type: :feature do
  let(:task) { create(:task) }

  describe '.create' do
    before do
      visit new_task_path
      fill_in 'Title', with: title
      fill_in 'Content', with: content
      click_button 'Create Task'
    end

    context 'can view the tasks' do
      let(:title) { 'New Title' }
      let(:content) { 'New Content' }
      it { expect(page).to have_content('Successfully Added Task!') }
      it { expect(page).to have_content('New Title') }
      it { expect(page).to have_current_path(tasks_path) }
    end

    context 'when not valid' do
      let(:title) { '' }
      let(:content) { '' }
      it { expect(page).to have_content("Title can't be blank") }
      it { expect(page).to have_content("Content can't be blank") }
    end
  end

  describe '.update' do
    before do
      visit edit_task_path(task)
      fill_in 'Title', with: title
      fill_in 'Content', with: content
      click_button 'Update Task'
    end
    context 'when is valid' do
      let(:title) { 'Update Title' }
      let(:content) { 'Update Content' }
      it { expect(page).to have_content('Updated Successfully!') }
      it { expect(page).to have_content("#{title} #{content}") }
    end
    context 'when not valid' do
      let(:title) { '' }
      let(:content) { '' }
      it { expect(page).to have_content("Title can't be blank") }
      it { expect(page).to have_content("Content can't be blank") }
    end
  end

  describe '.delete' do
    before do
      task
      visit tasks_path
      task_element = find('tr', text: task.title)
      task_element.click_button('Delete')
    end
    context 'delete a task' do
      it { expect(page).to have_content('Deleted Successfully!') }
      it { expect(page).not_to have_content(task.title) }
    end
  end
end
