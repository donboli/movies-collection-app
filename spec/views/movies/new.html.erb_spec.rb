require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      :name => "MyString",
      :synopsis => "MyText",
      :rating => 1,
      :actors => "MyString",
      :director => "MyString"
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "textarea[name=?]", "movie[synopsis]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[actors]"

      assert_select "input[name=?]", "movie[director]"
    end
  end
end
