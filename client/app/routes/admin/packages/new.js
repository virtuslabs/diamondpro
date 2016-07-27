import Ember from 'ember';

export default Ember.Route.extend({
  model() {
    return this.store.createRecord('package');
  },

  actions: {

    saveClient(newPackage) {
      newPackage.save().then(() => this.transitionTo('packages'));
    },

    willTransition() {
      // rollbackAttributes() removes the record from the store
      // if the model 'isNew'
      this.controller.get('model').rollbackAttributes();
    }
  }
});
