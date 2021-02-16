class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '揚げ物' },
    { id: 3, name: '炒め物' },
    { id: 4, name: '煮物' },
    { id: 5, name: '汁物' },
    { id: 6, name: 'ごはんもの' }
  ]

  include ActiveHash::Associations
  has_many :tastes
end
