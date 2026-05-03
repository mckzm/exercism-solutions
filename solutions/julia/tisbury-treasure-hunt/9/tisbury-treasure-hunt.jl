get_coordinate = last
convert_coordinate = Tuple
compare_records(azara_record, rui_record) = azara_record |> get_coordinate |> convert_coordinate |> ∈(rui_record)

function create_record(azara_record, rui_record)
    compare_records(azara_record, rui_record) || return ()
    treasure, coordinate, location, _, quadrant = (azara_record..., rui_record...)
    return (coordinate, location, quadrant, treasure)
end
