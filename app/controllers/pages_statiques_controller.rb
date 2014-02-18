class PagesStatiquesController < ApplicationController

  before_filter :authenticate_user!

  def home
    @user=current_user
    @micropost = current_user.microposts.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def landing
  end

  def apropos
  end

  def mentionslegales
  end

  def contact
  end

  def blog
  end
end
