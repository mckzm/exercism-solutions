get_coordinate(line) = line[2]

convert_coordinate(coordinate) = Tuple(coordinate)

function compare_records(azara_record, rui_record)
    azara_coordinate = convert_coordinate(get_coordinate(azara_record))
    _, rui_coordinate, _ = rui_record
    return azara_coordinate == rui_coordinate ? true : false
end

function create_record(azara_record, rui_record)
    if !compare_records(azara_record, rui_record)
        return ()
    end

    treasure, coordinate = azara_record
    location, _, quadrant = rui_record

    return (coordinate, location, quadrant, treasure)
end
