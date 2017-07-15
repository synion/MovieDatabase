require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:genre) { create :genre }
    subject { get :edit, id: genre.id }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #show' do
    let(:genre) { create :genre }
    subject { get :show, id: genre.id }

    it_behaves_like 'template rendering action', :show
  end

end
