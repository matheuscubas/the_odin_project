# frozen_string_literal: true

class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.references :departure_aiport, null: false, foreign_key: { to_table: :airports }
      t.references :destination_aiport, null: false, foreign_key: { to_table: :airports }
      t.integer :capacity
      t.time :duration
      t.datetime :departure_time

      t.timestamps
    end
  end
end
