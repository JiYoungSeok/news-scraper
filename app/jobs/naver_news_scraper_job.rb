require 'open-uri'

class NaverNewsScraperJob < ApplicationJob
  queue_as :default
  
  def perform
    url = 'https://news.naver.com/'
    html = Nokogiri::HTML(open(url))

    section_ids.each do |category, section_id|
      section = html.css("div##{section_id}")
      articles = section.css('.mlist2').search('li')

      articles.each do |article|
        anchor = article.search('a')
        url = anchor.attr('href').content.strip
        title = anchor.text.strip
        Article.create!(category: category.to_sym, platform: :naver, url: url, title: title)
      end
    end
  end

  private

  def section_ids
    Hash[Article.categories.keys.map { |key| [key, "section_#{key}"] }]
  end
end
