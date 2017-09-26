class Event < ApplicationRecord
  # Direct associations

  has_many   :prescriptions,
             :dependent => :nullify

  # Indirect associations

  # Validations

end
