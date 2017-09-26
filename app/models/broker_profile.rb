class BrokerProfile < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  # Direct associations

  belongs_to :inusrer,
             :class_name => "Insurer",
             :foreign_key => "insurer_id"

  # Indirect associations

  # Validations

end
