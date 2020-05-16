import { SET_SNACK } from './action-types';

export default {
  [SET_SNACK]: (state, snack) => {
    state.snack = snack;
  },
};