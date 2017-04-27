require "rails_helper"

describe UsersController, :type => :controller do

  before do
    @user = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    #@user = User.create!(email: "andrea+50@crawford.cc", password: "123password")
    #@user2 = User.create!(email: "andrea+51@crawford.cc", password: "123password")
  end

  describe "GET #show" do

    context "User is logged in" do
      before do
        sign_in @user
      end

      it "Loads correct user details" do
        get :show, params: { id: @user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq @user
      end
    end

    context "No user is logged in" do
      it "redirects to login" do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(new_user_session_path)
      end
    end 

    context "User cannot see other user show page" do
      before do
        sign_in @user2
      end

      it "redirects to root path" do
        get :show, params: { id: @user.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end
end