class Role < ApplicationRecord
  store_accessor :permissions

  has_many :users, dependent: :nullify

  validates :name, presence: true, uniqueness: true

  has_paper_trail only: [:name, :permissions]
end
