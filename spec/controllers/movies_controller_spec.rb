require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
   describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:movie) { create :movie }
    subject { get :edit, id: movie.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #show' do
    let(:movie) { create :movie }
    subject { get :show, id: movie.id }

    it_behaves_like 'template rendering action', :show
  end
end
