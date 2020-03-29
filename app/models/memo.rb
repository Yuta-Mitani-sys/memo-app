class Memo < ApplicationRecord
  belongs_to :user
  validates :title, :text, presence: true

  def self.search(search)
    return Memo.all unless search
    Memo.where('text LIKE(?)', "%#{search}%")
  end
end
