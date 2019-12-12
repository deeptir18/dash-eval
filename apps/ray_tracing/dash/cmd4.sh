cat rays.csv | q -H -d, "SELECT MAX(timestamp), MAX(hop) FROM - GROUP BY pathID LIMIT 5"

