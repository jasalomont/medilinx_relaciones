class BrokerProfile < ApplicationRecord
  # Direct associations

  belongs_to :inusrer,
             :class_name => "Insurer",
             :foreign_key => "insurer_id"

  # Indirect associations

  # Validations

end
