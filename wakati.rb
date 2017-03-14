require 'natto'

text = <<"EOS"
悪質な業者によるトラブルが全国で急増している。
EOS

nm = Natto::MeCab.new
nm.parse(text) do |n|
  puts "#{n.surface}\t#{n.feature}" if(n.feature.match(/名詞/) || n.feature.match(/形容詞/))
end
