#!/usr/bin/env ruby
require_relative 'lib/fetcher'
require_relative 'lib/metadata'

# Main program
if ARGV.empty?
  puts 'Usage: ./fetch.rb [--metadata] url1 url2 ...'
  exit(1)
end

metadata_flag = ARGV[0] == '--metadata'
urls = metadata_flag ? ARGV[1..-1] : ARGV

results = []

urls.each do |url|
  success, content_or_error = Fetcher.get_and_save(url)

  if success
    if metadata_flag
      metadata = Metadata.extract_metadata(content_or_error)
      metadata.keys.each do |key|
        puts "#{key}: #{metadata[key]}"
      end
    end
    results << "#{url} fetched successfully."
  else
    puts "Error fetching #{url}: #{content_or_error}"
  end
end

puts results.join("\n") unless metadata_flag