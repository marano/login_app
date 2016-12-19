require 'rails_helper'

RSpec.describe SessionsController do
  describe '#new' do
    subject { get :new }

    it { is_expected.to be_success }
    it { is_expected.to render_template(:new) }
  end

  describe '#create' do
    let(:session_parameters) { { email: 'email', password: 'password' } }

    let(:session_double) { double(valid?: valid) }

    before { allow(Session).to receive(:new).with(session_parameters).and_return(session_double) }

    subject! { post :create, params: { session: session_parameters } }

    context 'success' do
      let(:valid) { true }

      it { is_expected.to redirect_to(root_path) }
      it { expect(session[:logged_in]).to be_truthy }
    end

    context 'invalid credentials' do
      let(:valid) { false }

      it { is_expected.to render_template(:new) }
      it { expect(assigns(:session)).to eql(session_double) }
      it { is_expected.to have_http_status(:bad_request) }
    end
  end
end
