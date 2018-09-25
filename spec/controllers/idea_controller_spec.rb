require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  describe '#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'sets a new Idea model instance variable' do
      get :new

      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do
    def valid_request
      post :create, params: { idea: { title: 'valid request', description: 'a valid request' } }
    end

    context 'with valid attributes' do

      it 'creates new idea in the database' do
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end

      it 'redirects to idea show page' do
        valid_request
        last_idea = Idea.last
        expect(response).to redirect_to(idea_path(last_idea))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the record to the database' do
        count_before = Idea.count
        post :create, params: { idea: { title: nil, description: nil } }
        count_after = Idea.count
        expect(count_after).to eq(count_before)
      end
      
      it 'renders the new template' do
        post :create, params: { idea: { title: nil, description: nil } }
        expect(response).to render_template(:new)
      end
    end
  end
end
