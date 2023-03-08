# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
Flat.create!(
  name: 'Light & Spacious Garden Flat London',
  address: '10 Clifton Gardens London W9 1DT',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms, open plan living area, large kitchen and a beautiful conservatory',
  price_per_night: 75,
  number_of_guests: 4
)
Flat.create!(
  name: 'Light & Spacious Garden',
  address: '10 Clifton Gardens London',
  description: 'A lovely summer feel for this spacious garden flat. Two double bedrooms',
  price_per_night: 50,
  number_of_guests: 3
)
Flat.create!(
  name: 'Light & Spacious',
  address: '10 Clifton Gardens',
  description: 'A lovely summer feel for this spacious garden flat.',
  price_per_night: 40,
  number_of_guests: 2
)
Flat.create!(
  name: 'Light',
  address: '10 Clifton',
  description: 'A lovely summer',
  price_per_night: 20,
  number_of_guests: 1
)