### About

This gem provides an [OmniAuth](https://github.com/intridea/omniauth) strategy for authenticating with [GoCardless](http://gocardless.com).

### Usage Rails

Add the gem to your gemfile.

    gem 'omniauth-gocardless', require: 'omniauth-gocardless'

Add the following as an initializer:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :gocardless, '<client_id>', '<client_secret>', scope: 'manage_merchant'
    end

This gives you access to a variable `request.env['omniauth.auth']` in your authentication callback that looks like this:

* `uid` - the id of the user
* `info` - `{'email' => '<user email>', 'name' => '<business name>', 'first_name' => '<first name>', 'last_name' => '<last name>'}`
*  `extra` - `{'raw_info' => {'balance' => '<amount>', 'created_at' => '<date time with tz>', 'description' => '<Text>', 'hide_variable_amount' => '<bool>',  'id' => '<id of user>' 'name' => '<business name>', 'first_name' => '<first name>', 'last_name' => '<last name>', 'next_payout_amount' => <amount>, 'next_payout_date' => '<date time with tz>',  'pending_balance' => <amount> …}}`

#### Options

To authorize against your gocardless sandbox environment set the site url to `https://sandbox.gocardless.com/` like this:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :gocardless, '<client_id>', '<client_secret>', scope: 'manage_merchant', 
        client_options: {site: 'https://sandbox.gocardless.com'}
    end

To set a callback host e.g. if you call from different subdomains you can set it like this:
  
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :gocardless, '<client_id>', '<client_secret>', scope: 'manage_merchant', 
        callback_host: 'https://www.cobot.me'
    end
  
