# frozen_string_literal: true
class Agency < ApplicationRecord
  has_many :users

  self.per_page = 20

  def self.find_hif
    find_by_name("HIF")
  end

  def self.ordered_agencies
    all.order(:name)
  end

  def full_address
    "#{address}, #{city}, #{state} #{zip}"
  end

  def to_s
    name
  end
end
