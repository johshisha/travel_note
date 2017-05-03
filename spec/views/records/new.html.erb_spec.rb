require 'rails_helper'

RSpec.describe "records/new", type: :view do
  before(:each) do
    assign(:record, Record.new(
      :title => "MyString",
      :user => nil,
      :description => "MyText",
      :latitude => 1.5,
      :longitude => 1.5,
      :url => "MyText"
    ))
  end

  it "renders new record form" do
    render

    assert_select "form[action=?][method=?]", records_path, "post" do

      assert_select "input#record_title[name=?]", "record[title]"

      assert_select "input#record_user_id[name=?]", "record[user_id]"

      assert_select "textarea#record_description[name=?]", "record[description]"

      assert_select "input#record_latitude[name=?]", "record[latitude]"

      assert_select "input#record_longitude[name=?]", "record[longitude]"

      assert_select "textarea#record_url[name=?]", "record[url]"
    end
  end
end
