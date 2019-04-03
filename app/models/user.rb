class User < ApplicationRecord
  has_many :orders

  validates :email, format: { with: /\A[-a-z0-9~!$%^&*_=+}{\'?]+(\.[-a-z0-9~!$%^&*_=+}{\'?]+)*@([a-z0-9_][-a-z0-9_]*(\.[-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?\z/, message: "Invalid email" }
  validates :phone, length: { in: 9..12 }
  validates :phone, format: { with: /\A[0-9]+\z/ }
  validates :password, length: { in: 8..12 }
  validates :password, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
