class User < ApplicationRecord
    has_many :lists, dependent: :destroy # dependent: :destroyをつけることで、オブジェクトが削除されるときに、関連付けられたオブジェクトのdestroyメソッドが実行されます(今回で言うと、ユーザーが削除されたら、そのユーザーに紐づくリストも削除します)

    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable

  validates :name, presence: true, length: { maximum: 20 }
end
