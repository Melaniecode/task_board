# # frozen_string_literal: true

# require 'rails_helper'

# RSpec.describe 'User Management' do
#   describe 'Sign Up' do
#     before do
#       visit sign_up_path
#     end

#     context 'when signing up with valid information' do
#       before do
#         fill_in_sign_up_form('Regular', 'John Doe', 'newuser@example.com', 'password', 'password')
#         click_on I18n.t('registrations.new.sign_up')
#       end

#       it 'redirects to log in page' do
#         expect(page).to have_current_path(log_in_path)
#       end

#       it 'displays account create succeed notice' do
#         expect(page).to have_content(I18n.t('account_create_succeed'))
#       end
#     end

#     context 'when signing up with invalid information' do
#       before do
#         click_on I18n.t('registrations.new.sign_up')
#       end

#       it 'displays errors for missing fields' do
#         expect(page).to have_content("Authority #{I18n.t('errors.messages.blank')}")
#         expect(page).to have_content("Name #{I18n.t('errors.messages.blank')}")
#         expect(page).to have_content("Email #{I18n.t('errors.messages.blank')}")
#         expect(page).to have_content("Password #{I18n.t('errors.messages.blank')}")
#       end
#     end
#   end

#   describe 'Log In' do
#     let!(:user) { create(:user, email: 'user@example.com', password: 'password') }

#     before do
#       visit log_in_path
#     end

#     context 'when logging in with valid credentials' do
#       before do
#         fill_in 'Email', with: 'user@example.com'
#         fill_in 'Password', with: 'password'
#         click_on I18n.t('sessions.new.log_in')
#       end

#       it 'redirects to root' do
#         expect(page).to have_current_path(root_path)
#       end

#       it 'displays log in succeed notice' do
#         expect(page).to have_content(I18n.t('log_in_succeed'))
#       end
#     end

#     context 'when logging in with invalid credentials' do
#       before do
#         fill_in 'Email', with: 'invalid@example.com'
#         fill_in 'Password', with: 'invalid_password'
#         click_on I18n.t('sessions.new.log_in')
#       end

#       it 'redirects back to log in page' do
#         expect(page).to have_current_path(log_in_path)
#       end

#       it 'displays invalid log in alert' do
#         expect(page).to have_content(I18n.t('invalid_log_in'))
#       end
#     end
#   end

#   private

#   def fill_in_sign_up_form(authority, name, email, password, password_confirmation)
#     select authority, from: 'Authority'
#     fill_in 'Name', with: name
#     fill_in 'Email', with: email
#     fill_in 'Password', with: password
#     fill_in 'Password Confirmation', with: password_confirmation
#   end
# end
