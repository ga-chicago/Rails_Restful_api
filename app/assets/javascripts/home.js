// #people-template
// #people-list

var app = app || {};
var active = active || {};

//blueprints
app.model = Backbone.Model.extend();
app.collection = Backbone.Collection.extend({
  model: app.model,
  url: '/api/people'
});
app.modelView = Backbone.View.extend({
  initialize: function() {
    // every modelView should have a model
    //this.model
    this.template = _.template($('#people-template').html());
    this.render();
  },
  render: function() {
    var data = this.model.attributes;
    this.$el.append(this.template(data));
  }
});
app.collectionView = Backbone.View.extend({
  initialize: function() {
    var that = this;
    // every collectionView should have a collection
    this.collection.on('sync', function() {
      that.render();
    });
    // retrieve data from my API 'all get' route
    this.collection.fetch();
    this.$el.html(''); // empty out any content inside of my $el
  },
  render: function() {
    var collection = this.collection.models;
    for (var model in collection) {
      //console.log(collection[model].attributes);
      // memory purposes
      new app.modelView({
        el: $('#people-list'),
        model: collection[model]
      });
    }
  }
});
//end blueprints

$(document).ready(function(event) {

  // instantiate collection + collectionView
  active.collection = new app.collection();
  active.collectionView = new app.collectionView({
    collection: active.collection,
    el: $('#people-list')
  });

});
