require 'rails_helper'

RSpec.describe SessionsController do
  describe '#new' do
    subject { get :new }

    it { is_expected.to be_success }
    it { is_expected.to render_template(:new) }
  end
end
