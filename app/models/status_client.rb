class StatusClient < ApplicationRecord
  belongs_to :status
  belongs_to :client
end
