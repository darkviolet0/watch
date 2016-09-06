OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '288263018221730', '58074b86e305233d973ec5d619109763', scope: 'public_profile, email'
end