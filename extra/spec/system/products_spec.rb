require 'rails_helper'

describe '表示のテスト' do
  let!(:product) { Product.new(title:'hoge', price: 100) }
  describe "一覧画面のテスト" do
    before do
      visit products_path
    end
    context '一覧の表示' do
      it "productの一覧表示(tableタグ)が画面に表示されているか" do
        expect(page).to have_selector 'table'
      end
    end
  end
end