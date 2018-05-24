require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before do
    ActsAsTenant.current_tenant = create(:user)
    @movies = assign(:movies, [create(:movie), create(:movie)])
    render
  end

  after do
    ActsAsTenant.current_tenant = nil
  end

  it "renders a card per movie" do
    assert_select '.card', 2
  end

  it "renders movies as cards" do
    @movies.each do |movie|
      expect(rendered).to match movie.name
      expect(rendered).to match movie.synopsis
      expect(rendered).to match movie.actors
    end
  end

  it "renders movie rating as stars" do
    assert_select '.card' do |cards|
      cards.each_with_index do |card, index|
        assert_select card, '.star.active', @movies[index].rating
        assert_select card, '.star.outline', 5 - @movies[index].rating
      end
    end
  end

  describe 'card buttons' do
    it 'renders a show link' do
      assert_select '.card' do |cards|
        cards.each_with_index do |card, index|
          assert_select card, "a[href='#{movie_path(@movies[index])}'][data-method='get']", 1
        end
      end
    end

    it 'renders an edit link' do
      assert_select '.card' do |cards|
        cards.each_with_index do |card, index|
          assert_select card, "a[href='#{edit_movie_path(@movies[index])}'][data-method='get']", 1
        end
      end
    end

    it 'renders a delete link' do
      assert_select '.card' do |cards|
        cards.each_with_index do |card, index|
          assert_select card, "a[href='#{movie_path(@movies[index])}'][data-method='delete']", 1
        end
      end
    end
  end
end
