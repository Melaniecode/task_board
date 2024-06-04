# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  describe 'Association' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:tags).through(:task_tagships) }
  end
end
