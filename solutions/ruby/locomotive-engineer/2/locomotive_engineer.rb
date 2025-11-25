class LocomotiveEngineer
  def self.generate_list_of_wagons(*wagons)
    wagons
  end

  def self.fix_list_of_wagons(each_wagons_id, missing_wagons)
    first, second, locomotive, *rest = each_wagons_id
    [locomotive, *missing_wagons, *rest, first, second]
  end

  def self.add_missing_stops(route_of, **stop_id_pairs)
    {**route_of, stops: stop_id_pairs.values}
  end

  def self.extend_route_information(route, more_route_information)
    {**route, **more_route_information}
  end
end
