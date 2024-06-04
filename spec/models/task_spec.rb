# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task do
  describe 'Associations' do
    it { is_expected.to have_many(:task_tagships).dependent(:destroy) }
    it { is_expected.to have_many(:tags).through(:task_tagships) }
  end
end
