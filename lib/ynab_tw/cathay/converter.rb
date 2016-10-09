module YnabTw::Cathay
  class Converter
    def convert(filename)
      result = nil
      File.open(filename, "r:big5:utf-8") do |f|
        f.each_line{|l| puts(l)}
      end
      result
    end
  end
end
