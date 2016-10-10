require 'csv'

module YnabTw
  module Converter

    def parse(filename)
      csv = nil
      File.open(filename, "r:big5:utf-8") do |f|
        lines = f.each_line.to_a
        ary = lines.drop(useless_header_count)
        csv_str = ary.join("")
        csv = ::CSV.parse(csv_str, headers: input_headers)
      end
      return csv
    end

    def convert(filename)
      csv = parse(filename)
      new_csv = convert_format(csv)
      header = "Date,Payee,Category,Memo,Outflow,Inflow\n"
      header + new_csv.map(&:to_csv).join("")
    end

  end
end
