class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '食材の下味' },
    { id: 3, name: '炒め物' },
    { id: 4, name: '煮込み物' },
    { id: 5, name: 'スープの味付け' },
    { id: 6, name: 'その他(漬物など)' }
  ]

  include ActiveHash::Associations
  has_many :tastes

end