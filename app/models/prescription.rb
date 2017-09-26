class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :event,
             :required => false

  belongs_to :patient,
             :counter_cache => true

  belongs_to :doctor

  # Indirect associations

  # Validations

end
