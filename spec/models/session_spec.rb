require 'rails_helper'

RSpec.describe Session do
  describe 'validations' do
    it { is_expected.to validate_length_of(:email).is_at_least(8) }
    it { is_expected.to validate_length_of(:password).is_at_least(8) }
  end

  describe 'credentials validation' do
    let(:session) { Session.new(email: 'papaleguas@gmail.com', password: password) }

    subject! { session.valid? }

    context 'correct' do
      let(:password) { 'anything' }

      it { is_expected.to be_truthy }
    end

    context 'incorrect' do
      let(:password) { 'password' }

      it { is_expected.to be_falsey }
      it { expect(session.errors.messages[:base]).to include('Invalid login information') }
    end
  end
end
