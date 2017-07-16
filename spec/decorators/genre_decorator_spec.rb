require 'rails_helper'

RSpec.describe GenreDecorator do
  let(:genre) { build :genre, name: "Dramat",
                movies: [movies1,movies2,movies3,movies4] }
  let(:movies1) { build :movie }
  let(:movies2) { build :movie }
  let(:movies3) { build :movie }
  let(:movies4) { build :movie }

  describe "#number_of_movie" do
    subject { genre.decorate.number_of_movie }
    it { is_expected.to eq "Number of movies: 4" }
  end

end
