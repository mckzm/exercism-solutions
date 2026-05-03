get_coordinate = last
convert_coordinate = Tuple

compare_records(azara_record, rui_record) = convert_coordinate(get_coordinate(azara_record)) ∈ rui_record

function create_record(azara_record, rui_record)
    compare_records(azara_record, rui_record) || return ()

    treasure, coordinate = azara_record
    location, _, quadrant = rui_record

    return (coordinate, location, quadrant, treasure)
end
