class Inkling::HomeController < Inkling::BaseController
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
      for path in engine.paths.all_paths
        path_str = path.first    
        if path_str =~ /views/
    	    if File.exist?("#{path_str}/inkling/home/")
    		    for entry in Dir.entries("#{path_str}/inkling/home/")
    			    if entry =~ /_dashboard\./
    				    partials << "#{path_str}/inkling/home/#{entry}"		
    			    end
    		    end
    	    end
        end    
      end
    end
    partials
  end
end