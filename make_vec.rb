# 単語リスト
uniq_word_list = File.open("./rec/list.txt").read.split(' ')

# 記事のタイトル取得
# data ディレクトリの中のテキストファイルを html から出力形式に
titles = Array.new()
File.open('./data/titles.txt') do |f|
  while title = f.gets do
    titles << title.chomp.to_s
  end
end

vec = []
count = 0
titles.each do |title|
  text = ""
  File.open("./data/#{title}_content.txt","r") do |f|
    text = f.gets
    vec[count] = []
    uniq_word_list.each do |word|
      vec[count] << text.count(word)
    end
  end
  count += 1
end

# # 今回はオブジェクトをダンプして保存
dumped_vec = Marshal.dump vec
File.open("./rec/vec.dat", "w+") {|f| f.write(dumped_vec) }
