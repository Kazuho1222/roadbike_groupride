class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ゆるポタ（巡航～25km）' },
    { id: 3, name: 'トレーニング（巡航30km～）' },
  ]

  include ActiveHash::Associations
  has_many :events
end
