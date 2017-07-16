require 'rails_helper'

RSpec.describe MovieDecorator do
  let(:movie) { build :movie, name: "Dramat", revenue: 1000,
                genre_id: 1 }

  describe "#expose_revenue" do
    subject { movie.decorate.expose_revenue }
    it { is_expected.to eq '1000 M Dollars' }
  end

end
