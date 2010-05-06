Under construction.

Inkling will be a Content Framework for Rails 3.


TODO
----

Inkling
2. As a dev I have provided CRUD permissioning which is stored by roles on folders.
3. As a dev I have provided a user & community/group & role API.
4. As a dev I have provided a clean & popular authentication layer.
5. As a dev I have provided a simple API for workflow, which may be extended, but will initially be draft/publish and role restricted.
6. As a dev I can create a content extension, which groups content types, and have it recognized in the system. (this can wait until you
have basic CMS functionality with inkling-content).


Inkling-Content (currently Inkling page)
1. As a dev I have created a polished page type with ckeditor for WYSIWYG.


Docs.

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
