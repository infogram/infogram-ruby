require 'httparty'
require 'json'
require 'cgi'

class Infogram
  API_URL = 'https://infogr.am/service/v1'

  attr_accessor :api_key, :api_secret, :api_url

  def initialize(api_key, api_secret)
    @api_key = api_key
    @api_secret = api_secret
    @api_url = API_URL
  end

  def decode_params(params)
    params.keys.sort.map{ |k|
      value = (k.to_s == 'content') ? url_escaping(params[k].to_json) : params[k]
      "#{k}=#{value}"
    }.join('&')
  end

  def signature(method, path, params)
    string_to_sign = [method.upcase, url_escaping("#{api_url}/#{path}"), url_escaping(decode_params(params))].compact.join('&')
    raw_hmac = OpenSSL::HMAC.digest('sha1', api_secret, string_to_sign)
    Base64.encode64(raw_hmac)[0..-2]
  end

  def url_escaping(string)
    CGI.escape(string).gsub('+', '%20')
  end

  # themes
  def get_themes(opts={})
    opts[:api_key] = @api_key
    opts[:api_sig] = signature('GET', 'themes', opts)
    HTTParty.get("#{@api_url}/themes", query: opts)
  end

  # infographics
  def get_infographics(opts={})
    opts[:api_key] = @api_key
    opts[:api_sig] = signature('GET', "infographics", opts)
    HTTParty.get("#{@api_url}/infographics", query: opts)
  end

  def get_infographic(id, opts={})
    opts[:api_key] = @api_key
    opts[:api_sig] = signature('GET', "infographics/#{id}", opts)
    HTTParty.get("#{@api_url}/infographics/#{id}", query: opts)
  end

  def create_infographic(opts={})
    opts[:api_key] = @api_key
    opts[:api_sig] = signature('POST', 'infographics', opts)
    opts[:content] = opts[:content].to_json
    HTTParty.post("#{@api_url}/infographics", body: opts)
  end
end
