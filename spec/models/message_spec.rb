require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end
  describe 'メッセージの保存' do
    context 'メッセージが保存できる' do
      it 'contentとimageがあれば登録できる' do
        expect(@message).to be_valid
      end
      it 'imageがなくても、登録できる' do
        @message.image =  nil
        expect(@message).to be_valid
      end
      it 'contentがなくても、登録できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
    end
    context 'メッセージが保存できない' do
      it 'contentとimageの値が空では登録できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include("Content can't be blank")
      end
      it 'user_idと紐づいていなければ登録できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('User must exist')
      end
      it 'room_idと紐づいていなければ登録できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include('Room must exist')
      end
    end
  end
end
