class Inkling::FoosController < Inkling::BaseController

  def show; end

  private
  def get_foo
    @foo = Inkling::Foo.find(params[:id])
  end
end
