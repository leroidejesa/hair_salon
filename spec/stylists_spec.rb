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

end
