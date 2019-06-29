module AuthorizationHelper
  def sign_up(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post user_registration_path,
         params: { email: user[:email],
                   password: user[:password] },
                   #password_confirmation: user[:password] },
         as: :json
  end

  def auth_tokens_for_user(user)
    # The argument 'user' should be a hash that includes the params 'email' and 'password'.
    post user_session_path, params: { email: user.email, password: user.password }, as: :json
    response.headers.slice('client', 'access-token', 'uid')
  end
end
