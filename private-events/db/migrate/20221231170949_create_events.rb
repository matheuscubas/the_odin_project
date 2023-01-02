# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
