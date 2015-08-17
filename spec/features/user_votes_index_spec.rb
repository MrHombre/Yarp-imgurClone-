require 'rails_helper'

feature 'user votes for a post' do
  scenario 'upvote' do
    user = FactoryGirl.create(:user)
    login_as(user, scope => :user)

    visit root_page
    create_post('first post', 'imgur.com')
    expect(page.current_path).to eq root_path

    find('.up').click

    expect(page).to have_content '1points'
  end
end
