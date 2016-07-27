import Ember from 'ember';

// have to use currentPackage, not package as it is a reserved word
export default Ember.Route.extend({
  actions: {
    savePackage: function(currentPackage){
      currentPackage.save().then(() => this.transitionTo('packages.package', currentPackage.id))
    },
    deletePackage: function(currentPackage){
      let confirmation = confirm('Are you sure you want to delete this package?');

      if (confirmation) {
        currentPackage.destroyRecord().then(() => this.transitionTo('packages'));
      }
    }
  }
});
