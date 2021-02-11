class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜２日で発送' },
    { id: 3, name: '２〜３で発送' },
    { id: 4, name: '４〜７日で発送' }
  ]

  include ActiveHash::Associations
  has_many :items
  
  end