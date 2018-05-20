require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      :name => "Name",
      :synopsis => "MyText",
      :rating => 2,
      :actors => "Actors",
      :director => "Director"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Actors/)
    expect(rendered).to match(/Director/)
  end
end
