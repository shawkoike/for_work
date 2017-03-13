# data ディレクトリの中のテキストファイルを html から出力形式に
titles = Array.new()
File.open('./data/titles.txt') do |f|
  while title = f.gets do
    titles << title.chomp.to_s
  end
end
text = ""

titles.each do |title|
  File.open("./data/#{title}.txt",'r+') do |file|
    while line = file.gets do
      text << line.gsub(/<(".*?"|'.*?'|[^'"])*?>/,"")
    end
    file.close
  end
  File.open("./data/#{title}_parsed.txt",'w+') do |f|
    f.puts(text)
  end
  text = ""
end
