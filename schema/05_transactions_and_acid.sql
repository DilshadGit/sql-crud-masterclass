-- =============================================================================
-- 05_transactions_and_acid.sql - ACID Transactions & Bank Transfer Simulation
-- =============================================================================

BEGIN;

-- Ensure adequate funds exist before deducting
UPDATE departments
SET budget = budget - 50000.00
WHERE name = 'Cloud Engineering' AND budget >= 50000.00;

-- Transfer budget to DevOps
UPDATE departments
SET budget = budget + 50000.00
WHERE name = 'DevOps & SRE';

-- Verify both updates succeeded, then persist
COMMIT;
