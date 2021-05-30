require 'rails_helper'

RSpec.describe Room, type: :model do
  before do
    @room = FactoryBot.build(:room)
  end
  describe '新規チャットルーム作成' do
    context '新規チャットルームが作成できる' do
      it 'nameの値があればチャットルームを作成できる'do
      expect(@room).to be_valid
      end
    end
    context '新規チャットルームが作成できない' do
      it 'nameの値が空では作成できない' do
        @room.name = ''
        @room.valid?
        expect(@room.errors.full_messages).to include("Name can't be blank")
      end
    end
  end
end
