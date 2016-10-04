# == Schema Information
#
# Table name: contacts
#
#  id        :integer          not null, primary key
#  name      :string
#  email     :string
#  user_id   :integer
#  favorited :boolean
#

class Contact < ActiveRecord::Base
  validates_uniqueness_of :email, scope: :user_id

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :contact_shares, :dependent => :destroy,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: 'ContactShare'

  has_many :shared_users, :dependent => :destroy,
    through: :contact_shares,
    source: :user

  has_many :comments, as: :commentable
end
