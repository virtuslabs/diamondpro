import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['package_type'],
  package_type: null,

  filteredPackages: Ember.computed('package_type', 'model', function() {
    var packages = this.get('model');

    if (package_type) {
      return packages.filterBy('package_type', package_type);
    } else {
      return packages;
    }
  })
});
