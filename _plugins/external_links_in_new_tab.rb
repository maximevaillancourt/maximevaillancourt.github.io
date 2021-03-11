# frozen_string_literal: true

# Add 'target=_blank' to anchor tags that don't have `internal-link` class

require 'nokogiri'

Jekyll::Hooks.register [:posts, :notes], :post_convert do |doc|
  convert_links(doc)
end

Jekyll::Hooks.register [:pages], :post_convert do |doc|
  # jekyll considers anything at the root as a page,
  # we only want to consider actual pages
  next unless doc.path.start_with?('_pages/')
  convert_links(doc)
end

def convert_links(doc)
  parsed_doc = Nokogiri::HTML.fragment(doc.content)
  parsed_doc.css("a:not(.internal-link)").each do |link|
    link.set_attribute('target', 'blank')
  end
  doc.content = parsed_doc.to_html
end
