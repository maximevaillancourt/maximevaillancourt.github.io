# frozen_string_literal: true
require 'nokogiri'

# Add 'target=_blank' to anchor tags that don't have `internal-link` class
Jekyll::Hooks.register [:posts, :pages, :notes], :post_convert do |doc|
  parsed_doc = Nokogiri::HTML(doc.content)
  parsed_doc.css("a:not(.internal-link)").each do |link|
    link.set_attribute('target', 'blank')
  end
  doc.content = parsed_doc.to_html
end

