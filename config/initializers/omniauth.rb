OmniAuth.config.logger = Rails.logger
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook, '1259845757362855', "4374cde3a0e74941d767bc02efc7beff",
 {:scope => 'user_friends, email, public_profile', :client_options => {:ssl => {:ca_file => '/usr/lib/ssl/certs/ca-certificates.crt'}}}
end

