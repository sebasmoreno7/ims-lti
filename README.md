# IMS LTI

This repository is a fork of Instructure's `ims-lti` library. Copyright,
authors, original homepage and the MIT license remain attributed to Instructure.
The fork has not been published as a separate RubyGem.

## Fork maintenance

The fork requires Ruby 3.3 or newer; the development bundle is tested with
Ruby 3.4.2. Runtime dependencies now
require the patched `json-jwt` 1.15.3.1 line (CVE-2023-51774), along with
current compatible XML and URI libraries. `faraday_middleware` still uses
Faraday 1; migrating OAuth-signed registration requests to Faraday 2 needs
protocol-level signature tests. A clean advisory scan does not cover every
protocol or application security requirement.

Run `bundle install`, `bundle exec rspec`, and `bundle-audit update` followed
by `bundle-audit check` to verify the development bundle. The application using
this library must separately reject reused OAuth nonces and expired
timestamps, as the launch example below illustrates. The library does not
provide a nonce store.

LTI ruby implementation

## Installation

Add this line to your application's Gemfile:

    gem 'ims-lti'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lti

## Usage


### LTI 1.x

#### Validating Launches

You can use the classes in the IMS::LTI::Models::Messages module to valdiate Launches

For example in a rails app you would do the following
```ruby
authenticator = IMS::LTI::Services::MessageAuthenticator.new(request.url, request.request_parameters, shared_secret)

#Check if the signature is valid
return false unless authenticator.valid_signature?

# check if `params['oauth_nonce']` has already been used

#check if the message is too old
return false if DateTime.strptime(request.request_parameters['oauth_timestamp'],'%s') < 5.minutes.ago

```

## Contributing

1. Fork it ( http://github.com/instructure/ims-lti/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
