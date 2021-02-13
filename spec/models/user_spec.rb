require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録できるとき' do
        it 'nickname, email, password, password_confirmationが存在すれば登録できる' do
          expect(@user).to be_valid
        end
        it 'emailは、@が入っていれば登録できる' do
          @user.email = 'test@example'
          expect(@user).to be_valid
        end
        it 'passwordとpassword_confirmationが6文字以上英字入りであれば登録できる' do
          @user.password = '00000a'
          @user.password_confirmation = '00000a'
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end
        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it 'emailは一意性がないと登録できない' do
          @user.save
          another_user = FactoryBot.build(:user)
          another_user.email = @user.email
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end
        it 'emailは@が含まれていないと登録できない' do
          @user.email = 'test.example'
          @user.valid?
          expect(@user.errors.full_messages).to include('Email is invalid')
        end
        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordは6文字以上でないと登録できない' do
          @user.password = '0000a'
          @user.password_confirmation = '0000a'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end
        it 'passwordは半角英数字混合でないと登録できない' do
          @user.password = '000000'
          @user.password_confirmation = '000000'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは英語のみでは登録できない' do
          @user.password = 'aaaaaa'
          @user.password_confirmation = 'aaaaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは全角では登録できない' do
          @user.password = 'ああああああ'
          @user.password_confirmation = 'ああああああ'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end
        it 'passwordは確認も含めて2回入力しないと登録できない' do
          @user.password = ''
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it 'passwordと確認用passwordが一致していないと登録できない' do
          @user.password = '00000a'
          @user.password_confirmation = '00000b'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
      end
    end
  end
end
