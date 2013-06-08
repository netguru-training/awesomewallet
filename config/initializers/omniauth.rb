Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, '73a3698de16e3be8c6d0', '2a03ca8180e5655d48395304b15f8abe34b84d67'
  provider :google_oauth2, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET']
end
