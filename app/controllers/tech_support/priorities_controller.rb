class TechSupport::PrioritiesController < TechSupport::CatalogsController
  def initialize
    @model = Priority
    super
  end
end
