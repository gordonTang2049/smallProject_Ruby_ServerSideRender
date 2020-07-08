def time_leftover(start_date, finish_date)

    start_dateTime = start_date.split(" ")
    finish_dateTime = finish_date.split(" ")

    start_year = start_dateTime[0].split("-")[0].to_i
    start_month = start_dateTime[0].split("-")[1].to_i
    start_day = start_dateTime[0].split("-")[2].to_i

    finish_year = finish_dateTime[0].split("-")[0].to_i
    finish_month = finish_dateTime[0].split("-")[1].to_i
    finish_day = finish_dateTime[0].split("-")[2].to_i

    start_Time = DateTime.new(start_year,start_month,start_day)
    finish_time = DateTime.new(finish_year,finish_month,finish_day)
    now = DateTime.now

    time_left_as_percentage = ((finish_time - now ) / (finish_time - start_Time)).percent_of(100)
    return 


end
