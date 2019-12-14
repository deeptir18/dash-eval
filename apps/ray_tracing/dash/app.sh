cat 1.INFO | grep "\[RAY\]" | head -n1 | cut -c 7- > rays.csv
cat *.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> rays.csv
cat rays.csv | q -H -d, "SELECT * FROM - WHERE pathID = 328512"
cat rays.csv | q -H -d, "SELECT MAX(timestamp), MAX(hop) FROM - GROUP BY pathID LIMIT 5"
