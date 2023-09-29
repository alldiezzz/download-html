require 'nokogiri'

module Metadata
  def self.extract_metadata(html_content)
    doc = Nokogiri::HTML(html_content)
    num_links = doc.css('a').count
    num_images = doc.css('img').count
    last_fetch = Time.now.utc.strftime('%a %b %d %Y %H:%M UTC')

    metadata = {
      site: doc.title.strip,
      num_links: num_links,
      images: num_images,
      last_fetch: last_fetch
    }

    metadata
  end
end
