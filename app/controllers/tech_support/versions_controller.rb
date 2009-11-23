class TechSupport::VersionsController < ApplicationController
  before_filter :user_profile
  def index
    @tickets = Ticket.search_and_paginate(params[:search], params[:page])
  end
end
