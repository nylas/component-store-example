
window.MessageStore = Reflux.createStore({

  init: function() {
    this.listenTo(DataStore, this._onDataChange);
    this.listenTo(Actions.selectMessage, this._onSelectMessage);

    this._items = DataStore.itemsMatching({object:'message'})
    this._selected = null;
  },

  items: function() {
    return this._items;
  },

  selected: function() {
    return this._selected;
  },

  _onDataChange: function() {
    this._items = DataStore.itemsMatching({object:'message'})
    this.trigger();
  },

  _onSelectMessage: function(message) {
    this._selected = message;
    this.trigger();
  }
});
