class MovieDecorator < ApplicationDecorator
  def expose_revenue
    "#{revenue}M Dollars"
  end
end
