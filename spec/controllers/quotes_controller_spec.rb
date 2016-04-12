require 'rails_helper'

RSpec.describe QuotesController, type: :controller do

  let(:quote) { create(:quote) }

  describe "#index" do
    it do
      get :index
      expect(response).to be_success
      expect(response).to render_template :index
      expect(assigns(:quotes)).to eq([quote])
    end
  end

  describe "#show" do
    it do
      get :show
      expect(response).to be_success
      expect(response).to render_template :show
    end
  end

  describe "#new" do
    it do
      get :new
      expect(response).to be_success
      expect(response).to render_template :new
    end
  end

  describe "#create" do
    it do
      post :create, nil, nil
      expect(response).to be_success
    end
  end
end