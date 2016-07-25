import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    return this.store.findAll('client');
  },
  actions: {
  error(error, transition) {
    if (error) {
      console.log(error)
    }
  }
}
});
