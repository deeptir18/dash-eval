cat 1.INFO | grep "\[RAY\]" | head -n1 | cut -c 7- > rays.csv
cat *.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> rays.csv
