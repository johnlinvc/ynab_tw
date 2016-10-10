require 'ynab_tw/converter'
module YnabTw::Cathay
  class CreditConverter
    include YnabTw::Converter

    def useless_header_count
      3
    end

    def input_headers
        %w{date charge_date info withdraw card_no mobi_card_no country currency foreign_amount exchange_date}
    end

    def convert_format(csv)
      valid_rows = csv.each.reject do |row|
        row["date"].nil?
      end
      valid_rows.each.map do |row|
        [
          row["date"] + DateTime.now.strftime("/%Y"),
          row["info"],
          nil,
          "#{row["card_no"]}",
          row["withdraw"],
          0,
        ]
      end
    end

  end
end
