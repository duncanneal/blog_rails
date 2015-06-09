class Comment < ActiveRecord::Base
  belongs_to :post

  validates :author_name, presence: true
  validates :author_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :body, presence: true
end