# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Task Management' do
  let!(:task) { create(:task) }

  describe '.create' do
    before do
      visit new_task_path
      fill_in 'Title', with: title
      fill_in 'Content', with: content
      click_on 'Create Task'
    end

    context 'when view the tasks' do
      let(:title) { 'New Title' }
      let(:content) { 'New Content' }

      it { expect(page).to have_content('Successfully Added Task!') }
      it { expect(page).to have_content('New Title') }
      it { expect(page).to have_current_path(tasks_path) }
    end

    context 'when not valid' do
      let(:title) { '' }
      let(:content) { '' }

      it { expect(page).to have_content('Title can\'t be blank') }
      it { expect(page).to have_content('Content can\'t be blank') }
    end
  end

  describe '.update' do
    before do
      visit edit_task_path(task)
      fill_in 'Title', with: title
      fill_in 'Content', with: content
      click_on 'Update Task'
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

      it { expect(page).to have_content('Title can\'t be blank') }
      it { expect(page).to have_content('Content can\'t be blank') }
    end
  end

  describe '.delete' do
    before do
      visit tasks_path
      task_element = find('tr', text: task.title)
      task_element.click_on('Delete')
    end

    context 'when delete a task' do
      it { expect(page).to have_content('Deleted Successfully!') }
      it { expect(page).to have_no_content(task.title) }
    end
  end
end
# rubocop:enable Metrics/BlockLength
