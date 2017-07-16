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

  describe 'POST #create' do
    let!(:params) { { actor: build(:actor).attributes } }
    subject { post :create, params }


    context 'success' do
      it { is_expected.to redirect_to actor_path(controller.actor) }

      it 'creates movie' do
        expect{ subject }.to change(Actor, :count).by(1)
      end
    end
  end

  describe 'PUT #update' do
    let!(:actor) { create :actor, first_name: 'John', last_name: 'Smith'}
    let(:first_name) { 'Walter' }
    let(:last_name) { 'White' }

    let!(:params) do
      { id: actor.id, actor: { first_name: first_name } }
    end
    subject { put :update, params }

    context 'success' do
      it { is_expected.to redirect_to actor_path(controller.actor) }

      context 'updates actor' do
        subject { -> { put :update, params } }
        it { is_expected.to change{ actor.reload.first_name }.to(first_name) }
      end
    end
  end

  describe 'DELETE #destroy' do
    let!(:actor) { create :actor }
    subject { delete :destroy, id: actor.id }

    it { is_expected.to redirect_to actors_path }

  end
end
