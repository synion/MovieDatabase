class ActorsController < ApplicationController
  expose :actors, -> {Actor.all}
  expose :actor
end
