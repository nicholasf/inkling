Under construction.

Inkling will be a Content Framework for Rails 3. As opposed to a CMS, a CF focuses on building services for Content Types which the developer supplies.
These services will be security, site structure and content categorization, versioning, & workflow. Rails provides a rich
framework for building CRUD applications - which will easily plug into Inkling as Content Types.


Inkling will have its own set of Content Types, so it can function as a readymade CMS - see inkling-page.


* Docs

Content Type
------------
For an example of a content type, see inkling_page.

To create a Content Type:

* the model should be polymorphic and include Inkling::Content.

class Foo
    include Inkling::Content
    belongs_to :content, :polymorphic => true
end




* Dev. Notes


TODO
----

Inkling stories

1. as a dev I have provided content type recognition
1a. once prototyped, create class methods for models to become content - e.g acts_as_content

2. As a dev I have provided CRUD permissioning which is stored by roles on folders.
2a. As a dev I have CRUD for folders

3. As a dev I have provided a user & community/group & role API.
4. As a dev I have provided a clean & popular authentication layer.
5. As a dev I have provided a simple API for workflow, which may be extended, but will initially be draft/publish and role restricted.
6. As a dev I can create a content extension, which groups content types, and have it recognized in the system. (this can wait until you
have basic CMS functionality with inkling-content).
7. As a dev I have CRUD for the site object's informative properties.
7a. As a dev I have multi-site capabilities
8. As a dev I have planned for a themeable layer, possibly the admin UI.



Inkling-Content (currently Inkling page)
1. As a dev I have created a polished page type with ckeditor for WYSIWYG.


Outstanding Issues
------------------

* Engine generator isn't being hooked into initialization process for generating migrations. Check on this.
* validator on folder_entry to ensure that only folders can be nested


Security
--------
Roles - guest, member, admin. (roles can be made)

Each Folder has CRUD assignments to roles - so R for guest, member, admin, is accessible content for everyone. If it's D
for admins, only admins can delete what is in that folder. These rules define all access across the application, at the
front and the back cms admin area (e.g. if a content editor role is invented, and a content editor wants to edit a page
in the CMS admin, only pages in folders with RU will be presented in the controller).


Workflow
--------

In the first draft, forget it. Just hack a visible, invisible boolean, which you'll drop as soon as you have security working
(when you can turn to workflow).

Workflows will be content specific, i.e.

Plan is to have a proper workflow.

workflows [:name, :id] -> workflow_states [:name, :position(list)] -> workflow_roles [:role_id, :position (list)]
workflow_assignments [:workflow_id, :content_id]

Each workflow_state, in order, must be progressed, in order, by each workflow_role. Workflows are applied to folders.

Site
----
Multi-site functionality will wrap everything.

A site:

sites[:name, :path, :description, :user_id], 
site_users [:site_id, :user_id], site_groups[:site_id, group_id], site_roles[:site_id, role_id]

Roles, users, and groups will be universal, but will be configured to have site access. So you can reuse them across sites.



Theming
-------

Theming is three things, (1) the location of layouts and views and (2) the information architecture of content blocks, (3)
CSS.

(1) - look into load paths for views. Mephisto did this. Rails 3 will make it easier.
(2) - prototype via scaffold or a rough view for the moment. When you have admin functionality mapped, clean up
with neat grouping of menus/partial rendering, etc., document, and it should be themable, in theory.
(3) - Simply use clear classes, etc.?


Licensing
---------

COPYRIGHT (c) 2010 Nicholas Faiz, Tree Falling In The Woods Pty Ltd.


Inkling code is copyrighted to Tree Falling In The Woods, Pty Ltd. and available under the MIT License.
It includes software from other projects, listed below, all available through the MIT license.

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

