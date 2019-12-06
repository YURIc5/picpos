require 'rails_helper'

describe PostsController, type: :controller do
  
  describe 'GET #index' do
    it "populates an array of posts ordered by created_at DESC" do
      posts = create_list(:post, 3)
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end

    it 'assigns @post' do
      get :index
      expect(assigns(:post)).to be_a_new(Post)
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #edit' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "renders the :edit template" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end
  
  describe 'GET #show' do
    it "assigns the requested post to @post" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "renders the :show template" do
      post = create(:post)
      get :show, params: {  id: post }
      expect(response).to render_template :show
    end
  end

  describe 'POST #create' do
    let(:params) { { post: attributes_for(:post) } }
    let(:invalid_params) { { post: attributes_for(:post, picture: nil, text: nil) } }

    context 'can save' do
      subject {
        post :create,
        params: params
      }
      it 'count up post' do
        expect{ subject }.to change(Post, :count).by(1)
      end

      it 'redirects to root_path' do
        subject
        expect(response).to redirect_to(root_path)
      end
    end
    context 'can not save' do
      subject {
        post :create,
        params: invalid_params
      }
      it 'does not count up' do
        expect{ subject }.not_to change(Post, :count)
      end
      it 'renders index' do
        subject
        expect(response).to render_template :index
      end
    end
  end

  describe 'PATCH #update' do
    let!(:post) { create(:post) }
    let(:update_attributes) do
      {
          picture: 'update picture',
          text: 'update text'
      }
    end
    it 'saves updated post' do
      expect do
        patch :update, params: { id: post.id, post: update_attributes }
      end.to change(Post, :count).by(0)
    end
    it 'redirects to root_path' do
      post_params = attributes_for(:post, text: "update-hello")
      patch :update, params: {  id: post.id, post: post_params }
      post.reload
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'DELETE #destroy' do
    let!(:post) { create(:post)}
    subject {
      delete :destroy, params: {  id: post.id }
    }
    it 'count down post' do
      expect{subject}.to change(Post, :count).by(-1)
    end
    it 'redirects to root_path' do
      post = create(:post)
      delete :destroy, params: {  id: post }
      expect(response).to redirect_to(root_path)
    end
  end
end