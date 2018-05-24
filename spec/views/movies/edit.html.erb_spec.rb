require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe "movies/edit", type: :view do
  include_examples 'movie form', 'post'

  before(:each) do
    ActsAsTenant.current_tenant = create(:user)
    @movie = assign(:movie, create(:movie))
  end

  after do
    ActsAsTenant.current_tenant = nil
  end

  it "renders the edit title" do
    render

    assert_select 'h1', 'Editing Movie'
  end

  it "renders a link to movies#index" do
    render

    assert_select "a[href='/movies']"
  end

  it "renders a link to movies#show" do
    render

    assert_select "a[href='/movies/#{@movie.id}']"
  end
end
