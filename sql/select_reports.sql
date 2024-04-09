SELECT rep_id, rep_year, rep_month, doctor_id, passport, count_visit 
FROM reports JOIN doctor ON (doc_id = doctor_id) 
WHERE rep_year = YEAR('$date-01') AND rep_month = MONTH('$date-01')