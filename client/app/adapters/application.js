import config from '../config/environment';
import DS from 'ember-data';

export default DS.RESTAdapter.extend({
  host: config.apiHost,
  namespace: 'api',
  buildURL: function(modelName, id, snapshot, requestType, query) {
    switch (requestType) {
      case 'findRecord':
        return this.urlForFindRecord(id, modelName, snapshot);
      case 'findAll':
        return this.urlForFindAll(modelName);
      case 'query':
        return this.urlForQuery(query, modelName);
      case 'queryRecord':
        return this.urlForQueryRecord(query, modelName);
      case 'findMany':
        return this.urlForFindMany(id, modelName, snapshot);
      case 'findHasMany':
        return this.urlForFindHasMany(id, modelName);
      case 'findBelongsTo':
        return this.urlForFindBelongsTo(id, modelName);
      case 'createRecord':
        return config.apiHost + '/' + config.apiNamespace + '/admin/' + Ember.String.pluralize(modelName) +'/' + id;
        // return this.urlForCreateRecord(modelName, snapshot);
      case 'updateRecord':
        return config.apiHost + '/' + config.apiNamespace + '/admin/' + Ember.String.pluralize(modelName) +'/' + id;
        // return this.urlForUpdateRecord(id, modelName, snapshot);
      case 'deleteRecord':
        return config.apiHost + '/' + config.apiNamespace + '/admin/' + Ember.String.pluralize(modelName) +'/' + id;
        // return this.urlForDeleteRecord(id, modelName, snapshot);
      default:
        return this._buildURL(modelName, id);
    }
  }
});
