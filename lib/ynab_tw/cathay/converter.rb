require 'ynab_tw/converter'
module YnabTw::Cathay
  class Converter
    include YnabTw::Converter

    def useless_header_count
      2
    end

    def input_headers
      %w{date withdraw deposit balance info memo extra}
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

  end
end
