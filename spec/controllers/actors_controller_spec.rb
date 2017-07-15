require 'rails_helper'

RSpec.describe ActorsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:actor) { create :actor }
    subject { get :edit, params: { id: 1 } }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #show' do
    let(:actor) { create :actor }
    subject { get :show, params: { id: 1 } }

    it_behaves_like 'template rendering action', :show
  end
end
