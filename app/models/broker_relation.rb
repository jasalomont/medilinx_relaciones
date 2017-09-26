class BrokerRelation < ApplicationRecord
  # Direct associations

  belongs_to :insurer,
             :counter_cache => true

  belongs_to :patient

  # Indirect associations

  # Validations

end
