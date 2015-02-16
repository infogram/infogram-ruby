require 'infogram'
require 'rspec'
require 'webmock/rspec'

WebMock.disable_net_connect!

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def infogram_client(key, secret)
  Infogram::Client.new(key, secret)
end

def fixture(file)
  File.read('spec/fixtures/' + file)
end

def with_fixture(file)
  {
    body: fixture(file),
    headers: { content_type: 'application/json; charset=utf-8' }
  }
end

def stub_get(path)
  stub_request(:get, /.*#{Infogram::Client::API_URL + '/' + path}*/)
end

def stub_post(path)
  stub_request(:post, /.*#{Infogram::Client::API_URL + '/' + path}*/)
end
