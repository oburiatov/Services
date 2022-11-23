CREATE USER prometheus WITH ENCRYPTED PASSWORD 'passwd';
GRANT pg_monitor TO prometheus;
--FOR POSTGRE 9 and lower
CREATE USER prometheus WITH ENCRYPTED PASSWORD 'passwd';
CREATE SCHEMA prometheus_monitor AUTHORIZATION prometheus;
ALTER USER prometheus
SET
    SEARCH_PATH TO prometheus_monitor,
    pg_catalog;
CREATE
OR REPLACE FUNCTION prometheus_monitor.get_pg_stat_activity() RETURNS SETOF pg_stat_activity AS $ $
SELECT
    *
FROM
    pg_catalog.pg_stat_activity;
$ $ LANGUAGE SQL VOLATILE SECURITY DEFINER;
GRANT EXECUTE ON FUNCTION prometheus_monitor.get_pg_stat_activity() TO prometheus;
CREATE VIEW prometheus_monitor.pg_stat_activity AS
SELECT
    *
FROM
    prometheus_monitor.get_pg_stat_activity();
GRANT
SELECT
    ON prometheus_monitor.pg_stat_activity TO prometheus;