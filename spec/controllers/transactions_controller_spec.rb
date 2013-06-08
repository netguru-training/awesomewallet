require 'spec_helper'

describe TransactionsController do
  it 'redirect to index when not logged in' do
    get :index
    response.should redirect_to root_url
  end
end
