require 'spec_helper'

describe YnabTw::Cathay::Converter do
  describe "#convert" do
    it "can load a specific file" do
      converter = YnabTw::Cathay::Converter.new
      converter.convert("spec/csv/cathay/withdraw.csv")
    end
    it "can convert it to YNAB compatible csv" do
      converter = YnabTw::Cathay::Converter.new
      result = converter.convert("spec/csv/cathay/withdraw.csv")
      expect(result).not_to be_nil
    end
  end
end
