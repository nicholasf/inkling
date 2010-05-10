Under construction.

Inkling will be a Content Framework for Rails 3. As opposed to a CMS, a CF focuses on building services for Content Types which the developer supplies.
These services will be security, site structure and content categorization, versioning, & workflow. Rails provides a rich
framework for building CRUD applications - which will easily plug into Inkling as Content Types.


Inkling will have its own set of Content Types, so it can function as a readymade CMS - see inkling-page.


* Docs - I'm generating doc. as I go. No functionality is finished yet ...

Content Type
------------
For an example of a content type, see inkling_page.

To create a Content Type:

* the model should be polymorphic and include Inkling::Content.

class Foo < ActiveRecord::Base
  acts_as_content
end

For the controller ... 

If you are interested in seeing the planning of the project - see issues.txt


Licensing
---------

COPYRIGHT (c) 2010 Nicholas Faiz, Tree Falling In The Woods Pty Ltd.


Inkling code is copyrighted to Tree Falling In The Woods, Pty Ltd. and available under the MIT License.
It includes software from other projects, listed below, all available through the MIT license.

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

