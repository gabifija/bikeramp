# Bikeramp API

Imagine you are a bike courier and you want to build a system that will help you track your rides during delivery of packages: how many kilometers did you ride on each day and how much did customer pay for delivery. The app will help you to control your work.

API contains the following endpoints:

### Trips

This endpoint logs the trip and automatically calculates the distance between start and destination addresses.


```
POST http://example.com/api/trips
```

```
GET curl "http://example.com/api/api/trips"

{
  "start_address": "Plac Europejski 2, Warszawa, Polska",
  "destination_address":    "Plac Europejski 2, Warszawa, Polska",
  "price": "49.75PLN",
  "date": "July, 4th"
}
```

### Stats

This endpoint retrieves how many kilometers did courier rode during current week and how much money he received on the rides.

```
GET http://example.com/api/stats/weekly
```

```
curl "http://example.com/api/stats/weekly"

{
  "total_distance": "40km",
  "total_price":    "49.75PLN"
}
```

### Monthly Stats

This endpoint retrieves summary of ride distances from current month, grouped by day. The summary should include sum of all rides distances from given day, average ride distance and average price for the ride.

```
GET http://example.com/api/stats/monthly
```

```
curl "http://example.com/api/stats/monthly"

[
  {
    "day":            "July, 4th",
    "total_distance": "12km",
    "avg_ride":       "4km",
    "avg_price":      "22.75PLN"
  },
  {
    "day":            "July, 5th",
    "total_distance": "3km",
    "avg_ride":       "3km",
    "avg_price":      "15.5PLN"
  }
]
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
