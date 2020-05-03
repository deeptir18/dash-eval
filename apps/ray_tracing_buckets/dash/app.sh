#cat logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/1.INFO | grep "\[RAY\]" | head -n1 | cut -c 7- > logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/rays.csv
#cat logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/*.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- >> logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/rays.csv
#cat logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/rays.csv | sed -n '/^590432,/p'
cat logs/902bc7ba-4c19-40c0-bcb1-7687bfbee70b/*.INFO | grep "\[RAY\]" | grep -v pathID | cut -c 7- | sed -n '/^590432,/p'
