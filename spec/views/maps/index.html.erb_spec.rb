require 'spec_helper'

describe "maps/index.html.erb" do
  before(:each) do
    assign(:maps, [
      stub_model(Map),
      stub_model(Map)
    ])
  end

  it "renders a list of maps" do
    render
  end
end
