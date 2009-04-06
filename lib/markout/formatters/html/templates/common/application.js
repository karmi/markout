// application.js

if ("undefined" == typeof console) var console = { log : function(what) {} }

// * Add initialize() handler
$(document).ready( function() { try {Application.initialize()} catch(e) { alert('Error when initializing application! \n' + e); } });


Application = {
  
  initialize: function(options) {
    
    this.options = options;

    Application.History.initialize();

    // # Debug
    // console.log(this);
  },

  // --------- History ----------------------------------------------------------------
  History : {
    initialize : function() {
      $('#history .revision').removeClass('expanded').find('.detail').hide();
      this.__expand_revision_from_location_hash();
      this.__add_handlers();
    },
    __add_handlers : function() {
      $('#history .revision').click( function() { Application.History.Revision.toggle_details($(this)); } )
    },
    __expand_revision_from_location_hash : function() {
      if (window.location.hash && window.location.hash != '') {
        var result = window.location.hash.match(/#revision_[a-z0-9]+/);
        if (result) { this.Revision.__show_details(result[0]); }
      }
    },

    Revision : {
      active : null,
      toggle_details : function(element) {
        var o = $(element);
        if ( 'undefined' == typeof o ) { return false; }
        if ( this.active && o.attr('id') == this.active.attr('id')) { Application.History.Revision.__update_location(); }
        if ( o.hasClass("expanded") ) {
          this.__hide_details(o);
        } else {
          this.__show_details(o);
        }
      },
      __hide_details : function(element) {
        var o = $(element);
        if ( 'undefined' == typeof o ) { return false; }
        o.removeClass('expanded').find('.detail').hide();
      },
      __show_details : function(element) {
        var o = $(element);
        if ( 'undefined' == typeof o ) { return false; }
        this.__hide_details(this.active);
        o.addClass('expanded').find('.detail').toggle('normal', function() { Application.History.Revision.__update_location(o) } );
        this.active = o;
      },
      __update_location : function(element) {
        if (element) {
          window.location.hash = "#" + $(element).attr('id');
        } else {
          window.location.hash = '#history';
        }
      }
    }
  }
  
};