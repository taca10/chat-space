class Group < ApplicationRecord
  has_many :messages,  -> { order("created_at ASC") }
  has_many :group_users
  has_many :users, through: :group_users
  accepts_nested_attributes_for :group_users

  validates :name, presence: true

  def last_message
    messages.last.try(:text) || "まだメッセージはありません。"
  end
end
