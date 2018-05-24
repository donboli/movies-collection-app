RSpec.shared_examples "movie form" do |method|
  it "renders a movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), method do
      assert_select "input[name=?]", "movie[name]"
      assert_select "textarea[name=?]", "movie[synopsis]"
      assert_select "input[name=?]", "movie[rating]"
      assert_select "input[name=?]", "movie[actors]"
      assert_select "input[name=?]", "movie[director]"
      assert_select "input[name=?]", "movie[pictures][]"
    end
  end

  it "renders a submit button" do
    render

    assert_select "input[type=submit]"
  end
end