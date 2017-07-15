require 'rails_helper'

RSpec.describe ActorDecorator do
  let(:actor) { build :actor, first_name: "Szymon", last_name: "Lach",
                               movies: [movies1,movies2,movies3,movies4] }
  let(:movies1) { build :movie }
  let(:movies2) { build :movie }
  let(:movies3) { build :movie }
  let(:movies4) { build :movie }

  describe "#full_name" do
    subject { actor.decorate.full_name }
    it { is_expected.to eq 'Szymon Lach' }
  end

  describe "#three_movies" do
    subject { actor.decorate.three_movies.size }
    it { is_expected.to  eq 3 }
  end
end
