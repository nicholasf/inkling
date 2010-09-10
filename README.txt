What is an Inkling? Something polymorphous with ink on it. What is Inkling? A meta-home for such things.

Or, Inkling is a framework for Rails 3 providing a DSL and services for defining your own knowledge management system. It even has one of those - Inkling-CMS: http://github.com/biv/inkling-cms.

Feature Overview
----------------

Types:

Have your own ActiveRecord object 'acts_as_inkling' and it will be included in the system with services like menuing, security, routing, workflows, and versioning.

Namespacing:

Because Inkling and its extensions are engines with sane namespacing, they'll work happily with other Ruby libraries which have things called Users or Permissions, etc.! All tables are namespaced - e.g. inkling_users - to avoid collision with other tables - e.g. the user table of an ecommerce app..

Dashboard:

Create a partial (_.+*_dashboard.+*) in your app and it will be automatically included in the dashboard. So you can extend the interface for your own users and integrate whatever you like.

Tree:

A tree UI presents the arrangement of all types in the system, letting users drag and drop types, create news ones, edit them, etc..

Permissioning:

There's one default role, the administrator, that can do everything. But you can create others, and give them permissions (to, say, create but not delete images). You can also create new permissions and new roles for your own extensions. (Inkling uses CanCan)

Devise Authentication:

The authentication system can be turned on or off (you would turn it off to integrate it within your own app's authentication). It uses Devise (see http://github.com/plataformatec/devise)

Workflow API: (coming)

A simple default Workflow - draft -> publish - is included for most objects, but you can define your own and attach them to any inkling type.


Inkling is still in beta. See the Roadmap: http://wiki.github.com/biv/inkling/roadmap.


The documentation below is a work in progress and will be revised at some point. The Installing advice is current.

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
Inkling is an engine and needs a Rails application to execute its tests against. Tests (rspec examples and cucumber features) are kept in the top level engine directory, and symlinked into the testapp/spec and testapp/featured directories.

To run the tests:

cd testapp

rake inkling:megatest #(a custom task which runs the environment, rspec, then features)


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

Two controllers are presumed to exist, one to let permitted users manage the object (CRUD):

class Inkling::ContentTypes::Mp3sController < Inkling::BaseController
end

And another with a show method capable of rendering it:

class Inkling::Mp3sController < Inkling::BaseController; end

These namespaces are presumed to exist, although options may appear later for other namespaces.

The admin controller presumes CRUD methods (and routes) available for the model. The other controller is simply in charge
of rendering, and relies upon the 'show' method being implemented. When Inkling receives a request for an mp3 which is situated
in a folder somewhere in its site, it will call to the show method with an id.

Your content type is automatically included in the Content Tree. If you wish to restrict what types of content can be placed directly beneath it,
implement the restricts method on your content object.

For example,

class Acme::Mp3 < ActiveRecord::Base
  acts_as_content 'mp3'
  
  def restricts(content)
    unless content.is_a? Acme::MusicVideo
      [true, "MP3s can only include Music Videos."]
    end
  end
end


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

