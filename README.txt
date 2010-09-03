Inkling is a Content Framework for Rails 3, packaged as a Rails engine. It can be used to build knowledge management systems by leveraging Rails conventions.

Inkling features:
- An integrated, extensible dasbboard
- Site categorization and object creation via a Content Tree.
- 'acts_as_content' to incorporate standard ActiveRecord models as content types (for use in Content Tree). Controllers to CRUD your model and render it are loaded automatically by the system (following conventions)
- Devise authentication

Planned features:
- security
- workflows
- versioning


Also see Inkling-CMS: http://github.com/biv/inkling-cms. Inkling-CMS is an engine which uses the Inkling library to provide standard CMS functionality.

Inkling is in beta. See the Roadmap: http://wiki.github.com/biv/inkling/roadmap.

Installing
----------

Some quick instructions for setting up Inkling and Inkling-CMS to get an idea of what's being built.

Clone inkling and inkling-cms.

Go into inkling, run 'bundle install' (you'll need Ruby 1.9.x).

rake install


Go into inkling-cms, run 'bundle install' (you'll need Ruby 1.9.x).
rake install (take note of the route the installation doc tells you that you need to add)

cd testapp

edit the Gemfile and add the database gem you wish to use, e.g. sqlite.

bundle install

rails generate inkling

Configure your config/database.yml with a database for the test app. 

rake db:migrate 

rake inkling:init

Add this to the config/routes.rb in testapp

  match 'home', :to => 'inkling/home#dashboard', :as => "user_root"  

Then run

rails server

And visit

http://localhost:3000/inkling/user/sign_in

Email: admin@localhost.com
pass: test123

Go to the tree. Choose 'Page' from the drop down. Create the page, then visit it's public URL. 


Running The Tests
-----------------



EXTENDING INKLING
-----------------


Content Type
------------
For an example of a content type, see inkling_content or Inkling::Foo (in this project).

A generator for content types will be built at some stage, in the meantime, CTs follow some norms in Rails.

To create a Content Type:

* the model should act_as_content

class Acme::Mp3 < ActiveRecord::Base
  acts_as_content 'mp3'
end

The string arg. is optional, but provides a friendly name to use in the admin UI - a content creator will have the option to create an
'mp3'and not an 'Acme::Mp3'.

* the model should have a name field, preferably a String. This is used to make it addressable in a URL by site categorization.

Two controllers are presumed to exist:

class Admin::Mp3sController < Admin::Inkling::BaseController; end
class Mp3sController < Inkling::BaseController; end

The admin controller presumes CRUD methods (and routes) available for the model. The other controller is simply in charge
of rendering, and relies upon the 'show' method being implemented. When Inkling receives a request for an mp3 which is situated
in a folder somewhere in its site, it will call to the show method with an id.


Roles
-----

Inkling only specifies one role - administrator. The hosting app. is able to create more.

Roles & Authentication & Landing Page
-------------------------------------

Inkling uses Devise, which searches for a user_root_path and then defaults a root_path, in that order. Inkling defines a inkling_user_root route (run 'rake routes') to reach the Inkling dashboard. If you want authenticating users to land here, map user_root or root to this:

match 'home', :to => 'admin/inkling/home#dashboard', :as => "user_root"



Integrated Dashboard
--------------------

Each user lands on the dashboard - app/views/inkling/users/home#dashboard. Inkling scans all engines for this directory, looking for files with _dashboard. and rendering them as partials. Thus, if you want your engine to add its own section to the dashboard, create a partial.

For example, if you have written a blog content type, and want to offer blog links create app/views/inkling/users/home/_blog_dashboard.html.erb (or haml, etc.). This will be rendered within the dashboard.

Contributors
------------

Thanks to
* Clifford Heath (contributing installation docs + the command line binary that will be used to generate Content Type engines). May, 2010.

Copyright Notice
----------------
COPYRIGHT (c) 2010 Nicholas Faiz, Tree Falling In The Woods Pty Ltd.


Inkling code is copyrighted to Tree Falling In The Woods, Pty Ltd. and available under the MIT License.
It includes software from other projects, other people, listed below, all available through the MIT license.

* Ruby on Rails - http://rubyonrails.org - David Heinemeier Hansson, etc..
* better_nested_set - http://github.com/chris/better_nested_set - Copyright (c) 2006 Jean-Christophe Michel, Symétrie

The MIT License

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE

