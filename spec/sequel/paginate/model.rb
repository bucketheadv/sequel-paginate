require "spec_helper"

class TestModel < Sequel::Model
  include Sequel::Paginate::Model
end

describe Sequel::Paginate::Model do 
  it "should be respond to :page" do 
    expect(TestModel.respond_to?(:page)).to eq(true)
  end
end
