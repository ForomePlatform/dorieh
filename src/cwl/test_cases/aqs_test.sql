-- Test case start
SELECT 
	'epa.pm25_annual.address' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT address) FROM epa.pm25_annual) = '1040' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.address' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(address::varchar, '' order by address)) FROM epa.pm25_annual) = 'b8ec4941d98cc68ed3be4e73e84dec34' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_mean' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(arithmetic_mean) FROM epa.pm25_annual) BETWEEN 9.503552431648101 AND 9.695543389863216 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_mean' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(arithmetic_mean) FROM epa.pm25_annual) BETWEEN 7.258715880044714 AND 7.405356604894103 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_standard_dev' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(arithmetic_standard_dev) FROM epa.pm25_annual) BETWEEN 5.53357307452905 AND 5.64536242957004 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_standard_dev' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(arithmetic_standard_dev) FROM epa.pm25_annual) BETWEEN 5.495886338734953 AND 5.606914345578082 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_10th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_10th_percentile) FROM epa.pm25_annual) BETWEEN 4.214776471116298 AND 4.2999234705327884 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_10th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_10th_percentile) FROM epa.pm25_annual) BETWEEN 2.9870818746231578 AND 3.047426962999383 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_1st_max_datetime) FROM epa.pm25_annual) = '713' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_1st_max_datetime::varchar, '' order by c_1st_max_datetime)) FROM epa.pm25_annual) = 'c8cef7d271faf169c27fd1066a08e7d5' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_non_overlapping_value' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_1st_max_non_overlapping_value) FROM epa.pm25_annual) = '0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_non_overlapping_value' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_1st_max_non_overlapping_value::varchar, '' order by c_1st_max_non_overlapping_value)) FROM epa.pm25_annual) IS NULL 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_1st_max_value) FROM epa.pm25_annual) BETWEEN 34.418070753876314 AND 35.11338531456068 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_1st_max_value) FROM epa.pm25_annual) BETWEEN 1127.454866828137 AND 1150.2317328246652 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_no_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_1st_no_max_datetime) FROM epa.pm25_annual) = '0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_no_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_1st_no_max_datetime::varchar, '' order by c_1st_no_max_datetime)) FROM epa.pm25_annual) IS NULL 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_2nd_max_datetime) FROM epa.pm25_annual) = '752' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_2nd_max_datetime::varchar, '' order by c_2nd_max_datetime)) FROM epa.pm25_annual) = 'c501f370670b9e18024fdcf25942d040' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_non_overlapping_value' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_2nd_max_non_overlapping_value) FROM epa.pm25_annual) = '0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_non_overlapping_value' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_2nd_max_non_overlapping_value::varchar, '' order by c_2nd_max_non_overlapping_value)) FROM epa.pm25_annual) IS NULL 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_2nd_max_value) FROM epa.pm25_annual) BETWEEN 28.19859854697807 AND 28.76826720449278 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_2nd_max_value) FROM epa.pm25_annual) BETWEEN 464.50600861510634 AND 473.88996838510855 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_no_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_2nd_no_max_datetime) FROM epa.pm25_annual) = '0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_no_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_2nd_no_max_datetime::varchar, '' order by c_2nd_no_max_datetime)) FROM epa.pm25_annual) IS NULL 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_3rd_max_datetime) FROM epa.pm25_annual) = '787' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_3rd_max_datetime::varchar, '' order by c_3rd_max_datetime)) FROM epa.pm25_annual) = '3127c0a3d4cd4cfc3643df6309a0b97b' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_3rd_max_value) FROM epa.pm25_annual) BETWEEN 25.533680523203728 AND 26.049512452965416 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_3rd_max_value) FROM epa.pm25_annual) BETWEEN 310.70394887184307 AND 316.9807963237995 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_4th_max_datetime) FROM epa.pm25_annual) = '793' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_4th_max_datetime::varchar, '' order by c_4th_max_datetime)) FROM epa.pm25_annual) = '4ef8767d0bb66e903dbe591e3e5b2913' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_4th_max_value) FROM epa.pm25_annual) BETWEEN 23.764921597633133 AND 24.245021023847947 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_4th_max_value) FROM epa.pm25_annual) BETWEEN 263.8584116418533 AND 269.18888460431504 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_50th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_50th_percentile) FROM epa.pm25_annual) BETWEEN 8.43221065342815 AND 8.602558343396396 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_50th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_50th_percentile) FROM epa.pm25_annual) BETWEEN 6.9942279058508126 AND 7.135525439302344 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_75th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_75th_percentile) FROM epa.pm25_annual) BETWEEN 12.100373406681873 AND 12.344825394695649 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_75th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_75th_percentile) FROM epa.pm25_annual) BETWEEN 13.716797174058666 AND 13.993904187676012 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_90th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_90th_percentile) FROM epa.pm25_annual) BETWEEN 16.797433919227156 AND 17.136776018605484 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_90th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_90th_percentile) FROM epa.pm25_annual) BETWEEN 29.31917969172518 AND 29.911486352164072 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_95th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_95th_percentile) FROM epa.pm25_annual) BETWEEN 20.343191600697708 AND 20.754165168388568 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_95th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_95th_percentile) FROM epa.pm25_annual) BETWEEN 51.71126708389841 AND 52.75593914619939 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_98th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_98th_percentile) FROM epa.pm25_annual) BETWEEN 24.47118918556286 AND 24.96555664385706 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_98th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_98th_percentile) FROM epa.pm25_annual) BETWEEN 101.30361781387292 AND 103.35015554748652 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_99th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_99th_percentile) FROM epa.pm25_annual) BETWEEN 27.462943955700442 AND 28.017750904300453 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_99th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_99th_percentile) FROM epa.pm25_annual) BETWEEN 140.6019653419089 AND 143.4424090861899 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.cbsa_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT cbsa_name) FROM epa.pm25_annual) = '383' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.cbsa_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(cbsa_name::varchar, '' order by cbsa_name)) FROM epa.pm25_annual) = '435e06257feb510077b4cb00579de15c' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.certification_indicator' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT certification_indicator) FROM epa.pm25_annual) = '6' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.certification_indicator' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(certification_indicator::varchar, '' order by certification_indicator)) FROM epa.pm25_annual) = '0993e10b4c4e020809f5ab76b5475df0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.city_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT city_name) FROM epa.pm25_annual) = '693' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.city_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(city_name::varchar, '' order by city_name)) FROM epa.pm25_annual) = '9e5b315a03079f29487dc96ca5c71e9f' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.completeness_indicator' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT completeness_indicator) FROM epa.pm25_annual) = '2' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.completeness_indicator' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(completeness_indicator::varchar, '' order by completeness_indicator)) FROM epa.pm25_annual) = '539dd1484c25c4e94179a87fdbdc1797' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_code' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT county_code) FROM epa.pm25_annual) = '127' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_code' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(county_code::varchar, '' order by county_code)) FROM epa.pm25_annual) = '0747d67bdf6f753d2e9da84d9b99cdfa' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT county_name) FROM epa.pm25_annual) = '527' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(county_name::varchar, '' order by county_name)) FROM epa.pm25_annual) = '93535ce373a28952de173338fab7f64a' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.date_of_last_change' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT date_of_last_change) FROM epa.pm25_annual) = '68' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.datum' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT datum) FROM epa.pm25_annual) = '2' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.datum' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(datum::varchar, '' order by datum)) FROM epa.pm25_annual) = '0013c6d2e81e5d29e4c7a105701e06fa' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.event_type' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT event_type) FROM epa.pm25_annual) = '4' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.event_type' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(event_type::varchar, '' order by event_type)) FROM epa.pm25_annual) = 'f1fd21711b7a5fad12a51695d6713fc6' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.exceptional_data_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(exceptional_data_count) FROM epa.pm25_annual) BETWEEN 34.69384512564605 AND 35.39473088576011 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.exceptional_data_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(exceptional_data_count) FROM epa.pm25_annual) BETWEEN 202998.329184955 AND 207099.3055321258 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.latitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(latitude) FROM epa.pm25_annual) BETWEEN 37.87440706480886 AND 38.63954660147166 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.latitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(latitude) FROM epa.pm25_annual) BETWEEN 40.95304480806424 AND 41.780379046610996 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.local_site_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT local_site_name) FROM epa.pm25_annual) = '987' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.local_site_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(local_site_name::varchar, '' order by local_site_name)) FROM epa.pm25_annual) = '2363dbd02bdea3f5a92c72132002d50f' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.longitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(longitude) FROM epa.pm25_annual) BETWEEN -97.02862377917171 AND -95.10726489245545 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.longitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(longitude) FROM epa.pm25_annual) BETWEEN 367.72995074407123 AND 375.1588386378908 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.method_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT method_name) FROM epa.pm25_annual) = '19' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.method_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(method_name::varchar, '' order by method_name)) FROM epa.pm25_annual) = '4c122105081df4cefac751292db55050' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.metric_used' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT metric_used) FROM epa.pm25_annual) = '3' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.metric_used' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(metric_used::varchar, '' order by metric_used)) FROM epa.pm25_annual) = 'bb3a07fe7519d51279a72ced4c00034e' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.monitor' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT monitor) FROM epa.pm25_annual) = '1041' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.monitor' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(monitor::varchar, '' order by monitor)) FROM epa.pm25_annual) = 'd6cdd216913ad4199f135149a2b75149' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.null_data_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(null_data_count) FROM epa.pm25_annual) BETWEEN 19.311395918731066 AND 19.70152512921048 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.null_data_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(null_data_count) FROM epa.pm25_annual) BETWEEN 22701.384528921793 AND 23159.9983577889 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.num_obs_below_mdl' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(num_obs_below_mdl) FROM epa.pm25_annual) BETWEEN 0.0 AND 0.0 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.num_obs_below_mdl' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(num_obs_below_mdl) FROM epa.pm25_annual) BETWEEN 0.0 AND 0.0 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(observation_count) FROM epa.pm25_annual) BETWEEN 294.4450289609695 AND 300.39341338442347 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(observation_count) FROM epa.pm25_annual) BETWEEN 1058080.251915631 AND 1079455.6105401893 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_percent' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(observation_percent) FROM epa.pm25_annual) BETWEEN 85.05879388700765 AND 86.77715335947246 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_percent' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(observation_percent) FROM epa.pm25_annual) BETWEEN 425.121429824265 AND 433.7097415378866 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.parameter_code' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT parameter_code) FROM epa.pm25_annual) = '1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.parameter_code' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(parameter_code::varchar, '' order by parameter_code)) FROM epa.pm25_annual) = '4cc86de676c1ae1ee0703ea3843f3aac' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.parameter_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT parameter_name) FROM epa.pm25_annual) = '1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.parameter_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(parameter_name::varchar, '' order by parameter_name)) FROM epa.pm25_annual) = '03866343c5eb218dd7e2ab9704c9d026' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.poc' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(poc) FROM epa.pm25_annual) BETWEEN 1.5201113883443236 AND 1.5508207093209767 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.poc' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(poc) FROM epa.pm25_annual) BETWEEN 0.8597719259848469 AND 0.8771410558027226 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.pollutant_standard' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT pollutant_standard) FROM epa.pm25_annual) = '8' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.pollutant_standard' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(pollutant_standard::varchar, '' order by pollutant_standard)) FROM epa.pm25_annual) = '6ebeab55db49bf204f57b56f1429c0c8' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.primary_exceedance_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(primary_exceedance_count) FROM epa.pm25_annual) BETWEEN 11.910249382161313 AND 12.150860480790834 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.primary_exceedance_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(primary_exceedance_count) FROM epa.pm25_annual) BETWEEN 1023.1723800368542 AND 1043.8425291285077 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.record' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT record) FROM epa.pm25_annual) = '22444' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.record' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(record::varchar, '' order by record)) FROM epa.pm25_annual) = '8decb2ac4b6cf4b5c072f55fac567034' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.required_day_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(required_day_count) FROM epa.pm25_annual) BETWEEN 179.93364685439317 AND 183.56867002316878 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.required_day_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(required_day_count) FROM epa.pm25_annual) BETWEEN 15344.579315941797 AND 15654.570817273956 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.sample_duration' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT sample_duration) FROM epa.pm25_annual) = '3' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.sample_duration' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(sample_duration::varchar, '' order by sample_duration)) FROM epa.pm25_annual) = 'b1d6b51d54ffbdca8319ee8aa8cb12a1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.secondary_exceedance_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(secondary_exceedance_count) FROM epa.pm25_annual) BETWEEN 5.492042237699394 AND 5.602992585935745 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.secondary_exceedance_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(secondary_exceedance_count) FROM epa.pm25_annual) BETWEEN 250.943208448186 AND 256.01276821481605 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.site_num' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT site_num) FROM epa.pm25_annual) = '225' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.site_num' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(site_num::varchar, '' order by site_num)) FROM epa.pm25_annual) = '874540d489d669a9893f51ec2056a436' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_code' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT state_code) FROM epa.pm25_annual) = '53' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_code' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(state_code::varchar, '' order by state_code)) FROM epa.pm25_annual) = 'd0424482980a4f73a06666a4e3055bd1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT state_name) FROM epa.pm25_annual) = '53' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(state_name::varchar, '' order by state_name)) FROM epa.pm25_annual) = '60aba94c47b8dd8e0b9c1b58838bd450' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.units_of_measure' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT units_of_measure) FROM epa.pm25_annual) = '1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.units_of_measure' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(units_of_measure::varchar, '' order by units_of_measure)) FROM epa.pm25_annual) = '314ad5a558d4b3b702f2930421805b17' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.valid_day_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(valid_day_count) FROM epa.pm25_annual) BETWEEN 150.58524594546427 AND 153.62737212618075 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.valid_day_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(valid_day_count) FROM epa.pm25_annual) BETWEEN 12110.537283035874 AND 12355.194601885085 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.year' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(year) FROM epa.pm25_annual) BETWEEN 1989.8615362680448 AND 2030.0607592229549 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.year' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(year) FROM epa.pm25_annual) BETWEEN 0.9885496424602398 AND 1.0085203423079214 
		THEN true ELSE false END AS passed

-- Test case end
