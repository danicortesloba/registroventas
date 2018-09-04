class Sale < ApplicationRecord
  validates :cod, uniqueness: true
  validates :detail, presence: true
  validates :category, inclusion: {in: %w(uno dos tres cuatro cinco)}
  validates :value, numericality: {only_integer: true}
  validates :value, numericality: {greater_than: 0}
  validates :discount, numericality: {only_integer: true}
  validates :discount, numericality: {greater_than: 0}
  validates :discount, numericality: {less_than_or_equal_to: 40}
end
