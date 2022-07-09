class ComicsController < ApplicationController

  def index
    @comics = all_comics
  end

  private

  def all_comics
    ::Comics::All.new.call
  end
end
