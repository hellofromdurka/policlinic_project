UPDATE visit SET
diagnosis = $diagnosis, complaints = $complaints, prescription = $prescription 
WHERE visit_id = $id;