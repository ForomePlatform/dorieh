-- Test case start
SELECT 
	'epa.airnow_pm25_2022.agencyname' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT agencyname) FROM epa.airnow_pm25_2022) = '121' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.agencyname' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(agencyname::varchar, '' order by agencyname)) FROM epa.airnow_pm25_2022) = '9a406470a97af294a9532656c29574d6' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.aqi' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(aqi) FROM epa.airnow_pm25_2022) BETWEEN 33.43986228909966 AND 34.115415062616826 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.aqi' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(aqi) FROM epa.airnow_pm25_2022) BETWEEN 1333.7930095763734 AND 1360.7383229011486 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.category' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT category) FROM epa.airnow_pm25_2022) = '6' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.category' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(category) FROM epa.airnow_pm25_2022) BETWEEN -8.236441149015615 AND -8.073343304480652 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.category' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(category) FROM epa.airnow_pm25_2022) BETWEEN 9221.822593201103 AND 9408.122039528398 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.county' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(county) FROM epa.airnow_pm25_2022) BETWEEN 28478.472022290924 AND 29053.794689407914 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.county' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(county) FROM epa.airnow_pm25_2022) BETWEEN 270875594.3737724 AND 276347828.60354555 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.countyfp' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(countyfp) FROM epa.airnow_pm25_2022) BETWEEN 70.09395988672676 AND 71.50999948039802 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.countyfp' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(countyfp) FROM epa.airnow_pm25_2022) BETWEEN 6386.580761295314 AND 6515.602594856835 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.fips5' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(fips5) FROM epa.airnow_pm25_2022) BETWEEN 28478.472022290924 AND 29053.794689407914 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.fips5' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(fips5) FROM epa.airnow_pm25_2022) BETWEEN 270875594.3737724 AND 276347828.60354555 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.fullaqscode' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT fullaqscode) FROM epa.airnow_pm25_2022) = '1068' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.fullaqscode' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(fullaqscode::varchar, '' order by fullaqscode)) FROM epa.airnow_pm25_2022) = 'd32efcb423d0fd47258fe614654d4893' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.intlaqscode' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT intlaqscode) FROM epa.airnow_pm25_2022) = '1068' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.intlaqscode' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(intlaqscode::varchar, '' order by intlaqscode)) FROM epa.airnow_pm25_2022) = '24496c9839608175e055847400c90c60' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.latitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(latitude) FROM epa.airnow_pm25_2022) BETWEEN 40.404077653743634 AND 41.22032164674855 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.latitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(latitude) FROM epa.airnow_pm25_2022) BETWEEN 41.487201172062555 AND 42.32532644826584 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.longitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(longitude) FROM epa.airnow_pm25_2022) BETWEEN -99.15393951585901 AND -97.19049516901032 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.longitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(longitude) FROM epa.airnow_pm25_2022) BETWEEN 344.89452822418815 AND 351.8620944509394 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.monitor' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT monitor) FROM epa.airnow_pm25_2022) = '1068' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.monitor' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(monitor::varchar, '' order by monitor)) FROM epa.airnow_pm25_2022) = '4803ea970ccf009172bab6c8ed01a665' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.parameter' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT parameter) FROM epa.airnow_pm25_2022) = '1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.parameter' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(parameter::varchar, '' order by parameter)) FROM epa.airnow_pm25_2022) = '8a6d003102a31b783bdb08cdfffee466' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.record' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT record) FROM epa.airnow_pm25_2022) = '47136' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.record' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(record::varchar, '' order by record)) FROM epa.airnow_pm25_2022) = 'f666c29b1e530235228399279d5e70be' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.sitename' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT sitename) FROM epa.airnow_pm25_2022) = '1053' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.sitename' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(sitename::varchar, '' order by sitename)) FROM epa.airnow_pm25_2022) = '01ddfa95fafc62711e72461e8439000c' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.state' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(state) FROM epa.airnow_pm25_2022) BETWEEN 28.4083780624042 AND 28.982284689927514 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.state' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(state) FROM epa.airnow_pm25_2022) BETWEEN 270.70545984769586 AND 276.1742570163362 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.statefp' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(statefp) FROM epa.airnow_pm25_2022) BETWEEN 28.4083780624042 AND 28.982284689927514 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.statefp' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(statefp) FROM epa.airnow_pm25_2022) BETWEEN 270.70545984769586 AND 276.1742570163362 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.stusps' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT stusps) FROM epa.airnow_pm25_2022) = '50' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.stusps' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(stusps::varchar, '' order by stusps)) FROM epa.airnow_pm25_2022) = '48c8e2a1283b289bd1617da66440dd65' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.unit' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT unit) FROM epa.airnow_pm25_2022) = '1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.unit' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(unit::varchar, '' order by unit)) FROM epa.airnow_pm25_2022) = 'a9d5911ac31fd963ba6440c803b512b9' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.utc' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT utc) FROM epa.airnow_pm25_2022) = '323' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.utc' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(utc::varchar, '' order by utc)) FROM epa.airnow_pm25_2022) = 'df830e3926d82efcea8c6d8fd07211fe' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(value) FROM epa.airnow_pm25_2022) BETWEEN 4.616074140532878 AND 4.709328163573946 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(value) FROM epa.airnow_pm25_2022) BETWEEN 981.2026840519833 AND 1001.024960497478 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.zcta' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(zcta) FROM epa.airnow_pm25_2022) BETWEEN 60184.04890862217 AND 61399.88828051353 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.airnow_pm25_2022.zcta' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(zcta) FROM epa.airnow_pm25_2022) BETWEEN 937770192.3683704 AND 956715044.7394487 
		THEN true ELSE false END AS passed

-- Test case end
