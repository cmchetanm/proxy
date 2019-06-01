class Ping < ApplicationRecord
  validates :app_id, numericality: { only_integer: true }, presence: true
  validates :ping_type, inclusion: { in: ['static', 'lite', 'dynamic'] }, presence: true
end
