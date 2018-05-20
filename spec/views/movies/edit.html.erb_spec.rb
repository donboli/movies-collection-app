require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :name => "MyString",
      :synopsis => "MyText",
      :rating => 1,
      :actors => "MyString",
      :director => "MyString"
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "textarea[name=?]", "movie[synopsis]"

      assert_select "input[name=?]", "movie[rating]"

      assert_select "input[name=?]", "movie[actors]"

      assert_select "input[name=?]", "movie[director]"
    end
  end
end
