require 'test_helper'

class CreatingSessionTokenTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new
    @user.username = "user"
    @user.password = "password"
    @user.email = "foo@bar.com"
    @user.save!
  end

  test 'creating a session token with username & password' do
  	post 'api/v1/sessions',
  	{ username: 'user',	password: 'password' },
  	{}

  	session = json(response.body)
  	#puts session.inspect

  	assert_equal 201, response.status
  	assert_equal Mime::JSON, response.content_type

  	assert_not_nil(session[:session_token])
  	#assert_not_nil(session[:session_token_expiration])
  	assert_not_nil(session[:user_id])
    assert_not_nil(session[:user_profile_url])
  end
end
