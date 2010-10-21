class Inkling::HomeController < Inkling::BaseController

  layout 'inkling/manage'
  helper_method :dashboard_partials
    
  # protected
  #these methods would be better in a helper, but it seems helpers have issues loading from engines.
  def render_dashboard_partials
    for file in dashboard_partials
    	render(:file => file)
  	end
  end
  
  
  def dashboard_partials
    partials = []

    for engine in Rails.application.railties.engines
      dashboard_partials = scan_path_for_dashboard_partial(engine)
      partials += dashboard_partials if dashboard_partials.any?
    end
    
    partials += scan_path_for_dashboard_partial(Rails.application)
    
    partials
  end
  
  def scan_path_for_dashboard_partial(application)
    partials = []
    for path in application.paths.app.views
      if path =~ /views/
  	    if File.exist?("#{path}/inkling/home/")
  		    for entry in Dir.entries("#{path}/inkling/home/")
  			    if entry =~ /_dashboard\./
  				    partials << "#{path}/inkling/home/#{entry}"		
  			    end
  		    end
  	    end
      end    
    end
    
    partials
  end
end