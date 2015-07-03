
// Ideally, the DataStore would return immutable objects,
// and be backed by something like IndexedDB in localstorage.
//
// For the purposes of this example, it just stores objects
// in a flat array.
//
window.DataStore = Reflux.createStore({

  init: function() {
    this.listenTo(Actions.persistData, this.persist);

    this._items = [{
      id: _.uniqueId('message_'),
      object: 'message',
      from: 'evan@nylas.com',
      subject: 'Hello World!',
      unread: true
    },{
      id: _.uniqueId('message_'),
      object: 'message',
      from: 'ben@nylas.com',
      subject: 'Hi from React Europe',
      unread: true
    },{
      id: _.uniqueId('message_'),
      object: 'message',
      from: 'no-reply@airfrance.com',
      subject: 'Your AirFrance Itinerary',
      unread: false
    },{
      id: _.uniqueId('message_'),
      object: 'message',
      from: 'no-reply@hotels.com',
      subject: 'Your Hotel Resevation',
      unread: false
    },{
      id: _.uniqueId('contact_'),
      object: 'contact',
      name: 'Ben',
      email: 'ben@nylas.com',
      unread: true
    }];
  },

  itemsMatching: function(attributes) {
    return _.where(this._items, attributes);
  },

  persist: function(model) {
    var idx = _.findIndex(this._items, _.matcher({id: model.id}));

    if (idx != -1) {
      this._items[idx] = model;
    } else {
      this._items.push(model);
    }

    this.trigger();
  }

});
