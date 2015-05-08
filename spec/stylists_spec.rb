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

end
