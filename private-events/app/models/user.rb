# frozen_string_literal: true

class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', inverse_of: 'creator'
  has_and_belongs_to_many :attended_events, class_name: 'Event', through: :events_users
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
