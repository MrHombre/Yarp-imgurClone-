require 'rails_helper'

feature 'user creates a new post' do
  scenario 'successfully' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    create_post('title', 'imgur.com')

    expect(page.current_path).to eq root_path
    expect(page).to have_content 'Post Success!'
  end
end
