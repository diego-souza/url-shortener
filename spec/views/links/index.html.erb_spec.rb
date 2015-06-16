require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    @links = assign(:links, [FactoryGirl.create(:link), FactoryGirl.create(:link)])
  end

  it "renders a list of links" do
    render
    assert_select "tr>td", :text => @links.first.long_url, :count => 1
    assert_select "tr>td", :text => @links.last.long_url, :count => 1
  end
end
