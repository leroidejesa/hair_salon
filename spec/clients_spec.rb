require('spec_helper')

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the database") do
      test_client = Client.new({:name => "Sally", :stylist_id => 2})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end
  
end
