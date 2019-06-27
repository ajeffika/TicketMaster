# frozen_string_literal: true

module Authentication
  include Warden::Test::Helpers

  def self.included(base)
    base.before { Warden.test_mode! }
    base.after { Warden.test_reset! }
  end

  def sign_in(resource)
    login_as(resource, scope: warden_scope(resource))
  end

  def sign_out(resource)
    logout(warden_scope(resource))
  end

  def sign_in_via_api(user)
    post user_session_path, params: { email: user.email,
                                      password: user.password }.to_json,
                            headers: { 'CONTENT_TYPE' => 'application/json',
                                       'ACCEPT' => 'application/json' }
  end

  def login_user
    # @request.env['devise.mapping'] = Devise.mappings[:user]
    user = FactoryBot.create(:user)
    user.confirmed_at = Time.zone.now
    user.save
    sign_in_via_api(user)
  end

  private

  def warden_scope(resource)
    resource.class.name.underscore.to_sym
  end
end
