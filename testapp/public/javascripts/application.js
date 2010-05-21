// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// from http://awesomeful.net/posts/47-sortable-lists-with-jquery-in-rails
// This sets up the proper header for rails to understand the request type,
// and therefore properly respond to js requests (via respond_to block, for example)
$.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

$(document).ready(function() {

  // UJS authenticity token fix: add the authenticy_token parameter
  // expected by any Rails POST request.
  $(document).ajaxSend(function(event, request, settings) {
    // do nothing if this is a GET request. Rails doesn't need
    // the authenticity token, and IE converts the request method
    // to POST, just because - with love from redmond.
    if (settings.type == 'GET') return;
    if (typeof(AUTH_TOKEN) == "undefined") return;
    settings.data = settings.data || "";
    settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
  });

});
