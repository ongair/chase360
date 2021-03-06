# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  image_uid   :string(255)
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  company_id  :integer
#  active      :boolean          default(TRUE)
#

class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :company
  
  dragonfly_accessor :image
  
  def as_json *args
    super(except: [:image_uid, :created_at, :updated_at]).merge({'image_url' => image_url})
  end
  
  def image_url
    "#{ENV["host"]}#{image.try(:url)}"
  end

  def to_s
  	name
  end
end
