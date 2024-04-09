SELECT timetable_id, appointment_date, appointment_time, 
        appearance, passport, patient_passport, appointment_room
FROM timetable 
JOIN 
    patient 
ON (appointment_patient = card_number) 
JOIN 
    doctor
ON (appointment_doctor = doc_id) 
WHERE patient_passport = '$patient';