require 'csv'
module YnabTw::Cathay
  class Converter

    def parse(filename)
      csv = nil
      File.open(filename, "r:big5:utf-8") do |f|
        lines = f.each_line.to_a
        ary = lines.drop(2)
        headers = %w{date withdraw deposit balance info memo extra}
        csv_str = ary.join("")
        csv = ::CSV.parse(csv_str, headers: headers)
      end
      return csv
    end

    def convert(filename)
      result = nil
      csv = parse(filename)
      p csv
      result
    end

  end
end
