require 'rails_helper'

RSpec.describe HomeController do
  describe '#index' do
    subject { get :index }

    context 'logged in' do
      before { session[:logged_in] = true }

      it { is_expected.to be_success }
      it { is_expected.to render_template(:index) }
    end

    context 'logged out' do
      it { is_expected.to redirect_to(new_session_path) }
    end
  end
end
