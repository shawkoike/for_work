require 'matrix'

def open_each_ss(file)
  open(file) do |f|
    f.each do |row|
      begin
        yield row
      rescue
        p 'invalid string'
      end
    end
  end
end

data = File.read("./rec/vec.dat")
vectors = Marshal.load data

# 656番目のSSベクトルデータを格納
ss_655_vec = Vector.elements(vectors[1])

max_score = Array.new(3, {score: 0, index: 0})

vectors.each_with_index do |vector, index|
  # ベクトルの内積の和を計算し保存
  score = ss_655_vec.inner_product(Vector.elements(vector)).fdiv(ss_655_vec.norm * Vector.elements(vector).norm)
  max_score.sort! {|a, b| a[:score] <=> b[:score] }
  # スコアが高い場合は更新
  if max_score[0][:score] < score
    max_score.shift
    max_score.push({score: score, index: index})
  end
end

# 結果を出力
p max_score
