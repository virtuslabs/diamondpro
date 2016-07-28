import Ember from 'ember';

export default Ember.Controller.extend({
  queryParams: ['package_type'],
  package_type: null,
  is_cars_trucks: Ember.computed("package_type",function(){
    return this.get("package_type")==="cars_trucks"? true: false;
  }),
  is_rvs_motorhomes: Ember.computed("package_type",function(){
    return this.get("package_type")==="rv_motorhome"? true: false;
  }),
  is_boats_pwc: Ember.computed("package_type",function(){
    return this.get("package_type")==="boats_pwc"? true: false;
  }),
  // filteredPackages: Ember.computed('package_type', 'model', function() {
  //   var package_type = this.get('package_type');
  //   var packages = this.get('model');
  //
  //   if (package_type) {
  //     return packages.filterBy('package_type', package_type);
  //   } else {
  //     return packages;
  //   }
  // })
});
