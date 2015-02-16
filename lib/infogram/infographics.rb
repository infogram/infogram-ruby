module Infogram
  class Infographics < Resources
    def initialize(config = {})
      @config = config
    end

    def list(opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('GET', 'infographics', opts, @config)
      HTTParty.get("#{@config[:api_url]}/infographics", query: opts)
    end

    def get(id, opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('GET', "infographics/#{id}", opts, @config)
      HTTParty.get("#{@config[:api_url]}/infographics/#{id}", query: opts)
    end

    def create(opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:content] = opts[:content].to_json
      opts[:api_sig] = signature('POST', 'infographics', opts, @config)
      HTTParty.post("#{@config[:api_url]}/infographics", body: opts)
    end

    def update(id, opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:content] = opts[:content].to_json
      opts[:api_sig] = signature('PUT', "infographics/#{id}", opts, @config)
      HTTParty.put("#{@config[:api_url]}/infographics/#{id}", body: opts)
    end

    def destroy(id, opts = {})
      opts[:api_key] = @config[:api_key]
      opts[:api_sig] = signature('DELETE', "infographics/#{id}", opts, @config)
      HTTParty.delete("#{@config[:api_url]}/infographics/#{id}", body: opts)
    end
  end
end
