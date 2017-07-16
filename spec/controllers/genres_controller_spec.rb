require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:genre) { create :genre }
    subject { get :edit, params: { id: 1 } }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #show' do
    let(:genre) { create :genre }
    subject { get :show, params: { id: 1 } }

    it_behaves_like 'template rendering action', :show
  end

  describe 'POST #create' do
    let!(:params) { { genre: build(:genre).attributes } }
    subject { post :create, params }


    context 'success' do
      it { is_expected.to redirect_to genre_path(controller.genre) }

      it 'creates genre' do
        expect{ subject }.to change(Genre, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    let!(:genre) { create :genre, name: 'Dramat'}
    let(:name) { 'Obyczjowy' }

    let!(:params) do
      { id: genre.id, genre: { name: name } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to genre_path(controller.genre) }

      context 'updates genre' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ genre.reload.name }.to(name) }
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:genre) { create :genre }
    subject { delete :destroy, id: genre.id }

    it { is_expected.to redirect_to genres_path }

  end


end
