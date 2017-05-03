require 'rails_helper'

RSpec.describe "records/edit", type: :view do
  before(:each) do
    @record = assign(:record, Record.create!(
      :title => "MyString",
      :user => nil,
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :url => "MyText"
    ))
  end

  it "renders the edit record form" do
    render

    assert_select "form[action=?][method=?]", record_path(@record), "post" do

      assert_select "input#record_title[name=?]", "record[title]"

      assert_select "input#record_user_id[name=?]", "record[user_id]"

      assert_select "textarea#record_description[name=?]", "record[description]"

      assert_select "input#record_latitude[name=?]", "record[latitude]"

      assert_select "input#record_longitude[name=?]", "record[longitude]"

      assert_select "textarea#record_url[name=?]", "record[url]"
    end
  end
end
