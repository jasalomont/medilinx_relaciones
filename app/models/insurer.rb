class Insurer < ApplicationRecord
  # Direct associations

  has_many   :broker_insurers,
             :dependent => :destroy

  has_many   :broker_profiles,
             :dependent => :destroy

  has_many   :broker_relations,
             :dependent => :destroy

  has_many   :prescriptions,
             :dependent => :nullify

  # Indirect associations

  # Validations

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
