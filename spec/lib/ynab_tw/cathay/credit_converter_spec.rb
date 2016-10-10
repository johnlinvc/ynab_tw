require 'spec_helper'

describe YnabTw::Cathay::CreditConverter do
  describe "#convert" do
    it "can load a specific file" do
      converter = YnabTw::Cathay::CreditConverter.new
      converter.convert("spec/csv/cathay/credit.csv")
    end
    it "can convert it to YNAB compatible csv" do
      converter = YnabTw::Cathay::CreditConverter.new
      result = converter.convert("spec/csv/cathay/credit.csv")
      expect(result).not_to be_nil
    end
  end
end
