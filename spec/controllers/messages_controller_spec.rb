require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'GET #index' do
     it "assigns the requested contact to @group" do
      group = create(:group)
      get :index, id: group
      expect(assigns(:group)).to eq group
    end
  end
end
