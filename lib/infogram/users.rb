module Infogram
  class Users < Resources
    def initialize(config = {})
      @config = config
    end

    def get(id, opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('GET', "users/#{id}", opts, @config)
      HTTParty.get("#{@config[:api_url]}/users/#{id}", query: opts)
    end

    def get_infographics(id, opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('GET', "users/#{id}/infographics", opts, @config)
      HTTParty.get("#{@config[:api_url]}/users/#{id}/infographics", query: opts)
    end
  end
end
