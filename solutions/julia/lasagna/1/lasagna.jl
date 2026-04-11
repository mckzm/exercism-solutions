const expected_bake_time = 60

preparation_time(layers) = layers * 2

remaining_time(time_in_oven) = expected_bake_time - time_in_oven

total_working_time(layers, time_in_oven) = preparation_time(layers) + time_in_oven


