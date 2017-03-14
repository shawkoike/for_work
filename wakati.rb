# 単語リストの作成

require 'natto'

surfaces = Array.new
nm = Natto::MeCab.new
titles = Array.new()
File.open('./data/titles.txt') do |f|
  while title = f.gets do
    titles << title.chomp.to_s
  end
end

# 分かち書き
titles.each do |title|
  text = ""
  File.open("./data/#{title}_content.txt",'r') do |file|
    text = file.gets.chomp
    nm.parse(text) do |n|
      if(n.feature.match(/名詞/) || n.feature.match(/形容詞/)) then
        unless n.surface =~ /[0-9]+/ then
          surfaces << n.surface
        end
      end
    end
  end
end

# 必要な単語のみの選定
surfaces.uniq.each do |word|
  surfaces.delete(word) if word == '(' || word == ')' || word == 'こと' || word == 'もの' || word == '全て' || word == 'たち' || word == 'よう' || word == 'ない' || word == '的' ||
word == 'たくさん' || word == '-' || word == 'ため' || word == '全' || word == 'の' || word == 'もの' || word == 'こ' || word == '十' || word == '百' || word == '千' || word == '万' || word == '億' || word == '兆' ||
word == 'これ' || word == '以上' || word == '以下' || word == 'わけ' || word == '何' || word == ':' || word == ';' || word == 'はず' || word == 'ここ' || word == 'すべて' || word == '多く'  || word == '時' || word == '層' ||
word == ',' || word == '&' || word == '前' || word == '全体' || word == '化' || word == '私' || word == '点' || word == '確認' || word == 'それ' || word == '良い' || word == '別' || word == '使用' || word == '場合' ||
word == '他' || word == '非常' || word == '話' || word == '今' || word == 'ところ' || word == 'これら' || word == '上' || word == '中' || word == '下' 

  if surfaces.count(word) < 5 then
    surfaces.delete(word)
  end
end

p surfaces.uniq!
p surfaces.size
