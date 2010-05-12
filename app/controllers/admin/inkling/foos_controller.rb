class Admin::Inkling::FoldersController < Admin::Inkling::BaseController

  before_filter :get_folder, :except => [:index, :new, :create]

  def index
    @foos = Inkling::Foo.all
  end

  def show; end

  def new
    @foo = Inkling::Foo.new
  end

  def edit; end

  def create
    @foo = Inkling::Foo.create(params[:inkling_foo])
    render :action => :edit
  end

  def update
    @foo = Inkling::Foo.update_attributes(params[:inkling_foo])
    render :action => :edit
  end

  def destroy
    @foo.delete

    params[:msg] = "Foo #{@foo.name} deleted"
    redirect_to :action => :index
  end

  private
  def get_foo
    @foo = Inkling::Foo.find(params[:id])
  end
end
