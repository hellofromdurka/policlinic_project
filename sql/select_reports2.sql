SELECT rep_id, rep_year, rep_month, rep_diagnosis, count_patients 
FROM reports2
WHERE rep_year = YEAR('$date-01') AND rep_month = MONTH('$date-01')