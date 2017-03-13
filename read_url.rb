require 'nokogiri'
require 'open-uri'
require 'uri'

# declaration
urls = Array.new()
titles = Array.new()

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
  titles << title
  file = File.open("./data/#{title}.txt","w")
  #内容を #{title}.txt に格納させる
  dummy = html.css('.markdown-content > p').to_s
  file.puts(dummy)
  file.close
end

File.open("./data/titles.txt",'w+') do |file|
  titles.each do |title|
    file.puts(title)
  end
end
