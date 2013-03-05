require 'omniauth/strategies/oauth2'
module OmniAuth
  module Strategies
    class Gocardless < OmniAuth::Strategies::OAuth2
      option :name, 'gocardless'
      option :redirect_uri, nil
      option :client_options, {
        :site => 'https://gocardless.com',
        :authorize_url => '/oauth/authorize',
        :token_url => '/oauth/access_token'
      }
      

      uid { raw_info['id'] }

      info do
        {
          'email' => raw_info['email'],
          'name' => raw_info['name'],
          'first_name' => raw_info['first_name'],
          'last_name' => raw_info['last_name'],
        }
      end

      extra do
        {:raw_info => raw_info}
      end
      
      def callback_url
        options[:redirect_uri] || super
      end

      def raw_info
        merchant_id = access_token.params['scope'].split(':').last
        @raw_info ||= access_token.get("/api/v1/merchants/#{merchant_id}.json").parsed
      end
    end
  end
end