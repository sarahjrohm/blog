require 'spec_helper'

describe "maps/show.html.erb" do
  before(:each) do
    @map = assign(:map, stub_model(Map))
  end

  it "renders attributes in <p>" do
    render
  end
end
