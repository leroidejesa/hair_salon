require('spec_helper')

describe(Stylist) do

  describe("#name") do
    it("returns a stylist's name") do
      stylist = Stylist.new({:name => "Bob", :id => nil})
      expect(stylist.name()).to(eq("Bob"))
    end
  end

  describe(".all") do
    it("starts off empty at first") do
      expect(Stylist.all()).to(eq([]))
    end
  end

  describe("#save") do
    it("lets you save stylist info to the database") do
      stylist = Stylist.new({:name => "Bob", :id => nil})
      stylist.save()
      expect(Stylist.all()).to(eq([stylist]))
    end
  end

  describe("#id") do
    it("sets an ID when you save it") do
      stylist = Stylist.new({:name => "Bob", :id => nil})
      stylist.save()
      expect(stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe(".find") do
    it("returns a stylist by his/her ID") do
      test_stylist = Stylist.new({:name => "Bob", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Jack", :id => nil})
      test_stylist2.save()
      expect(Stylist.find(test_stylist2.id())).to(eq(test_stylist2))
    end
  end

  describe("#client_list") do
   it("returns an array of clients for that stylist") do
     test_stylist = Stylist.new({:name => "Bob", :id => nil})
     test_stylist.save()
     test_client = Client.new({:name => "Dylan", :stylist_id => test_stylist.id()})
     test_client.save()
     test_client2 = Client.new({:name => "Johnny", :stylist_id => test_stylist.id()})
     test_client2.save()
     expect(test_stylist.client_list()).to(eq([test_client, test_client2]))
   end
 end

 describe("#update") do
    it("lets you update stylists in the database") do
      stylist = Stylist.new({:name => "Jefferson", :id => nil})
      stylist.save()
      stylist.update({:name => "Jefferson"})
      expect(list.name()).to(eq("Jefferson"))
    end
  end

end
