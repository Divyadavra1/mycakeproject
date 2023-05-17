# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :timeoutable, :confirmable
  has_many :orders
  has_many :orderproducts
  has_many :carts
  has_many :products, through: :orderproducts
  validates :name, :address, :zip, presence: false, length: { maximum: 50 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 6..20 }
  validates :phone, numericality: true, presence: false, length: { is: 10 }

  after_initialize do |_user|
    puts 'You have initialized an object!'
  end
  def total_price
    carts.sum(:price)
  end
  before_save do
    self.email = email.downcase
    puts 'before save'
  end

  before_create do
    if name.nil?
      self.name = 'Isha'
      puts 'before create'
    end
  end
end
