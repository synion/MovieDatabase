require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
   describe 'GET #index' do
    subject { get :index }

    it_behaves_like 'template rendering action', :index
  end

  describe 'GET #edit' do
    let(:movie) { create :movie }
    subject { get :edit, params: { id: 1 } }

    it_behaves_like 'template rendering action', :edit
  end

  describe 'GET #new' do
    subject { get :new }

    it_behaves_like 'template rendering action', :new
  end

  describe 'GET #show' do
    let(:movie) { create :movie }
    subject { get :show, params: { id: 1 } }

    it_behaves_like 'template rendering action', :show
  end

  describe 'POST #create' do
    let!(:params)  { { movie: { name: 'StarTrec', revenue: 23, genre_id: genre.id } } }
    let(:genre) { create :genre }
    subject { post :create, params }

    context 'success' do
      it { is_expected.to redirect_to movie_path(controller.movie) }

      it 'creates movie' do
        expect{ subject }.to change(Movie, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    let!(:movie) { create :movie, name: 'StarTrec', revenue: 23, genre: genre }
    let(:name) { 'Omni' }
    let(:genre) { create :genre }
    let!(:params) do
      { id: movie.id, movie: { name: name } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to movie_path(movie) }

      context 'updates movie' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ movie.reload.name }.to(name) }
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:movie) { create :movie, name: 'StarTrec', revenue: 23, genre: genre }
    let(:genre) { create :genre }
    subject { delete :destroy, id: movie.id }

    it { is_expected.to redirect_to movies_path }

  end
end
