class Idea < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews, dependent: :destroy
  
  validates(:title, presence: true)

  validates(
    :description,
    presence: {
      message: "must be given"
    },
    length: {
      minimum: 10,
      maximum: 250
    }
  )
end
