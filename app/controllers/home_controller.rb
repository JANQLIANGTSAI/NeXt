class HomeController < ApplicationController

  def index

    return welcome
    # TODO: differentiate between welcome and dashboard once we have a dashboard design
    # return current_user ? dashboard : welcome
  end

  def about
  end

  private

  def dashboard

    @ideas = perform_search { |query|
      query.type 'ideas'
      query.limit 5
    }.map(&:model).select(&:global)

    @projects = perform_search { |query|
      query.type 'projects'
      query.limit 5
    }.map(&:model).select(&:global)

    render 'dashboard'
  end

  def welcome

    @ideas = perform_search { |query|
      query.type 'ideas'
      query.limit 5
    }.map(&:model).select(&:global)

    @projects = perform_search { |query|
      query.type 'projects'
      query.limit 5
    }.map(&:model).select(&:global)

    render 'welcome'

  end

end
