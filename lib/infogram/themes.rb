module Infogram
  class Themes < Resources
    def initialize(config = {})
      @config = config
    end

    def list(opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('GET', 'themes', opts, @config)
      HTTParty.get("#{@config[:api_url]}/themes", query: opts)
    end
  end
end
