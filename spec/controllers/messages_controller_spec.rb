require 'rails_helper'

describe MessagesController, type: :controller do

  let(:group){create(:group)}
  let(:user){create(:user)}
  let(:message){build(:message)}

  before do
    sign_in user
  end

  describe 'Get#index' do
    it "redirects index view" do
      get :index, group_id: group.id
      expect(response).to render_template :index
    end
    it "assigns the requested contact to @group" do
      get :index, id: message, group_id: group.id
      expect(assigns(:group)).to eq group
    end
    it "assigns the requested contact to @groups" do
      @groups = user.groups.first
      get :index, id: message, group_id: group.id
      groups = user.groups
      expect(assigns(:groups)).to eq groups
    end
  end
end
