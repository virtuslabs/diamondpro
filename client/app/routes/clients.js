import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
    package_type: {
      refreshModel: true
    }
  },
  model(params){
    return this.store.findAll('client', params);
  },
  actions: {
  error(error, transition) {
    if (error) {
      console.log(error)
    }
  }
}
});
