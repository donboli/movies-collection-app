require 'rails_helper'

RSpec.describe "movies/show", type: :view do
  before do
    ActsAsTenant.current_tenant = create(:user)
    @movie = assign(:movie, create(:movie))
    render
  end

  after do
    ActsAsTenant.current_tenant = nil
  end

  it "renders movie attributes" do
    expect(rendered).to match @movie.name
    expect(rendered).to match @movie.pictures.join
    expect(rendered).to match @movie.synopsis
    expect(rendered).to match @movie.actors
    expect(rendered).to match @movie.director
  end

  it 'renders movie rating as stars' do
    assert_select '.star.active', @movie.rating
    assert_select '.star.outline', 5 - @movie.rating
  end

  it 'renders movie rating as stars' do
    assert_select '.star.active', @movie.rating
    assert_select '.star.outline', 5 - @movie.rating
  end

  it "renders a link to movies#index" do
    assert_select "a[href='#{movies_path}']", 1
  end

  it "renders a link to movies#show" do
    assert_select "a[href='#{edit_movie_path(@movie)}']", 1
  end
end
