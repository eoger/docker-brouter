# docker-brouter

## What is brouter?

There's a lot of routing software on the market,
both free and commercial, both online and offline, both OSM and
proprietary maps. However, when it comes to bike routing, it's
hard to find something that's really useful. There's far less
money and engineering power in the field compared to car navigation.

What do we expect from a bike routing software? It should be able
to calculate more or less the routes that match your experience in
the regions you are familiar with, thus giving you confidence that it
yields the same quality in unknown regions. Scanning the market with
that expectation gives little to no result.

Here's what makes BRouter unique:

* It uses freely configurable routing profiles
* It works fully offline on any Android phone and is interfaced to some of the most popular Android map tools
* It uses a sophisticated routing-algorithm with elevation consideration
* It offers alternative route calculations
* It supports via and nogo-points
* It can consider long distance cycle routes
* Routing data is available worldwide with automatic weekly updates

# How to use this image

This image assumes there is 3 directories named `customprofiles`, `profiles` and `segments` in its current directory.  
The brouter-server listens to connections on port 17777.

## Create a `Dockerfile` in your project directory

	FROM eoger/brouter:onbuild

The build will copy the contents of the current directory into `/usr/src/app`.
This is where you should supply the `customprofiles`, `profiles` and `segments` directories.

You can then build and run the brouter image:

	docker build -t brouter-server .
	docker run -it --rm --name routing-server -p 17777:17777 brouter-server
	
Make an example request:

	curl "http://localhost:17777/brouter?lonlats=8.799297,49.565883|8.811764,49.563606&nogos=&profile=trekking&alternativeidx=0&format=gpx"
