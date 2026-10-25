-- =============================================================================
-- 02_dml_seed.sql - Seed Data Population
-- =============================================================================

INSERT INTO departments (name, budget) VALUES
    ('Cloud Engineering', 1500000.00),
    ('DevOps & SRE', 1200000.00),
    ('Data Platform', 950000.00),
    ('Cybersecurity', 800000.00)
ON CONFLICT (name) DO NOTHING;

INSERT INTO employees (department_id, first_name, last_name, email, salary, hire_date) VALUES
    (1, 'Alice', 'Smith', 'alice.smith@teachcloud.io', 125000.00, '2022-03-15'),
    (1, 'Bob', 'Jones', 'bob.jones@teachcloud.io', 115000.00, '2023-01-10'),
    (2, 'Charlie', 'Brown', 'charlie.b@teachcloud.io', 135000.00, '2021-06-01'),
    (2, 'Diana', 'Prince', 'diana.p@teachcloud.io', 140000.00, '2020-11-20'),
    (3, 'Evan', 'Wright', 'evan.w@teachcloud.io', 110000.00, '2023-08-15'),
    (4, 'Fiona', 'Gallagher', 'fiona.g@teachcloud.io', 130000.00, '2022-09-01')
ON CONFLICT (email) DO NOTHING;
