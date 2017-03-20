# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  Port.create(
    [
       {
        "id" => 1,
        "title" => "Dingle Harbour",
          "lat" => 52.13333333,
          "lng" => -10.26666667
      },
       {
        "id" => 2,
        "title" => "Hirao",
          "lat" => 33.9,
          "lng" => 132.05
      },
       {
        "id" => 3,
        "title" => "Humbug Point Wharf",
          "lat" => -12.66666667,
          "lng" => 141.8666667
      },
       {
        "id" => 4,
        "title" => "Benghazi",
          "lat" => 32.1166,
          "lng" => 20.0833
      },
       {
        "id" => 5,
        "title" => "Seaham",
          "lat" => 54.8333,
          "lng" => -1.3166
      },
       {
        "id" => 6,
        "title" => "Blue Beach Harbour",
          "lat" => 48.78333333,
          "lng" => -58.78333333
      },
       {
        "id" => 7,
        "title" => "Skamania County",
          "lat" => 45.68333333,
          "lng" => -121.8833333
      },
       {
        "id" => 8,
        "title" => "Puerto de Calpe",
          "lat" => 0.0,
          "lng" => -0.3333333333
      }
    ]
  )

  Cargo.create(
    [
      {
        "id" => 1,
        "port_id" => 1,
        "title" => "Cargo 1000",
        "open_date" => "2017-03-01",
        "capacity" => 1000
      },
      {
        "id" => 2,
        "port_id" => 1,
        "title" => "Cargo 3000",
        "open_date" => "2017-03-01",
        "capacity" => 3000
      },
      {
        "id" => 3,
        "port_id" => 1,
        "title" => "Cargo 2000",
        "open_date" => "2017-03-05",
        "capacity" => 2000
      }
    ]
  )

  Vessel.create(
    [
      {
        "id" => 1,
        "title": "Vessel 1000",
        "hold_capacity": 1000
      },
      {
        "id" => 2,
        "title": "Vessel 3000",
        "hold_capacity": 3000
      }
    ]
  )

  Position.create(
    [
      {
        "id" => 1,
        "vessel_id" => 1,
        "port_id" => 1,
        "open_date" => "2017-03-01"
      },
      {
        "id" => 2,
        "vessel_id" => 1,
        "port_id" => 2,
        "open_date" => "2017-03-15"
      },
      {
        "id" => 3,
        "vessel_id" => 1,
        "port_id" => 3,
        "open_date" => "2017-03-30"
      },

      {
        "id" => 4,
        "vessel_id" => 2,
        "port_id" => 1,
        "open_date" => "2017-03-05"
      },
      {
        "id" => 5,
        "vessel_id" => 2,
        "port_id" => 2,
        "open_date" => "2017-03-15"
      }
    ]
  )
  # SELECT setval('your_table_id_seq', (SELECT MAX(id) FROM your_table));
  # ActiveRecord::ConnectionAdapters::PostgreSQL::SchemaStatements#reset_pk_sequence!
  # reset_pk_sequence!(table, pk = nil, sequence = nil)
  ActiveRecord::Base.connection.reset_pk_sequence!('ports')
  ActiveRecord::Base.connection.reset_pk_sequence!('cargos')
  ActiveRecord::Base.connection.reset_pk_sequence!('vessels')
  ActiveRecord::Base.connection.reset_pk_sequence!('positions')
  # ActiveRecord::Base.connection.tables
