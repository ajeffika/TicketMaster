require 'rails_helper'
RSpec.describe 'Authentiaction', type: :request do
  it 'sign up and log in user one' do
    user_one = { email: 'userone@test.com', password: 'password' }
    sign_up(user_one)
    assert_response :success
  end
end
