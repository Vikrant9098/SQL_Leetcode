SELECT 
    patient_id,                             -- Select patient ID
    patient_name,                           -- Select patient name
    conditions                              -- Select patient condition string
FROM 
    Patients                                -- From Patients table
WHERE 
    conditions REGEXP '(^| )DIAB1';         -- Match only if 'DIAB1' starts a word (start of string or after space)
