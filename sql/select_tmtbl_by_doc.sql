SELECT timetable_id, appointment_date, appointment_time, appearance, passport, appointment_patient, appointment_room
FROM timetable join doctor on (appointment_doctor = doc_id) 
WHERE passport = '$doc' AND appointment_date >= CURDATE();