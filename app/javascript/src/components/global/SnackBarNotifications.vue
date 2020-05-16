<template>
  <v-snackbar v-model="snack.show" top :color="snack.type">
    {{message}}
    <v-btn icon dark text @click="closeSnackbar">
      <v-icon>close</v-icon>
    </v-btn>
  </v-snackbar>
</template>

<script>
  import { mapGetters } from 'vuex';

  export default {
    name: 'SnackBarNotifications',
    data: () => {
      return {
        snack: {
          show: false,
          message: '',
          type: 'success',
        },
      };
    },
    created() {
      this.$store.watch(state => state.global.snack.message, () => {
        const snack = this.$store.state.global.snack;
        if (snack.message !== '' && snack.message !== undefined) {
          this.snack.message = snack.message;
          this.snack.show = true;

          if (snack.type) {
            this.snack.type = snack.type;
          }

          this.$store.commit('global/SET_SNACK', {}, { root: true });
        }
      });
    },
    computed: {
      ...mapGetters({
        getSnack: 'global/getSnack',
      }),
      message() {
        if (this.snack.message) {
          return this.$i18n.t(`global.snackMessages.${this.snack.message}`);
        }
      },
    },
    methods: {
      closeSnackbar() {
        this.snack.show = false;
      },
    },
  };
</script>