# postd から記事のタイトル，カテゴリ，url をスクレイピング
# data_postd.txt に url を格納
# ページ数は終了を示す必要あり num.upto() 部分

require 'nokogiri'
require 'open-uri'

# url の抽出
def split_article(hoge)
  /value=/ =~ hoge
  />/ =~ $'
  str = $`
  str.gsub!(/\"/,"")
  str.to_s
end


num = 1
$title = ""
$temp_array = Array.new
article_address = Hash.new
article_category = Hash.new
file = File.open('url.txt', "w")

# 終了ページまで
num.upto(1) do
  str = "http://postd.cc/page/#{num}/"
  html = Nokogiri::HTML(open(str))
  dummy = html.css('.block-entry-title > a ,.tagcloud')

  dummy.each do |article|
    $temp_array = []
    # カテゴリー分類
    if (article.children.children).length > 0
      (article.children.children).each do |category|
        $temp_array << category.to_s
      end
      article_category[$title] = $temp_array
    # タイトル分類
    else
      $title = article.children.to_s
    end

    # url 分類
    url = split_article(article.attributes.to_s)
    if url != "tagcloud" then
      article_address[$title] = url
      # ビッグデータとして格納
      file.puts(url)
    end
  end
  num += 1
end
