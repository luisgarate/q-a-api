class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  scope :publics, -> {where(private: false)}
  scope :has_answer, -> {where("answers_count > 0")}
  scope :by_items_in, -> (item) { where('content LIKE ?', "%#{item}%") }

end
