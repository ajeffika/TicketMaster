import api from '@/api';

export default {
  // ToDo move it to translation
  getMessage: field => `${field} jest zajęty.`,
  validate(value, field) {
    const splittedField = field[0].split('-');
    const model = splittedField[0];
    const attribute = splittedField[1];
    return api.post('validations/validate-uniqueness',
      { value: value, attribute: attribute, model: model },
    ).then((response) => {
      return { valid: response.data.valid };
    });
  },
};
