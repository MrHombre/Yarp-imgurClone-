require 'rails_helper'

feature 'user votes for a post' do
  scenario 'upvotes' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    create_post('first post', 'imgur.com')
    click_on('first post')

    find('.up').click

    expect(page).to have_content '1 points'
  end

  scenario 'downvotes' do
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    visit root_path
    create_post('first post', 'imgur.com')
    click_on('first post')

    find('.down').click

    expect(page).to have_content '0 points'
  end
end
