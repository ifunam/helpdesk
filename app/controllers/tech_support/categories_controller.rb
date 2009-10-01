class TechSupport::CategoriesController < TechSupport::CatalogsController
  def initialize
    @model = Category
    super
  end
end
