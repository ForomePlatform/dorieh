-- Test case start
SELECT 
	'epa.pm25_annual.address' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT address) FROM epa.pm25_annual) = '993' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.address' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(address::varchar, '' order by address)) FROM epa.pm25_annual) = '9f052f3f32bdfd033503e5dd4c8e05c5' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_mean' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(arithmetic_mean) FROM epa.pm25_annual) BETWEEN 9.629117697022222 AND 9.823645327265096 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_mean' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(arithmetic_mean) FROM epa.pm25_annual) BETWEEN 7.7870791859634325 AND 7.944393916992998 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_standard_dev' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(arithmetic_standard_dev) FROM epa.pm25_annual) BETWEEN 5.586949307333334 AND 5.699816970107745 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.arithmetic_standard_dev' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(arithmetic_standard_dev) FROM epa.pm25_annual) BETWEEN 4.44477889793116 AND 4.534572411020678 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_10th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_10th_percentile) FROM epa.pm25_annual) BETWEEN 4.251885014903802 AND 4.337781681871556 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_10th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_10th_percentile) FROM epa.pm25_annual) BETWEEN 3.5463242873269043 AND 3.6179672022223976 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_1st_max_datetime) FROM epa.pm25_annual) = '760' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_1st_max_datetime::varchar, '' order by c_1st_max_datetime)) FROM epa.pm25_annual) = '1d170a586a6bd5be7ff3703af0f91295' 
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
		WHEN (SELECT AVG(c_1st_max_value) FROM epa.pm25_annual) BETWEEN 35.35882222222222 AND 36.0731418630752 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_1st_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_1st_max_value) FROM epa.pm25_annual) BETWEEN 1172.5570502868318 AND 1196.2450715047476 
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
		WHEN (SELECT COUNT(DISTINCT c_2nd_max_datetime) FROM epa.pm25_annual) = '804' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_2nd_max_datetime::varchar, '' order by c_2nd_max_datetime)) FROM epa.pm25_annual) = 'c48d01c1575c65499e49c03903617e6f' 
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
		WHEN (SELECT AVG(c_2nd_max_value) FROM epa.pm25_annual) BETWEEN 28.993456938766343 AND 29.579183341569703 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_2nd_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_2nd_max_value) FROM epa.pm25_annual) BETWEEN 447.7003283510582 AND 456.7447794288574 
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
		WHEN (SELECT COUNT(DISTINCT c_3rd_max_datetime) FROM epa.pm25_annual) = '840' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_3rd_max_datetime::varchar, '' order by c_3rd_max_datetime)) FROM epa.pm25_annual) = '8dc59257f1a447b12958f75fe6bfb79e' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_3rd_max_value) FROM epa.pm25_annual) BETWEEN 26.207711909364743 AND 26.737160634806454 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_3rd_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_3rd_max_value) FROM epa.pm25_annual) BETWEEN 309.99283222604225 AND 316.25531368515425 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_datetime' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT c_4th_max_datetime) FROM epa.pm25_annual) = '863' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_datetime' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(c_4th_max_datetime::varchar, '' order by c_4th_max_datetime)) FROM epa.pm25_annual) = 'd36eb36580d91aebc0124f8300d4dec4' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_value' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_4th_max_value) FROM epa.pm25_annual) BETWEEN 24.445909164529628 AND 24.939765915328206 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_4th_max_value' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_4th_max_value) FROM epa.pm25_annual) BETWEEN 248.00054462966764 AND 253.01065664238823 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_50th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_50th_percentile) FROM epa.pm25_annual) BETWEEN 8.563934034803724 AND 8.736942803183597 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_50th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_50th_percentile) FROM epa.pm25_annual) BETWEEN 7.979795912094644 AND 8.141003910318778 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_75th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_75th_percentile) FROM epa.pm25_annual) BETWEEN 12.290293333333333 AND 12.538582087542087 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_75th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_75th_percentile) FROM epa.pm25_annual) BETWEEN 14.643537257071024 AND 14.93936629256741 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_90th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_90th_percentile) FROM epa.pm25_annual) BETWEEN 16.983613333333334 AND 17.326716632996632 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_90th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_90th_percentile) FROM epa.pm25_annual) BETWEEN 29.044286708090148 AND 29.631039974920256 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_95th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_95th_percentile) FROM epa.pm25_annual) BETWEEN 20.53972 AND 20.95466383838384 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_95th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_95th_percentile) FROM epa.pm25_annual) BETWEEN 46.435484283738894 AND 47.373574875329574 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_98th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_98th_percentile) FROM epa.pm25_annual) BETWEEN 24.520599999999998 AND 25.01596565656566 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_98th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_98th_percentile) FROM epa.pm25_annual) BETWEEN 76.58508179940738 AND 78.13225516909237 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_99th_percentile' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(c_99th_percentile) FROM epa.pm25_annual) BETWEEN 27.572022222222223 AND 28.129032772166106 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.c_99th_percentile' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(c_99th_percentile) FROM epa.pm25_annual) BETWEEN 113.46056835273812 AND 115.75270104673284 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.cbsa_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT cbsa_name) FROM epa.pm25_annual) = '378' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.cbsa_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(cbsa_name::varchar, '' order by cbsa_name)) FROM epa.pm25_annual) = '452ac79505badea07281061bbfe5ff8d' 
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
		WHEN (SELECT MD5(string_agg(certification_indicator::varchar, '' order by certification_indicator)) FROM epa.pm25_annual) = '406e431497d713c95a5cac1eb061cfca' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.city_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT city_name) FROM epa.pm25_annual) = '674' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.city_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(city_name::varchar, '' order by city_name)) FROM epa.pm25_annual) = '981261a5cf60a5ffde968a3d9e72272d' 
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
		WHEN (SELECT MD5(string_agg(completeness_indicator::varchar, '' order by completeness_indicator)) FROM epa.pm25_annual) = '57c5cbf393e786686da1dc16de9c4ebe' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_code' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT county_code) FROM epa.pm25_annual) = '126' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_code' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(county_code::varchar, '' order by county_code)) FROM epa.pm25_annual) = '5c32f68be1e5c5fedbc64700dd070296' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT county_name) FROM epa.pm25_annual) = '517' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.county_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(county_name::varchar, '' order by county_name)) FROM epa.pm25_annual) = '34fdfe9a00f8875bca42a5a2729b1d6d' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.date_of_last_change' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT date_of_last_change) FROM epa.pm25_annual) = '18' 
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
		WHEN (SELECT MD5(string_agg(datum::varchar, '' order by datum)) FROM epa.pm25_annual) = '7edc63f8ef87a5e4d549b5124e15700a' 
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
		WHEN (SELECT MD5(string_agg(event_type::varchar, '' order by event_type)) FROM epa.pm25_annual) = 'a7cacc9051608e4d3ce1bbe6043ea813' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.exceptional_data_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(exceptional_data_count) FROM epa.pm25_annual) BETWEEN 48.01488888888888 AND 48.984886644219976 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.exceptional_data_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(exceptional_data_count) FROM epa.pm25_annual) BETWEEN 308664.45133439085 AND 314900.0968158937 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.latitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(latitude) FROM epa.pm25_annual) BETWEEN 38.02860480182222 AND 38.79685944428328 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.latitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(latitude) FROM epa.pm25_annual) BETWEEN 40.199247482239684 AND 41.01135349198191 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.local_site_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT local_site_name) FROM epa.pm25_annual) = '950' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.local_site_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(local_site_name::varchar, '' order by local_site_name)) FROM epa.pm25_annual) = 'fd648bda31c0742a4999e0f51aa25f8f' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.longitude' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(longitude) FROM epa.pm25_annual) BETWEEN -96.933112941534 AND -95.01364535853332 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.longitude' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(longitude) FROM epa.pm25_annual) BETWEEN 378.40874131222796 AND 386.0533623488387 
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
		WHEN (SELECT MD5(string_agg(method_name::varchar, '' order by method_name)) FROM epa.pm25_annual) = '09a041b51c63dc2c1aca36ac9a40e0f9' 
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
		WHEN (SELECT MD5(string_agg(metric_used::varchar, '' order by metric_used)) FROM epa.pm25_annual) = 'e328ecc8c9d2c6d8929074407443f7d3' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.monitor' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT monitor) FROM epa.pm25_annual) = '994' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.monitor' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(monitor::varchar, '' order by monitor)) FROM epa.pm25_annual) = '4a134c7ebd991289c1f8ff05f6991abf' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.null_data_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(null_data_count) FROM epa.pm25_annual) BETWEEN 23.128444444444444 AND 23.595685746352412 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.null_data_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(null_data_count) FROM epa.pm25_annual) BETWEEN 28479.44631388864 AND 29054.788663664167 
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
		WHEN (SELECT AVG(observation_count) FROM epa.pm25_annual) BETWEEN 338.9792 AND 345.82726464646464 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(observation_count) FROM epa.pm25_annual) BETWEEN 1329639.3817888838 AND 1356500.7834411846 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_percent' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(observation_percent) FROM epa.pm25_annual) BETWEEN 85.11062222222222 AND 86.83002873176207 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.observation_percent' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(observation_percent) FROM epa.pm25_annual) BETWEEN 416.4466683706963 AND 424.85973237818513 
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
		WHEN (SELECT MD5(string_agg(parameter_code::varchar, '' order by parameter_code)) FROM epa.pm25_annual) = '101a0a7e0621181e83297a436e467786' 
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
		WHEN (SELECT MD5(string_agg(parameter_name::varchar, '' order by parameter_name)) FROM epa.pm25_annual) = '9919d6fb7ace96756e85e10c73bfcad0' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.poc' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(poc) FROM epa.pm25_annual) BETWEEN 1.582311111111111 AND 1.6142769921436588 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.poc' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(poc) FROM epa.pm25_annual) BETWEEN 0.9758453722825815 AND 0.9955594202074822 
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
		WHEN (SELECT MD5(string_agg(pollutant_standard::varchar, '' order by pollutant_standard)) FROM epa.pm25_annual) = 'b756da13594e459848226e67bd7a60ba' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.primary_exceedance_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(primary_exceedance_count) FROM epa.pm25_annual) BETWEEN 13.209931190926275 AND 13.476798487712665 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.primary_exceedance_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(primary_exceedance_count) FROM epa.pm25_annual) BETWEEN 1172.5786223882337 AND 1196.2670794061778 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.record' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT record) FROM epa.pm25_annual) = '22275' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.record' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(record::varchar, '' order by record)) FROM epa.pm25_annual) = 'bd8fd13d2d4fffb800db3f63ca15483d' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.required_day_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(required_day_count) FROM epa.pm25_annual) BETWEEN 187.51488888888886 AND 191.3030684624018 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.required_day_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(required_day_count) FROM epa.pm25_annual) BETWEEN 16044.606172318498 AND 16368.739630345135 
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
		WHEN (SELECT MD5(string_agg(sample_duration::varchar, '' order by sample_duration)) FROM epa.pm25_annual) = '99d437465c65b09ca7daa9e787a6088b' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.secondary_exceedance_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(secondary_exceedance_count) FROM epa.pm25_annual) BETWEEN 6.390421928166352 AND 6.519521361058602 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.secondary_exceedance_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(secondary_exceedance_count) FROM epa.pm25_annual) BETWEEN 319.14214921795394 AND 325.5894653637712 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.site_num' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT site_num) FROM epa.pm25_annual) = '218' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.site_num' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(site_num::varchar, '' order by site_num)) FROM epa.pm25_annual) = 'd11fb95af7bb50d561b0cb6b655596ce' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_code' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT state_code) FROM epa.pm25_annual) = '52' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_code' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(state_code::varchar, '' order by state_code)) FROM epa.pm25_annual) = 'f128236ae465c7d781fee9d4a8a4c92c' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_name' As table_column,
	'count distinct' As Testing,
	CASE 
		WHEN (SELECT COUNT(DISTINCT state_name) FROM epa.pm25_annual) = '52' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.state_name' As table_column,
	'MD5 value' As Testing,
	CASE 
		WHEN (SELECT MD5(string_agg(state_name::varchar, '' order by state_name)) FROM epa.pm25_annual) = 'a0ec1905d91f1d088c887fd962803591' 
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
		WHEN (SELECT MD5(string_agg(units_of_measure::varchar, '' order by units_of_measure)) FROM epa.pm25_annual) = '9124b7ed7543ebcef3597777068e13e1' 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.valid_day_count' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(valid_day_count) FROM epa.pm25_annual) BETWEEN 158.07288888888888 AND 161.26628058361393 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.valid_day_count' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(valid_day_count) FROM epa.pm25_annual) BETWEEN 12976.678128859756 AND 13238.833242574095 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.year' As table_column,
	'Mean value' As Testing,
	CASE 
		WHEN (SELECT AVG(year) FROM epa.pm25_annual) BETWEEN 1990.3796 AND 2030.589288888889 
		THEN true ELSE false END AS passed

-- Test case end
UNION ALL
-- Test case start
SELECT 
	'epa.pm25_annual.year' As table_column,
	'Variance' As Testing,
	CASE 
		WHEN (SELECT VARIANCE(year) FROM epa.pm25_annual) BETWEEN 0.24727154529945228 AND 0.25226693005297657 
		THEN true ELSE false END AS passed

-- Test case end
