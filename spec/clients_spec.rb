require('spec_helper')

describe(Client) do

  describe(".all") do
    it("is empty at first") do
      expect(Client.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("adds a client to the database") do
      test_client = Client.new({:name => "Sally", :id => nil, :stylist_id => 2})
      test_client.save()
      expect(Client.all()).to(eq([test_client]))
    end
  end

  describe("#update") do
     it("lets you update clients in the database") do
       client = Client.new({:name => "Jefferson", :id => nil, :stylist_id => 1})
       client.save()
       client.update({:name => "Jefferson"})
       expect(client.name()).to(eq("Jefferson"))
     end
   end

   describe("#delete") do
    it("lets you delete a client from the database") do
      test_client = Client.new({:name => "Max", :id => nil, :stylist_id => 1})
      test_client.save()
      test_client2 = Client.new({:name => "Jane", :id => nil, :stylist_id =>2})
      test_client2.save()
      test_client.delete()
      expect(Client.all()).to(eq([test_client2]))
    end
  end

end
