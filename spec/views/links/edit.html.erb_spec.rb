require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :long_url => "MyString",
      :short_url => "MyString"
    ))
  end

  it "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_long_url[name=?]", "link[long_url]"

      assert_select "input#link_short_url[name=?]", "link[short_url]"
    end
  end
end