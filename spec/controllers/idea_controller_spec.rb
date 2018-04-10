require 'rails_helper'

RSpec.describe IdeaController, type: :controller do
  describe '#new' do
  +    it 'renders the new template' do
  +      get :new
  +      expect(response).to render_template(:new)
  +    end
  +
  +    it 'sets an instance variable with a new idea' do
  +      get :new
  +      expect(assigns(:idea)).to be_a_new(Idea)
  +    end
  +  end
  +
  +  describe '#create' do
  +    context 'with valid parameters' do
  +      def valid_request
  +        post :create, params: {
  +          idea: FactoryBot.attributes_for(:idea)
  +        }
  +      end
  +
  +      it 'create a new news article in the db' do
  +        count_before = Idea.count
  +        valid_request
  +        count_after = Idea.count
  +        expect(count_after).to eq(count_before + 1)
  +      end
  +
  +      it 'redirects to the show page of that news article' do
  +        valid_request
  +        expect(response).to redirect_to(news_article_path(Idea.last))
  +      end
  +
  +      it 'sets a flash message' do
  +        valid_request
  +        expect(flash[:notice]).to be
  +      end
  +    end
  +
  +    context 'with invalid parameters' do
  +      def invalid_request
  +        post :create, params: {
  +          idea: FactoryBot.attributes_for(:idea, title: nil)
  +        }
  +      end
  +
  +      it "doesn't create a news article in the database" do
  +        count_before = Idea.count
  +        invalid_request
  +        count_after = Idea.count
  +        expect(count_after).to eq(count_before)
  +      end
  +
  +      it "renders the new template" do
  +        invalid_request
  +        expect(response).to render_template(:new)
  +      end
  +    end
  +  end

end
