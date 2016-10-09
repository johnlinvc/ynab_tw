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

    def convert_format(csv)
      csv.each.map do |row|
        [
          DateTime.parse(row["date"]).strftime("%m/%d/%Y"),
          row["info"],
          nil,
          "#{row["memo"]} #{row["extra"]}",
          row["withdraw"],
          row["deposit"],
        ]
      end
    end

    def convert(filename)
      csv = parse(filename)
      new_csv = convert_format(csv)
      header = "Date,Payee,Category,Memo,Outflow,Inflow\n"
      header + new_csv.map(&:to_csv).join("")
    end

  end
end
