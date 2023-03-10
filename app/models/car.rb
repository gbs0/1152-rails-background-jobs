class Car < ApplicationRecord
  after_commit :post_car_in_garage

  def post_car_in_garage
    GarageJob.perform_later(verb: "post", car: self)
  end
end
