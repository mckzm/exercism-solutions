const expected_bake_time = 60

preparation_time(layers) = 2layers

remaining_time(time_in_oven) = expected_bake_time - time_in_oven

total_working_time(layers, time_in_oven) = preparation_time(layers) + time_in_oven


