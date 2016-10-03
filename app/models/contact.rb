# == Schema Information
#
# Table name: contacts
#
#  id      :integer          not null, primary key
#  name    :string
#  email   :string
#  user_id :integer
#

class Contact < ActiveRecord::Base
  validates_uniqueness_of :email, scope: :user_id

  belongs_to :owner,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: 'User'

  has_many :contact_shares,
    primary_key: :id,
    foreign_key: :contact_id,
    class_name: 'ContactShare'

  has_many :shared_users,
    through: :contact_shares,
    source: :user
end
