require 'uri'
require 'net/http'

module Fetcher
  def self.get_and_save(url)
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    if response.is_a?(Net::HTTPSuccess)
      content = response.body
      filename = "downloads/#{File.basename(url)}.html"
      File.write(filename, content)
      return true, content
    else
      return false, "Failed to fetch #{url}. HTTP Status Code: #{response.code}"
    end
  rescue StandardError => e
    return false, e.message
  end
end
