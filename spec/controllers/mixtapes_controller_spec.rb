require 'rails_helper'

describe MixtapesController do

  describe 'new' do 

    it 'creates a new mixtape instance' do
      get :new
      expect(assigns(:mixtape)).to_not be_nil
    end

  end

end
