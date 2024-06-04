# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  describe 'Association' do
    it { is_expected.to have_many(:tasks).dependent(:destroy) }
  end
end
