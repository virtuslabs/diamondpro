import Ember from 'ember';

// have to use currentPackage, not package as it is a reserved word
export default Ember.Route.extend({
  model(params){
    return this.store.find('package', params.package_id);
  },
  actions: {
    savePackage: function(currentPackage){
      // alert(currentPackage.id);
      currentPackage.save().then(() => this.transitionTo('admin.packages.package', currentPackage.id))
    },
    deletePackage: function(currentPackage){
      let confirmation = confirm('Are you sure you want to delete this package?');

      if (confirmation) {
        currentPackage.destroyRecord().then(() => this.transitionTo('admin.packages'));
      }
    }
  }
});
