require 'nokogiri'
require 'open-uri'
require 'uri'

# declaration
urls = Array.new()

# url.txt から url を読み取る
File.open('url.txt',"r") do |f|
  f.each_line do |line|
    urls << line
  end
end

# url を開きその内容を把握
urls.each do |url|
  html = Nokogiri::HTML(open(URI.encode(url)))
  title = html.css('.block-entry-title')
  title =  title.children
  File.open("./text/#{title}.txt","w")
  # dummy = html.css('.markdown-content > p')
end
