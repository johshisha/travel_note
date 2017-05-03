require 'rails_helper'

RSpec.describe "records/index", type: :view do
  before(:each) do
    assign(:records, [
      Record.create!(
        :title => "Title",
        :user => nil,
        :description => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :url => "MyText"
      ),
      Record.create!(
        :title => "Title",
        :user => nil,
        :description => "MyText",
        :latitude => 2.5,
        :longitude => 3.5,
        :url => "MyText"
      )
    ])
  end

  it "renders a list of records" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.5.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
