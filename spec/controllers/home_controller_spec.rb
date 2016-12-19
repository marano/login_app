require 'rails_helper'

RSpec.describe HomeController do
  describe '#index' do
    subject { get :index }

    it { is_expected.to be_success }
    it { is_expected.to render_template(:index) }
  end
end
