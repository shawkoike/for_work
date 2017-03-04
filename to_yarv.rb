
code = ""
print "ファイル名(source.rb => 1)："
filename = STDIN.gets.chomp

if filename.to_i == 1 then
  filename = "source.rb"
  puts filename
end

begin
  File.open(filename) do |file|
    file.each_line do |line|
      code << line
    end
  end
rescue SystemCallError => e
  puts e
rescue IOError => e
  puts e
end

puts code
puts "------------------------------"
puts RubyVM::InstructionSequence.compile(code).disasm
