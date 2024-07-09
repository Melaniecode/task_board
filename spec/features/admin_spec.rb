# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Management' do
  let(:user) { create(:user, :admin) }

  before do
    user_login(user)
    visit root_path
    click_on('管理使用者')
  end

  describe '.create' do
    context 'when viewing the user list' do
      it { expect(page).to have_content('使用者列表') }
      it { expect(page).to have_content(user.email) }
      it { expect(page).to have_content('查看更多') }
    end

    context 'when creating a user' do
      before do
        click_on '新增'
        fill_in '姓名', with: 'Test User'
        fill_in '信箱', with: 'testuser@example.com'
        select '一般使用者', from: '使用權限'
        fill_in '密碼', with: 'password'
        fill_in '確認密碼', with: 'password'
        click_on '確定'
      end

      it { expect(page).to have_content('新增成功！') }
      it { expect(page).to have_content('testuser@example.com') }
    end
  end

  describe '.edit' do
    context 'when editing a user' do
      before do
        click_on '修改'
        fill_in '姓名', with: 'Updated User'
        fill_in '信箱', with: 'testuser@example.com'
        select '一般使用者', from: '使用權限'
        fill_in '密碼', with: 'password'
        fill_in '確認密碼', with: 'password'
        click_on '確定'
      end

      it { expect(page).to have_content('權限不足！') }
      it { expect(page).to have_current_path(root_path) }
    end
  end

  describe 'Deleting a user' do
    before do
      visit admin_users_path
      form = find("form[action='/admin/users/#{user.id}'][method='post']")
      within(form) do
        click_on '刪除'
      end
    end

    context 'when deletes the last admin' do
      it { expect(page).to have_content('至少需有一個管理員！') }
      it { expect(page).to have_content(user.email) }
    end
  end
end
