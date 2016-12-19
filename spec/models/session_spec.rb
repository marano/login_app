require 'rails_helper'

RSpec.describe Session do
  describe 'validations' do
    it { is_expected.to validate_length_of(:email).is_at_least(8) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end
end
