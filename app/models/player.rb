class Player 
  include ActiveModel::Model
  include ActiveModel::Attributes 

  attribute :name, :string 
  attribute :number, :integer 
  attribute :fouls, :integer 
end