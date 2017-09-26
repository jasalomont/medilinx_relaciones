class Prescription < ApplicationRecord
  # Direct associations

  belongs_to :patient,
             :counter_cache => true

  belongs_to :doctor

  # Indirect associations

  # Validations

end
