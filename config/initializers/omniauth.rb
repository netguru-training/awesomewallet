Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, AppConfig.auth_keys.github_id, AppConfig.auth_keys.github_secret, scope: 'user'
  provider :google_oauth2, AppConfig.auth_keys.google_id,AppConfig.auth_keys.google_secret
  provider :facebook, AppConfig.auth_keys.facebook_id, AppConfig.auth_keys.facebook_secret
end
