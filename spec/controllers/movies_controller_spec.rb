require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before do
    @user = create(:user)

    sign_in @user
    ActsAsTenant.current_tenant = @user
  end

  after do
    sign_out @user
    ActsAsTenant.current_tenant = nil
  end

  let!(:movie) { create(:movie) }
  let(:invalid_attributes) { attributes_for(:movie, name: '') }

  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: movie.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: movie.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Movie" do
        expect {
          post :create, params: {movie: attributes_for(:movie)}
        }.to change(Movie, :count).by(1)
      end

      it "redirects to the created movie" do
        post :create, params: {movie: attributes_for(:movie)}
        expect(response).to redirect_to(Movie.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {movie: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { attributes_for(:movie) }

      it "updates the requested movie" do
        put :update, params: {id: movie.to_param, movie: new_attributes}
        movie.reload
        expect(movie.attributes.symbolize_keys).to include(new_attributes)
      end

      it "redirects to the movie" do
        put :update, params: {id: movie.to_param, movie: new_attributes}
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: movie.to_param, movie: invalid_attributes}
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested movie" do
      expect {
        delete :destroy, params: {id: movie.to_param}
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      delete :destroy, params: {id: movie.to_param}
      expect(response).to redirect_to(movies_url)
    end
  end

end
