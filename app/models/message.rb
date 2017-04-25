class Message < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :text, presence: true
  validates :user_id, presence: true

  def json
    {  name: user.name, created_at: created_at.strftime('%Y年%m月%d日 %H:%M:%S'), text: text }
  end
end
