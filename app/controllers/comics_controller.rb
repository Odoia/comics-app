class ComicsController < ApplicationController

  def index
    all_comics
  end

  private

  def all_comics
    ::Comics::All.new.call
  end
end
