# frozen_string_literal: true

Flight.delete_all
Airport.delete_all

5.times do
  alphabet = ('A'..'Z').to_a
  Airport.create(code: alphabet.sample(3).join)
end

airport_ids = Airport.pluck(:id)

30.times do
  arrival_id = airport_ids.sample
  departing_id = (airport_ids - [arrival_id]).sample
  Flight.create(departure_aiport_id: departing_id,
                destination_aiport_id: arrival_id,
                capacity: rand(60..80),
                duration: rand(30..999),
                departure_time: rand(Time.now..Time.now.end_of_month).to_datetime)
end
