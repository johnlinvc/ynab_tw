module YnabTw::FirstBank
  class CreditConverter
    include YnabTw::Converter

    def parse(filename)
      File.open("fb_12.htm") { |f| Nokogiri::Slop(f)}
    end

    def convert_format(doc)
      valid_details = doc.html.tr(:css => ".billdetail").find_all{|tr| tr.td[0].content.length > 0}
      date = valid_details.map{|tr| tr.td.first.content}
      payee = valid_details.map{|tr| tr.td[2].content}
      category = [""].cycle
      memo = [""].cycle
      outflow = valid_details.map{|tr| tr.td.last.table.tbody.tr.td[0].content.gsub(",","").to_i}
      inflow = [0].cycle
      date.zip(payee,category,memo, outflow, inflow)
    end
  end
end
