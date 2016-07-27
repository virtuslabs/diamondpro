import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('client');
  },

  actions: {

    saveClient(newClient) {
      newClient.save().then(() => this.transitionTo('clients'));
    },

    willTransition() {
      // rollbackAttributes() removes the record from the store
      // if the model 'isNew'
      this.controller.get('model').rollbackAttributes();
    }
  }
});
