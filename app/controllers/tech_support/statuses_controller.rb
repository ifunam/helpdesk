class TechSupport::StatusesController < TechSupport::CatalogsController
  def initialize
    @model = Status
    super
  end
end
