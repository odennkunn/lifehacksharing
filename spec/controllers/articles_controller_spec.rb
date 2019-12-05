require 'rails_helper'

describe ArticlesController, type: :controller do

  #newアクションがリクエストできるか
  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new  #responseはexample内でリクエストが行われた後の遷移先のビューの情報を持つインスタンス
                                                #render_templateで引数で指定したアクションがリクエストされた時に自動的に遷移するビューを返す
    end
  end


  describe 'GET #edit' do
    it "renders the :edit template" do
      article = create(:article)
      get :edit, params: { id: article }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "populates an array of articles ordered by created_at DESC" do
      articles = create_list(:article, 3)
      get :index
      expect(assigns(:article)).to match(articles.sort{|a, b| b.created_at <=> a.created_at })
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end



end