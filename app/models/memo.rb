class Memo < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :title, :text, presence: true

  def self.search(search)
    return Memo.all unless search
    Memo.where('text LIKE(?)', "%#{search}%")
  end

  def show_last_comment
    if (last_comment = comments.last).present?
      last_comment.user_id
    else 
      'コメントはありません'
    end
  end
end
