# == Schema Information
#
# Table name: contact_shares
#
#  id         :integer          not null, primary key
#  contact_id :integer          not null
#  user_id    :integer          not null
#

class ContactShare < ActiveRecord::Base
  validates :user_id, :presence => true, :uniqueness => {:scope => :contact_id}

  belongs_to :contact,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: 'Contact'

  belongs_to :user,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :comments, as: :commentable
end
