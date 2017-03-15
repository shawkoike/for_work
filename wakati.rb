# 単語リストの作成

require 'natto'

list_file = File.open('./rec/list.txt',"w")
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
word == ',' || word == '&' || word == '前' || word == '全体' || word == '化' || word == '私' || word == 'あなた' || word == '点' || word == '確認' || word == 'それ' || word == '良い' || word == '別' || word == '使用' || word == '場合' ||
word == '他' || word == '非常' || word == '話' || word == '今' || word == 'ところ' || word == 'これら' || word == '上' || word == '中' || word == '下' || word == 'and' || word == 'by' || word == '数' || word == '年' ||
word == '社内' || word == '年間' || word == '決定' || word == '山' || word == '大' || word == 'それぞれ' || word == '優先' || word == '項目' || word == '利用' || word == 'ほう' || word == '?' || word == 'たび' || word == 'うち' ||
word == '対応' || word == '例' || word == '用意' || word == '専門' || word == 'とき' || word == 'lt' || word == 'gt' || word == 'その他' || word == '人' || word == 'よい' || word == '残念' || word == 'やすい' || word == 'ごと'  ||
word == 'なく' || word == 'どれ' || word == 'うまく' || word == 'まま' || word == 'なかっ' || word == 'なく' || word == 'どちら' || word == 'とおり' || word == 'ご'  || word == 'そう' || word == 'ひとつ' || word == '両方' || word == '確か' ||
word == '以外' || word == '彼ら' || word == '高く' || word == '高い' || word == '/' || word == '先' || word == '大量' || word == '間' || word == '内' || word == 'お' || word == '独自' || word == '様々' || word == '状況' ||
word == '現在' || word == '次' || word == 'どこ' || word == '状態' || word == 'セット' || word == '用語' || word == '意味' || word == 'そこ' || word == '下記' || word == '内容' || word == '元' || word == '一' || word == '者' ||
word == '度' || word == '失敗' || word == '理由' || word == '性' || word == '後' || word == 'その後' || word == '最初' || word == '大きく' || word == 'いくつ' || word == '一部' || word == '紹介' || word == '今回' || word == '誰' ||
word == '表現' || word == '自分' || word == '限り' || word == '方法' || word == '必要' || word == '同様' || word == '選択' || word == '時点' || word == '記事' || word == '説明' || word == '高' || word == '違い' || word == '判断' ||
word == '違い' || word == '気' || word == '版' || word == '想定' || word == '可能' || word == 'いい'  || word == '長い' || word == '分' || word == '経験' || word == '詳細' || word == '通常'  || word == '十分' || word == '.' ||
word == '方' || word == '基本' || word == '以前' || word == '秒' || word == '新しい' || word == '部分' || word == '追加' || word == '明示' || word == '実現' || word == '名前' || word == '注意' || word == '一般' || word == '主' ||
word == '削除' || word == '当社' || word == '結果' || word == 'The' || word == '理解' || word == 'アップ' || word == 'オリジナル' || word == '=' || word == '素晴らしい' || word == '月' || word == '代わり' || word == '適切' || word == '世界' ||
word == '場所' || word == '際' || word == '存在' || word == '唯一' || word == '日' || word == '間違い' || word == '提供' || word == 'それら' || word == '目的' || word == 'さ' || word == '構造'  || word == 'やすく' || word == '過程' ||
word == '挿入' || word == '単純' || word == '明らか' || word == '幾つ' || word == '構成' || word == '接続' || word == '完全' || word == '各' || word == 'なし' || word == '二' || word == 'a' || word == 'in' || word == 'the' ||
word == '_' || word == '()' || word == '向け'  || word == '上記' || word == '表示' || word == '純粋' || word == '保証' || word == '非' || word == '文' || word == '原因' || word == '発生' || word == '指定' || word == '文書' ||
word == '文書' || word == '皆さん' || word == '最終' || word == '倍' || word == 'x'  || word == '関連' || word == 'to' || word == '直接' || word == '本' || word == 'of' || word == '目' || word == '詳しく' || word == '制限' ||
word == '有効' || word == '影響' || word == '操作' || word == '用' || word == '報告' || word == 'V' || word == '長' || word == 'O' || word == '最後'  ||
word == '*' || word == '移動' || word == '番目' || word == '古い' || word == '手' || word == 'E' || word == '策' || word == '興味' || word == '痛み' || word == 'ン' || word == '側' || word == '終了' || word == '恐竜' || word == '鳥' ||
word == '起動' || word == 'こちら' || word == '簡単' || word == '容易'  || word == '特定' || word == '作成' || word == '掲載' || word == '保存' || word == '正しい' || word == '信頼'  || word == '当時' || word == '彼' ||
word == '最近' || word == '書' || word == '重要' || word == '回答' || word == '自身' || word == '解決' || word == '適用' || word == '深く' || word == '一緒' || word == '多い' || word == '難しい' || word == '回' ||
word == '一番' || word == '段階' || word == '個' || word == 'ご覧' || word == '面白い' || word == '学' || word == '再' || word == 'A' || word == '広く' || word == '形' || word == '意見' || word == '新た' || word == '一つ' ||
word == '%' || word == '近い' || word == '–' || word == '無視' || word == '{' || word == '}' || word == '許容' || word == '無限' || word == '商品' || word == '正常' || word == 'shared' || word == '母' || word == '\\' ||
word == '官' || word == '悪い' || word == '複雑' || word == '力' || word == '人々' || word == '便利' || word == '比較' || word == '対象' || word == 'e' || word == 't' || word == '氏' || word == '体' || word == 'h' ||
word == '指摘' || word == '対処' || word == 'fast' || word == '原則' || word == '価値' || word == '色弱' || word == '訳注' || word == '修正' || word == '知識' || word == 'レベル' || word == '自体' || word == '図' || word == 'アプローチ' ||
word == 'イン' || word == '考慮' || word == '作業' || word == '入力' || word == 'ジェファーソン' || word == '具体' || word == '変更' || word == 'ステップ' || word == '明確' || word == '生成' || word == '部屋' || word == 'B' || word == 'HoverCard' ||
word == '子' || word == '大抵' || word == '家' || word == 'ひどい' || word == '効果' || word == 'やり方' || word == '把握' || word == 'zval' || word == '疑問' || word == '達成' || word == '末' || word == '変化' || word == '成功' ||
word == '.　' || word == '大変' || word == '役割' || word == '活用' || word == '方向' || word == '初期' || word == '目標' || word == '好き' || word == '有害' || word == '機会' || word == '創業' || word == 'r' || word == '参加' ||
word == 'すばらしい' || word == '％' || word == '@' || word == '意地' || word == '正確' || word == '自動' || word == '業界' || word == '量' || word == '特別' || word == '事実' || word == '本番' || word == '大学' || word == 'せい' ||
word == '毎日' || word == '時給' || word == 'ドル' || word == '円' || word == '答え' || word == '個人' || word == '貢献' || word == '自信' || word == '良く' || word == '傾向' || word == '分野' || word == '身' || word == '頭' ||
word == '能力' || word == '不' || word == '友人' || word == '基準' || word == '学校' || word == 'タイム' || word == '開始' || word == '確実' || word == '理想' || word == 'あと' || word == '頃' || word == '～' || word == '週間' ||
word == '物事' || word == '章' || word == '獲得' || word == '名' || word == '向上' || word == '満足' || word == '外' || word == '初め' || word == '相手' || word == '面' || word == '学生' || word == '絶対' || word == 'v' ||
word == '規模' || word == '結局' || word == 'はるか' || word == 'チェック' || word == '手段' || word == '現実' || word == '既存' || word == '語' || word == 'つもり' || word == '授業' || word == '[' || word == ']' || word == '執筆' ||
word == '帯' || word == '生徒' || word == '上位' || word == 'init' || word == '文章' || word == 'おかげ' || word == '反応' || word == '番号' || word == '取締役' || word == 'Kent' || word == 'コース' || word == '片側' || word == 'P' ||
word == '僕' || word == '弊害' || word == 'Elm' || word == 'Jake' || word == '抽象' || word == '程度' || word == '維持' || word == 'ん' || word == '仕組み' || word == 'ン' || word == 'アドバイス' || word == '汎用' || word == 'will' ||
word == 'change' || word == 'デー' || word == 'YD' || word == '作品' || word == 'Olark' || word == '共通' || word == '社' || word == '取り組み' || word == '議論' || word == 'いつ' || word == '誰か' || word == '正直' || word == '支持' ||
word == '幅広い' || word == 'ご存知' || word == '細かい' || word == '不満' || word == '興味深い' || word == '理' || word == '事例' || word == '強く' || word == '相当' || word == '新しく'  || word == '未' || word == '分間' || word == '背景' ||
word == '大勢' || word == '強い' || word == 'がち' || word == '同' || word == '巨大' || word == '膨大' || word == '得意' || word == '分解' || word == '困難' || word == '広範囲' || word == '強調' || word == '高度' || word == 'いつか' ||
word == '苦労' || word == '扱い' || word == '完璧' || word == 'か月' || word == 'ダメ' || word == '多' || word == '近く'  || word == 'リセット' || word == '増加' || word == '保持' || word == '遠く' || word == '登録' || word == 'バランス' ||
word == '不可欠' || word == '本来' || word == '小さい' || word == '件' || word == '今日' || word == 'ただ' || word == '時期' || word == '長く' || word == '何かしら' || word == '逆' || word == '主張' || word == '基' || word == 'What' ||
word == '週末' || word == 'is' || word == 'not' || word == '話題' || word == '本稿' || word == '恐れ' || word == '毎回'  || word == '所' || word == '数カ月' || word == '感覚' || word == '合計' || word == '経由' || word == '大きい' ||
word == '小さく' || word == '表面' || word == '途中' || word == '登場' || word == '世の中' || word == '優秀' || word == '過去' || word == '発揮'  || word == 'm' || word == '始め' || word == 'カ月' || word == '新規'  || word == 'かなり' ||
word == '確信' || word == '昔' || word == '日間' || word == '感謝' || word == '貴重' || word == '不可能' || word == '短い' || word == '同士' || word == '豊富' || word == '厄介' || word == '赤' || word == '時代' || word == '予想' ||
word == '真'  || word == '大半' || word == '短く' || word == '今度' || word == '永続' || word == '検討' || word == 'How' || word == 'with' || word == 'ヶ月' || word == '混乱' || word == '心配' || word == '同僚' || word == '依頼' ||
word == '注' || word == '不要' || word == '少なく' || word == 'なけれ' || word == '以降' || word == '努力' || word == '中心' || word == 'きっかけ' || word == 'I' || word == '当初' || word == '柔軟' || word == 'at' || word == '念頭' ||
word == '慎重' || word == '無駄' || word == 'いずれ' || word == 'Your' || word == 'this' || word == 'ご存じ' || word == '--' || word == '強化' || word == '個別' || word == '大体' || word == '周り' || word == '悪く' || word == '歳' || word == '済み' ||
word == '付け' || word == '日常' || word == '旅' || word == '正しく' || word == 'きれい' || word == '一方' || word == '自ら' || word == '早く' || word == '丸' || word == '付き' || word == '全般' || word == '楽' || word == '残り' ||
word == '実' || word == '直面' || word == '主要' || word == '旧' || word == '恐ろしい' || word == '最善' || word == '本格' || word == '現状' || word == '後述' || word == 'にくく' || word == '多大' || word == '難しく' || word == 'i' ||
word == '助け' || word == 'それなり' || word == 'うえ' || word == '歴史' || word == 'さまざま' || word == 'お話し' || word == '先ほど' || word == '一切' || word == '大き' || word == 'そのもの' || word == 'もと' || word == 'H' || word == 'あいまい' ||
word == ')。' || word == '無' || word == '望ましい' || word == '先行' || word == '1つ' || word == '一連' || word == 'いくら' || word == '上げ' || word == '真剣' || word == '女性' || word == '応募' || word == '肩書き' || word == '勝利'


  if surfaces.count(word) < 15 then
    surfaces.delete(word)
  end
end

surfaces.uniq!
# 各単語をスペース区切りで出力
list_file.write(surfaces.join(' '))
p surfaces.size
list_file.close
