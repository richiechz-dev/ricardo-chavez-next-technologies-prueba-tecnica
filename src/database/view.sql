CREATE VIEW IF NOT EXISTS vw_daily_company_transactions AS
SELECT 
    c.company_name AS empresa,
    DATE(ch.created_at) AS fecha,
    SUM(ch.amount) AS monto_total,
    COUNT(ch.id) AS total_transacciones
FROM companies c
JOIN charges ch ON c.id = ch.company_id
GROUP BY c.company_name, fecha
ORDER BY fecha DESC, monto_total DESC;