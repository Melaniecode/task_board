# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_confirmation_of(:password) }
    it { is_expected.to allow_value('test@example.com').for(:email) }
    it { is_expected.to validate_presence_of(:email).with_message(I18n.t('errors.messages.blank')) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end

  describe 'has_secure_password' do
    it { is_expected.to have_secure_password }
  end

  describe 'enums' do
    it { is_expected.to define_enum_for(:authority).with_values(normal: 0, admin: 1) }
  end
end
