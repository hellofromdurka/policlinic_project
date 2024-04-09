SELECT 
    timetable_id, appointment_date, appointment_time, appearance, passport, 
    specialization, appointment_patient, appointment_room 
FROM
    timetable
JOIN 
    doctor
ON (appointment_doctor = doc_id) 
WHERE appointment_date = '$date'