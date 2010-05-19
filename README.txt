Under construction.

Inkling is a Content Framework for Rails 3. As opposed to a CMS, a CF focuses on building services for Content Types which the developer supplies.
These services will be security, site structure and content categorization, versioning, & workflow. Rails provides a richf ramework for building CRUD applications - which will easily plug into Inkling as Content Types.

Inkling follows the opinions of Rails to let devs develop their own Content Types - models with controllers for creating and displaying content - and plug them into the framework.

Inkling will also have its own set of Content Types, available in a separate gem, so it can function as a readymade CMS - see inkling_content. The essential idea is to provide the framework, and let Rails developers be clever about what they wish to plug into it.

Installing
----------

Inkling uses Rails 3, which is still in prerelease. It requires ruby 1.8.7 at least. You'll need to google for the current installation procedure, because it's continually changing. When you've worked through that, you also need to install the pre-release version of RSpec from http://github.com/rspec/rspec-rails/

gem install rspec-rails --pre

You'll also need pg if you use the default Postgres database.

Make sure you have these gems installed:
cucumber-rails
ruby-debug
bundler (requires launchy, capybara, spork)

To run the testapp from a git clone, you will also need to have installed an inkling gem to keep Bundler happy. The installed gem doesn't get used, but must exist in your gem path (the actual path is overridden to point at the local directory).

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
* better_nested_set - http://github.com/chris/better_nested_set - Copyright (c) 2006 Jean-Christophe Michel, SymŽtrie

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

