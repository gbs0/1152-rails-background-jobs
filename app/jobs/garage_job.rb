class GarageJob < ApplicationJob
  queue_as :default

  def perform(attr = {})
    if attr[:verb] == "post"
     response = GarageService.new(verb: attr[:verb]).call(car: attr[:car])
    end
  end
end
