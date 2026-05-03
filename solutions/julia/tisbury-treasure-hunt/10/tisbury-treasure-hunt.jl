get_coordinate = last
convert_coordinate = Tuple
compare_records(azara_record, rui_record) = convert_coordinate(azara_record[2]) == rui_record[2]

function create_record(azara_record, rui_record)
    compare_records(azara_record, rui_record) || return ()
    treasure, coordinate, location, _, quadrant = (azara_record..., rui_record...)
    return (coordinate, location, quadrant, treasure)
end
