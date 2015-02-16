module Infogram
  class Resources
    def decode_params(params)
      params.keys.sort.map { |k| "#{k}=#{url_escaping(params[k].to_s)}" }.join('&')
    end

    def url_escaping(string)
      CGI.escape(string).gsub('+', '%20')
    end

    def signature(method, path, params, config)
      string_to_sign = [
        method.upcase,
        url_escaping("#{config[:api_url]}/#{path}"),
        url_escaping(decode_params(params))
      ].compact.join('&')
      raw_hmac = OpenSSL::HMAC.digest('sha1', config[:api_secret], string_to_sign)
      Base64.encode64(raw_hmac)[0..-2]
    end
  end
end
