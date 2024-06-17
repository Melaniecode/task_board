# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User Management' do
  let(:user) { create(:user) }

  describe 'Log In' do
    before do
      visit log_in_path
      user_login(user)
    end

    context 'when logging in' do
      it { expect(page).to have_current_path(root_path) }
      it { expect(page).to have_content(I18n.t('log_in_succeed')) }
    end

    context 'when logging out' do
      before do
        click_on I18n.t('sessions.new.log_out'), match: :first
      end

      it { expect(page).to have_current_path(log_in_path) }
      it { expect(page).to have_content(I18n.t('log_out_succeed')) }
    end
  end

  describe 'Sign up' do
    before do
      visit sign_up_path

      fill_in 'user_name', with: 'Melanie'
      fill_in 'user_email', with: 'melanie@example.com'
      fill_in 'user_password', with: 'password'
      fill_in 'user_password_confirmation', with: 'password'
      select '一般使用者', from: 'user_authority'
      find(:button, I18n.t('registrations.new.sign_up'), match: :first).click
    end

    context 'with valid details' do
      it { expect(page).to have_content(I18n.t('account_create_succeed')) }
      it { expect(page).to have_current_path(log_in_path) }
    end
  end
end
