require "spec_helper"

describe TestModel do 
  it "should be respond to :page" do 
    expect(TestModel.respond_to?(:page)).to eq(true)
  end

  it "should has default page_num of 20" do 
    expect(TestModel.paginate_per).to eq 20
  end

end
