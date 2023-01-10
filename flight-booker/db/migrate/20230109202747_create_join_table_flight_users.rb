# frozen_string_literal: true

class CreateJoinTableFlightUsers < ActiveRecord::Migration[7.0]
  def change
    create_join_table :flights, :users
  end
end
