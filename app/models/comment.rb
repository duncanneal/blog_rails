class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author_name, presence: true
  validates :body, presence: true
end
