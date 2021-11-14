class Player 
  include ActiveModel::Model
  include ActiveModel::Attributes 

  attribute :name, :string 
  attribute :number, :integer
  attribute :image, :string
  attribute :fouls, :integer, default: 0
  attribute :team, :string

end