class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *rest = each_wagons_id
    wagons_in_order = *locomotive, *missing_wagons, *rest, *first, *second
  end

  def self.add_missing_stops(route_of, **stop_id_pairs)
    stops = {stops: stop_id_pairs.values}
    routing_table = {**route_of, **stops}
  end

  def self.extend_route_information(route, more_route_information)
    route_information = {**route, **more_route_information}
  end
end
