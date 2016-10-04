# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  text             :string           not null
#  body             :string           not null
#  contact_id       :integer
#  user_id          :integer
#  contact_share_id :integer
#

class Comment < ActiveRecord::Base
  belongs_to :commentable, polymorphic: true
end
