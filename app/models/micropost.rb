class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :likes
  has_many :favorites, through: :likes, source: :user , dependent: :destroy
  
  def favorite(other_user)
    unless self == other_user
     self.likes.find_or_create_by(user_id: other_user.id)
    end
  end  
  def unfavorite(other_user)
    like = self.likes.find_by(user_id: other_user.id)
    like.destroy if like
  end
  
  def favoriting?(other_user)
    self.favorites.include?(other_user)
    
  end  
end
