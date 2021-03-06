require 'rails_helper'
require_relative 'shared_examples'

RSpec.describe "movies/new", type: :view do
  include_examples 'movie form', 'post'

  before(:each) do
    ActsAsTenant.current_tenant = create(:user)
    @movie = assign(:movie, create(:movie))
    render
  end

  after do
    ActsAsTenant.current_tenant = nil
  end

  it "renders the new title" do
    assert_select 'h1', 'New Movie'
  end

  it "renders a link to movies#index" do
    assert_select "a[href='/movies']"
  end
end
