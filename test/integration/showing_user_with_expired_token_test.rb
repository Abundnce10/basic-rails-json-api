require 'test_helper'

class ShowingUserWithExpiredTokenTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new
    @user.username = "user"
    @user.password = "password"
    @user.email = "foo@bar.com"
    @user.save!

    @api_key = @user.api_key
    @api_key.update_column("expires_at", 3.months.ago)
  end

  test 'showing user with expired token' do
  	get "api/v1/users/#{@user.id}",
  	{ AUTHORIZATION: @api_key.token },
  	{}

  	session = json(response.body)
  	#puts session.inspect

  	assert_equal 401, response.status
  	assert_equal Mime::JSON, response.content_type
  end

end
