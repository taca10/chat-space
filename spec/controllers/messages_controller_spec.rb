require 'rails_helper'

describe MessagesController, type: :controller do

  describe 'GET #index' do
    before{
      get :index, params: { group_id: group }
    }
end
