cat *.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> rays.csv
