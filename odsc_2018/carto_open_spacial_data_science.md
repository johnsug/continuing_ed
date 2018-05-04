
# Open Spatial Data Science -- 5/04/2018
## Andrew Eschbacher, CARTO

most people just think of latitude/longitude, there is SO much more data out there than that

* spacial analytics vs GIS
* methods
* tools

1. traditional GIS (born here in Cambridge)

* organization
* visualization (cartographers make the maps...)
* calculation

answering questions such as
* how far
* how many in this area
* how big
* where are these things
* what's the cloest...

spacial anayltics -- [FOCUS H]
* what is the likely cause of that pattern? (clustering..)
* how much of an effect does this one thing have on another?
* where are the plaes where something unusual is happening?
* how can I organize things better to reduce cost?
* what would happen if I tried to do something similar over here?
* what will hapen in these locations tomorrow?

tasks: (value/difficultly low to high)
* descriptive  -- what happened?            --> traditional GIS
* diagnostic   -- what caused it to happen? --> spacial analytics
* predictive   -- what will happen?
* prescriptive -- how can I make it happen?

data is not information, information is not knowledge, knowledge is not understanding, understanding is not wisdom.
- clifford stoll
Data isn't information. ... Information, unlike data, is useful. While there's a gulf between data and information, there's a wide ocean between information and knowledge. What turns the gears in our brains isn't information, but ideas, inventions, and inspiration. Knowledge - not information - implies understanding. And beyond knowledge lies what we should be seeking: wisdom.
- clifford stoll again

three key methods
1. inference (descriptive)
 - outliers and clusters
 - eg, mentions of earthquake in tweets (find p-value, what's significant) -- spacial autocorrelation
 	- note, 2.5% of tweets are geo-coded
 	- humans become the sensors that report the data to twitter!
 - how do people use parks? use GPS data to understand where people are congegrating, how this impacts maintenance plans / costs / park design. all done in scikit-learn
 - NYC pride parade -- where do people go after the parade

 2. optimization
  - waste collection company in UK -- want to make sure they collect everything, yet minimize waste processing fees...
  	- more distance, more fuel
  	- valhalla: open source map for routing
  	- built distance matrix
  	- constrained by waste, space, travel, etc...

3. prediction
 - feature creation: 
 	- non-spacial: details about the location: square footage, has free coffee, has free beer?
 	- spacial data: how many businesses are nearby, how close is the nearest subway, is there easy access for lunch?
 		* also utilize census data, though data can be very old (today, the 2010 census isn't so helpful), and only talks about where people work/live, not necessarily what they are doing now
		* better: can use mobile data, but it's propriaritary
 -  libraries: react, react-viz, mapbox-GL, 
 - example model data: store performance
	- store locations
  	- BLS data: busines types throughout the US
 	- GPS: living/breathing GPS data
 		* knowing how many people on a street is one thing, knowing how many people on a street between 9-12 pm, 12-2 pm, etc even more useful
 	- ULTIMATELY USE TO PREDICT WHERE TO OPEN A NEW STORE
 	- can use to sample / SIMULATE what will happen opening at different locations...

dashboards are key
visuals are crucial
interactive visuals are even more so

tools:
* GeoPandas
* matplotlib: hard to use, slow, not reproducable... but can be tweaked indefinitely
* Folium: (uses Leaflet) -- customizable but hard-to-use API, not good for big data
* cartoframes: speaker built, static + dynamic maps, animated MAPS (static data)
	* shines in Jupyter notebooks 	

use cases:
* massachusetts power outages
* geographica: route optimization
* cartogrames analysis services

book: **mastering geospacial analysis with Python**

-- check out DASH talk
