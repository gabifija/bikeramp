# Bikeramp API

Imagine you are a bike courier and you want to build a system that will help you track your rides during delivery of packages: how many kilometers did you ride on each day and how much did customer pay for delivery. The app will help you to control your work.

API contains the following endpoints:

### Trips

This endpoint logs the trip and automatically calculates the distance between start and destination addresses.


```
POST http://example.com/api/trips
```

### Stats

This endpoint retrieves how many kilometers did courier rode during current week and how much money he received on the rides.

```
GET http://example.com/api/stats/weekly
```

### Monthly Stats

This endpoint retrieves summary of ride distances from current month, grouped by day. The summary should include sum of all rides distances from given day, average ride distance and average price for the ride.

```
GET http://example.com/api/stats/monthly
```


### Run

```
bundle install
rake db:setup
rake db:migrate
rake db:seed
```

Then you can run it locally...

```
rails s
http://localhost:8000/
```
